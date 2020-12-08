vpc_supernet = "10.162.48.0/20"

aws_nameserver = "10.162.48.2"

# Moved from spg.tfvars

route53_strategic_hosted_zone_id = "Z3UY5M35HRRNTE"


#lambda auto start stop vars
#ec2_schedule                         = "true"
#autoscaling_schedule                 = "true"
#calendar_rule_enabled                = "true"
#autostop_notify_rule_enabled         = "true"
#tagged_user                          = "<@U59GU92QY>"
#channel                              = "po_test_delius_test_alerts"
#create_autostop_instance             = "true"

oracle_backup_schedule = {
  delius = {
    daily_schedule  = "30 06 ? * 3-6 *"
    weekly_schedule = "30 06 ? * 2 *"
  }
}

oracle_validate_backup_schedule = {
  delius = {
    host     =  "delius_standbydb1"
    schedule =  "00 09 ? * 3 *"
  }
}

database_high_availability_count = {
  delius = 1
  mis    = 0
  misboe = 0
  misdsd = 0
}