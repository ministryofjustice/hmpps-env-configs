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

egress_443 = true
egress_80 = true

#Instance size for smtp server
smtp_instance_type = "m5.xlarge"

oracle_backup_schedule = {
  delius = {
    daily_schedule  = "00 00 ? * 2-7 *"
    weekly_schedule = "00 02 ? * 1 *"
  },
  mis = {
    daily_schedule  = "00 03 ? * 2-7 *"
    weekly_schedule = "00 02 ? * 1 *"
  },
  misboe = {
    daily_schedule  = "00 03 ? * 2-7 *"
    weekly_schedule = "00 02 ? * 1 *"
  },
  misdsd = {
    daily_schedule  = "00 03 ? * 2-7 *"
    weekly_schedule = "00 02 ? * 1 *"
  }
}

oracle_delete_unused_dbids = "no"

database_high_availability_count = {
  delius = 1
  mis    = 0
  misboe = 0
  misdsd = 0
}