vpc_supernet = "10.162.0.0/20"

aws_nameserver = "10.162.0.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "Z8EM67XHVHKUL"

SPG_GATEWAY_MQ_URL_SOURCE    = "data"
spg_messaging_broker_url_src = "data"
spg_jms_host_src             = "data"

#lambda auto start stop vars
ec2_schedule                         = "true"
autoscaling_schedule                 = "true"
calendar_rule_enabled                = "true"
autostop_notify_rule_enabled         = "true"
tagged_user                          = "<@U5XAZK38U>  <@UB9EZ30PK>  <@UJLLH2BS6>"
channel                              = "po_test_delius_test_alerts"
create_autostop_instance             = "true"
