vpc_supernet = "10.162.64.0/20"

aws_nameserver = "10.162.64.2"

# Moved from spg.tfvars
# Retrieved from network vpc terraform
route53_strategic_hosted_zone_id = "Z09133233G9YHQVEMRNQ7"
SPG_GATEWAY_MQ_URL_SOURCE        = "data"
spg_messaging_broker_url_src     = "data"
spg_jms_host_src                 = "data"

#lambda auto start stop vars
ec2_schedule                         = "true"
autoscaling_schedule                 = "true"
calendar_rule_enabled                = "true"
autostop_notify_rule_enabled         = "true"
create_autostop_instance             = "true"
