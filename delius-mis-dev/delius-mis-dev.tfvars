vpc_supernet = "10.162.32.0/20"

aws_nameserver = "10.162.32.2"


#lambda auto start stop vars
ec2_schedule                         = "true"
autoscaling_schedule                 = "true"
calendar_rule_enabled                = "true"
autostop_notify_rule_enabled         = "true"
tagged_user                          = "<@UA84K4FG8>  <@UA8N2QDHR>  <@U9C74KBLP>  <@UAWCS3F0A>"
channel                              = "auto-stop-alerts"
create_autostop_instance             = "true"
mis_overide_autostop_tags            = "True"     ##Set autostop tag key value for MIS Servers
mis_overide_resizing_schedule_tags   = "false"     ##Set resizing schedule tag key value for MIS Servers

# oracle_backup_schedule should be specified using the Europe/London timezone (i.e DST is handled automatically)
oracle_backup_schedule = {
  delius = {
    daily_schedule  = "30 06 ? * 2,3,5,6 *"
    weekly_schedule = "30 06 ? * 4 *"
  },
  mis = {
    daily_schedule  = "30 06 ? * 2,3,5,6 *"
    weekly_schedule = "30 06 ? * 4 *"
  },
  misboe = {
    daily_schedule  = "30 06 ? * 2,3,5,6 *"
    weekly_schedule = "30 06 ? * 4 *"
  },
  misdsd = {
    daily_schedule  = "30 06 ? * 2,3,5,6 *"
    weekly_schedule = "30 06 ? * 4 *"
  }
}

oracle_delete_unused_dbids = "yes"

oracle_rotate_passwords_schedule = {
    schedule_expression   =  "00 12 ? * TUE *"
}