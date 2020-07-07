vpc_supernet = "10.162.96.0/20"

aws_nameserver = "10.162.96.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "Z2IS8O8M3W81HY"

SPG_GATEWAY_MQ_URL_SOURCE    = "data"
spg_messaging_broker_url_src = "data"
spg_jms_host_src             = "data"

#lambda auto start stop vars
ec2_schedule                         = "true"
autoscaling_schedule                 = "true"
calendar_rule_enabled                = "true"
autostop_notify_rule_enabled         = "true"
tagged_user                          = "<@U0167SAA7V5>"
channel                              = "auto-stop-alerts"
create_autostop_instance             = "true"
