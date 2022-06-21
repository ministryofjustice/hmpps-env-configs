vpc_supernet = "10.162.80.0/20"

aws_nameserver = "10.162.80.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "Z14TS04OV5430N"

#lambda auto start stop vars
ec2_schedule                 = "true"
autoscaling_schedule         = "true"
rds_schedule                 = "true"
calendar_rule_enabled        = "true"
autostop_notify_rule_enabled = "true"
tagged_user                  = "<@U76HZPL7R>"
channel                      = "auto-stop-alerts"
create_autostop_instance     = "true"

# oracle_backup_schedule should be specified using the Europe/London timezone (i.e DST is handled automatically)
oracle_backup_schedule = {
  delius = {
    daily_schedule  = "30 06 ? * 3-6 *"
    weekly_schedule = "30 06 ? * 2 *"
  }
}

oracle_delete_unused_dbids = "yes"

oracle_rotate_passwords_schedule = {
    schedule_expression   =  "00 16 ? * TUE *"
}