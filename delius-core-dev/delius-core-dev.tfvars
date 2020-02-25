vpc_supernet = "10.161.20.0/22"

aws_nameserver = "10.161.20.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "Z3JN6545N8RW90"

#'data'=use amazonMQ
SPG_GATEWAY_MQ_URL_SOURCE    = "data"
spg_messaging_broker_url_src = "data"
spg_jms_host_src             = "data"


#lambda auto start stop vars
start_cloudwatch_schedule_expression = "cron(00 05 ? * MON-FRI *)"
stop_cloudwatch_schedule_expression  = "cron(00 19 ? * MON-FRI *)"
ec2_schedule                         = "true"
autoscaling_schedule                 = "true"
