vpc_supernet = "10.160.0.0/20"

aws_nameserver = "10.160.0.2"

public_ssl_arn = ""

## Delius Core Specific

instance_type_db = "t2.large"

#Instance size for smtp server
smtp_instance_type = "m5.xlarge"

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
    schedule = "00 08 ? * 5 *"
  },
  mis = {
    host     = "mis_standbydb2"
    schedule = "00 08 ? * 5 *"
  },
  misboe = {
    host     = "misboe_standbydb2"
    schedule = "00 08 ? * 5 *"
  }
  misdsd = {
    host     = "misdsd_standbydb2"
    schedule = "00 08 ? * 5 *"
  }
}

oracle_delete_unused_dbids = "yes"