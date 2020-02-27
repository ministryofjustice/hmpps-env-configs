vpc_supernet = "10.162.128.0/20"

aws_nameserver = "10.162.128.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "Z18PY2AZJLFAV2"

#lambda auto start stop vars
start_cloudwatch_schedule_expression = "cron(00 05 ? * MON-FRI *)"
stop_cloudwatch_schedule_expression  = "cron(00 17 ? * MON-FRI *)"
ec2_schedule                         = "true"
autoscaling_schedule                 = "true"
auto_stop_rule_enabled               = "true"
auto_start_rule_enabled              = "true"
