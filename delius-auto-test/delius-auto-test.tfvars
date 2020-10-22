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

oracle_backup_schedule = {
  delius = {
    daily_schedule  = "30 05 ? * 2-5 *"
    weekly_schedule = "30 05 ? * 1 *"
  },
  mis = {
    daily_schedule  = "30 05 ? * 2-5 *"
    weekly_schedule = "30 05 ? * 1 *"
  }
}