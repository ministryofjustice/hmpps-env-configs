vpc_supernet = "10.162.128.0/20"

aws_nameserver = "10.162.128.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "Z04872702A169WT5DDQJO"

#lambda auto start stop vars
ec2_schedule                         = "true"
autoscaling_schedule                 = "true"
calendar_rule_enabled                = "true"
autostop_notify_rule_enabled         = "true"
create_autostop_instance             = "true"
mis_overide_autostop_tags            = "True"     ##Set autostop tag key value for MIS Servers

oracle_backup_schedule = {
  delius = {
    daily_schedule  = "30 05 ? * 3-6 *"
    weekly_schedule = "30 05 ? * 2 *"
  },
  mis = {
    daily_schedule  = "30 05 ? * 3-6 *"
    weekly_schedule = "30 05 ? * 2 *"
  },
  misboe = {
    daily_schedule  = "30 05 ? * 3-6 *"
    weekly_schedule = "30 05 ? * 2 *"
  },
  misdsd = {
    daily_schedule  = "30 05 ? * 3-6 *"
    weekly_schedule = "30 05 ? * 2 *"
  }
}

oracle_delete_unused_dbids = "yes"

database_high_availability_count = {
  delius = 2
  mis    = 2
  misboe = 2
  misdsd = 2
}

# Times are GMT
oracle_rotate_passwords_schedule = {
    schedule_expression   =  "50 14 ? * WED *"
}