vpc_supernet = "10.161.20.0/22"

aws_nameserver = "10.161.20.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "Z3JN6545N8RW90"


#lambda auto start stop vars
ec2_schedule                 = "true"
rds_schedule                 = "true"
autoscaling_schedule         = "true"
calendar_rule_enabled        = "true"
autostop_notify_rule_enabled = "true"
create_autostop_instance     = "true"

# oracle_backup_schedule should be specified using the Europe/London timezone (i.e DST is handled automatically)
oracle_backup_schedule = {
  delius = {
    daily_schedule  = "30 06 ? * 2,3,5,6 *"
    weekly_schedule = "30 06 ? * 4 *"
  }
}

oracle_validate_backup_schedule = {
  delius = {
    host     = "Random Delius Standby"
    schedule = "00 16 ? * MON *"
  }
}

database_high_availability_count = {
  delius = 2
  mis    = 0
  misboe = 0
  misdsd = 0
}

oracle_delete_unused_dbids = "yes"

oracle_rotate_passwords_schedule = {
  schedule_expression = "00 9 ? * TUE *"
}

offloc_rotate_password_schedule = {
  schedule_expression = ""
}

# GDPR
gdpr_config = {
  db_storage = 100
}
