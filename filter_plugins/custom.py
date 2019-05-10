from ansible import errors


def merge_config_dictionaries(*dictionary_list):
    """
    Merges n dictionaries of configuration data
    :param dictionary_list: list
    :return dict:
    example usage set_fact: my_dictionary=>"{{ my_dictionary| merge_config_dictionaries([config_1, config_n) }}"
    """
    res_dict = {}

    print type(dictionary_list)

    if isinstance(dictionary_list, tuple    ):
        if len(dictionary_list) == 1 and isinstance(dictionary_list[0], dict):
            return dictionary_list[0]
        else:
            for dictionary in dictionary_list:
                if isinstance(dictionary, dict):
                    res_dict.update(dictionary)
    else:
        raise TypeError("We expect a list of dictionaries")
    return res_dict


def merge_dictionaries(*dicts):
    """
    Merges n dictionaries of configuration data
    :param list<dicts>:
    :return dict:
    Merges n dictionaries passed in as arguments, dictionaries will be overwritten in FIFO order
    """
    try:
        return {k: v for d in dicts for k, v in d.items()}
    except AttributeError as exep:
        print("Only dictionaries are supported as an argument list")
        print(exep)


def list_intersect(first, second):
    """
    Returns elements found in first that are in second
    :param first:
    :param second:
    :return:
    """
    second = set(second)
    return [item for item in first if item in second]


def merge_custom_app_data(src=[{}], destination=[{}]):
    """
    :param src:
    :param destination:
    :return [{}]:
    Merges two lists
    """

    src_names = []
    dest_names = []

    for elem in src:
        if 'name' in elem:
            src_names.append(elem['name'])

    for elem in destination:
        if 'name' in elem:
            dest_names.append(elem['name'])

    # intersects = list_intersect(src_names, dest_names)

    # if intersects:
    #     raise errors.AnsibleFilterError(
    #         'Keys {} are duplicated in source and destination lists'.
    #             format(list(set(intersects)))
    #     )

    result = src
    result += destination
    return result


def merge_yaml(user, default):
    if isinstance(user, dict) and isinstance(default, dict):
        for k, v in default.iteritems():
            if k not in user:
                user[k] = v
            else:
                user[k] = merge_yaml(user[k],v)
    return user


def update(l1, l2):
    l1.extend(l2[:])


def update_explicit(user, default, path=""):
    res = default.copy()
    update(res['stuff'][0]['products'], user['stuff'][0]['products'])

    res.update(user)
    return res


def merge_and_update_dictionary(user, default):
    merged = default.copy()

    count = 0
    for item in user['products']:
        if merged['products'][count]['name'] == item['name']:
            print item
            merged['products'][count] = item
        else:
            merged['products'].append(item)
        count += 1

    return merged


class FilterModule(object):
    def filters(self):
        filter_list = {
            'merge_config_dictionaries': merge_config_dictionaries,
            'merge_dictionaries': merge_dictionaries,
            'merge_custom_app_data': merge_custom_app_data,
            'merge_yaml': merge_yaml,
            'update_explicit': update_explicit,
            'merge_and_update_dictionary': merge_and_update_dictionary
        }
        return filter_list
