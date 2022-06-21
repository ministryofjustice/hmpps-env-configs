vpc_supernet = "10.161.80.0/22"

aws_nameserver = "10.161.80.2"

#lambda auto start stop vars
ec2_schedule                 = "true"
autoscaling_schedule         = "true"
rds_schedule                 = "true"
calendar_rule_enabled        = "true"
autostop_notify_rule_enabled = "false"
tagged_user                  = ""
channel                      = "po_test_delius_test_alerts"
create_autostop_instance     = "true"