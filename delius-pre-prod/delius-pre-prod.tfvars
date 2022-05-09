vpc_supernet = "10.160.0.0/20"

aws_nameserver = "10.160.0.2"

public_ssl_arn = ""

## lambda auto start stop vars
## Autostop will only be enabled for MIS Windows servers and MIS Oracle Databases
ec2_schedule                         = "true"
calendar_rule_enabled                = "true"

## Due to requirement to enable autostop for a subset of MIS resources below vars have been added to target the correct resources only
## As the autostop key value is defined on env level, the below are to override the tag accordingly
## This only applies to environments where MIS is present
delius_overide_autostop_tags         = "False"    ##Override Phase1 autostop tag key value for Oracle Primary Servers
mis_overide_autostop_tags            = "True"     ##Set autostop tag key value for MIS Servers


## Delius Core Specific

instance_type_db = "t2.large"

#Instance size for smtp server
smtp_instance_type = "m5.large"

oracle_backup_schedule = {
  delius = {
    daily_schedule  = "00 02 ? * 2-7 *"
    weekly_schedule = "00 01 ? * 1 *"
  },
  mis = {
    daily_schedule  = "00 02 ? * 2-7 *"
    weekly_schedule = "00 05 ? * 1 *"
  },
  misboe = {
    daily_schedule  = "00 02 ? * 2-7 *"
    weekly_schedule = "00 05 ? * 1 *"
  },
  misdsd = {
    daily_schedule  = "00 02 ? * 2-7 *"
    weekly_schedule = "00 05 ? * 1 *"
  }
}

oracle_validate_backup_schedule = {
  delius = {
    host     = "delius_standbydb2"
    schedule = "00 07 ? * 5 *"
  },
  mis = {
    host     = "mis_standbydb2"
    schedule = "00 07 ? * 5 *"
  },
  misboe = {
    host     = "misboe_standbydb2"
    schedule = "00 07 ? * 5 *"
  }
  misdsd = {
    host     = "misdsd_standbydb2"
    schedule = "00 07 ? * 5 *"
  }
}

oracle_delete_unused_dbids = "yes"
