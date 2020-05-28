vpc_supernet = "10.160.48.0/20"

aws_nameserver = "10.160.48.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "Z2B72ITPJW013I"

public_ssl_arn = ""

## Delius Core Specific

instance_type_db = "t2.large"

egress_443 = true
egress_80  = true

#Instance size for smtp server
smtp_instance_type = "m5.xlarge"

#'data'=use amazonMQ
SPG_GATEWAY_MQ_URL_SOURCE    = "data"
spg_messaging_broker_url_src = "data"
spg_jms_host_src             = "data"

#lambda auto start stop vars
ec2_schedule                         = "true"
autoscaling_schedule                 = "true"
calendar_rule_enabled                = "true"
autostop_notify_rule_enabled         = "true"
