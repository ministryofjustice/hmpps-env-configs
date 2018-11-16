from ansible import errors


def strip(string, chars):
    """
    :param string: string to remove chars from
    :param chars: characters to remove as string constant
    :return: string
    """
    return string.strip(chars)


def rstrip(string, chars):
    """
    :param string: string to remove chars from
    :param chars: characters to remove as string constant
    :return: string
    """
    return string.rstrip(chars)


def lstrip(string, chars):
    """
    :param string: string to remove chars from
    :param chars: characters to remove as string constant
    :return: string
    """
    return string.lstrip(chars)


def merge_config_dictionaries(*dicts):
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


class FilterModule(object):

    def filters(self):
        filter_list = {
            'strip': strip,
            'rstrip': rstrip,
            'lstrip': lstrip,
            'merge_config_dictionaries': merge_config_dictionaries
        }
        return filter_list
