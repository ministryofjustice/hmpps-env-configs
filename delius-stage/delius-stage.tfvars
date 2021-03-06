vpc_supernet = "10.160.32.0/20"

aws_nameserver = "10.160.32.2"

public_ssl_arn = ""

## ## example output from the delius-network-terraform build
## strategic_public_zone_id = [
##     EXAMPLE67XHV
## ]

route53_strategic_hosted_zone_id = "Z3GRI9GET5CFF7"


## Delius Core Specific

instance_type_db = "t2.large"

#Instance size for smtp server
smtp_instance_type = "m5.xlarge"

oracle_backup_schedule = {
  delius = {
    daily_schedule  = "00 23 ? * 1-6 *"
    weekly_schedule = "00 01 ? * 1 *"
  },
  mis = {
    daily_schedule  = "00 02 ? * 2-7 *"
    weekly_schedule = "00 01 ? * 1 *"
  },
  misboe = {
    daily_schedule  = "00 02 ? * 2-7 *"
    weekly_schedule = "00 01 ? * 1 *"
  },
  misdsd = {
    daily_schedule  = "00 02 ? * 2-7 *"
    weekly_schedule = "00 01 ? * 1 *"
  }
}

oracle_delete_unused_dbids = "yes"

database_high_availability_count = {
  delius = 1
  mis    = 0
  misboe = 0
  misdsd = 0
}