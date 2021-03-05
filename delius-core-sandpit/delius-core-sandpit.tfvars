vpc_supernet = "10.161.4.0/22"

aws_nameserver = "10.161.4.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "ZWRS0ZWYX7JX9"

#lambda auto start stop vars
ec2_schedule                         = "true"
autoscaling_schedule                 = "true"
calendar_rule_enabled                = "true"
autostop_notify_rule_enabled         = "true"
create_autostop_instance             = "true"

oracle_backup_schedule = {
  delius = {
    daily_schedule  = "20 10 ? * 3-6 *"
    weekly_schedule = "30 06 ? * 2 *"
  }
}

oracle_validate_backup_schedule = {
  delius = {
    host     =  "delius_primarydb"
    schedule =  "46 14 ? * 2,4,6 *"
  }
}

# oracle_delete_unused_dbids = "yes"

database_high_availability_count = {
  delius = 2
  mis    = 0
  misboe = 0
  misdsd = 0
}
