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
    daily_schedule  = "30 06 ? * 2-5 *"
    weekly_schedule = "30 06 ? * 1 *"
  }
}