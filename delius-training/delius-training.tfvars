vpc_supernet = "10.162.96.0/20"

aws_nameserver = "10.162.96.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "Z2IS8O8M3W81HY"

SPG_GATEWAY_MQ_URL_SOURCE    = "data"
spg_messaging_broker_url_src = "data"
spg_jms_host_src             = "data"

#lambda auto start stop vars
ec2_schedule                 = "true"
autoscaling_schedule         = "true"
rds_schedule                 = "true"
calendar_rule_enabled        = "true"
autostop_notify_rule_enabled = "true"
tagged_user                  = "<@U0167SAA7V5>"
channel                      = "auto-stop-alerts"
create_autostop_instance     = "true"

# oracle_backup_schedule should be specified using the Europe/London timezone (i.e DST is handled automatically)
oracle_backup_schedule = {
  delius = {
    daily_schedule  = "30 13 ? * 4-6 *"
    weekly_schedule = "30 06 ? * 3 *"
  }
}

oracle_validate_backup_schedule = {
  delius = {
    host     =  "delius_primarydb"
    schedule =  "00 18 ? * 4 *"
  }
}

oracle_flashback_schedule = {
  delius = {
    restorepoint   =  "TRAINING"
    schedule       =  "30 05 ? * 2 *"
  }
}

database_high_availability_count = {
  delius = 0
  mis    = 0
  misboe = 0
  misdsd = 0
}

oracle_delete_unused_dbids = "yes"

oracle_rotate_passwords_schedule = {
    schedule_expression   =  "00 15 ? * TUE *"
}