vpc_supernet = "10.162.64.0/20"

aws_nameserver = "10.162.64.2"

# Moved from spg.tfvars
# Retrieved from network vpc terraform
route53_strategic_hosted_zone_id = "Z09133233G9YHQVEMRNQ7"

#lambda auto start stop vars
ec2_schedule                         = "true"
autoscaling_schedule                 = "true"
calendar_rule_enabled                = "true"
autostop_notify_rule_enabled         = "true"
create_autostop_instance             = "true"
mis_overide_autostop_tags            = "True"     ##Set autostop tag key value for MIS Servers

oracle_backup_schedule = {
  delius = {
    daily_schedule  = "30 06 ? * 3-6 *"
    weekly_schedule = "30 06 ? * 2 *"
  },
  mis = {
    daily_schedule  = "30 06 ? * 3-6 *"
    weekly_schedule = "30 06 ? * 2 *"
  },
  misboe = {
    daily_schedule  = "30 06 ? * 3-6 *"
    weekly_schedule = "30 06 ? * 2 *"
  },
  misdsd = {
    daily_schedule  = "30 06 ? * 3-6 *"
    weekly_schedule = "30 06 ? * 2 *"
  }
}

oracle_delete_unused_dbids = "yes"
