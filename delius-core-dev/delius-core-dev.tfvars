vpc_supernet = "10.161.20.0/22"

aws_nameserver = "10.161.20.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "Z3JN6545N8RW90"


#lambda auto start stop vars
ec2_schedule                         = "true"
autoscaling_schedule                 = "true"
calendar_rule_enabled                = "true"
autostop_notify_rule_enabled         = "true"
create_autostop_instance             = "true"

oracle_backup_schedule = {
  delius = {
    daily_schedule  = "30 05 ? * 3-6 *"
    weekly_schedule = "30 05 ? * 2 *"
  }
}

database_high_availability_count = {
  delius = 2
  mis    = 0
  misboe = 0
  misdsd = 0
}

oracle_delete_unused_dbids = "yes"
