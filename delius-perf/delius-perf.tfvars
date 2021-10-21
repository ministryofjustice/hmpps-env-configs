vpc_supernet = "10.160.48.0/20"

aws_nameserver = "10.160.48.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "Z2B72ITPJW013I"

public_ssl_arn = ""

## Delius Core Specific

instance_type_db = "t2.large"

#Instance size for smtp server
smtp_instance_type = "m5.large"



#lambda auto start stop vars
ec2_schedule                 = "true"
autoscaling_schedule         = "true"
calendar_rule_enabled        = "true"
autostop_notify_rule_enabled = "true"
create_autostop_instance     = "true"

database_high_availability_count = {
  delius = 1
  mis    = 0
  misboe = 0
  misdsd = 0
}

# Define Weekly Schedule for Running Oracle Database Duplicate from Prod to Perf for the Delius DB
oracle_duplicate_schedule = {
  delius = {
    target_host     = "delius_primarydb"
    source_db       = "PRDNDA"
    source_bucket   = "eu-west-2-del-prod-oracledb-backups"
    schedule       =  "00 17 ? * 6 *"
  }
}
