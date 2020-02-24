vpc_supernet = "10.161.4.0/22"

aws_nameserver = "10.161.4.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "ZWRS0ZWYX7JX9"

#lambda auto start stop vars
start_cloudwatch_schedule_expression = "cron(00 05 ? * MON-FRI *)"
stop_cloudwatch_schedule_expression  = "cron(00 19 ? * MON-FRI *)"
ec2_schedule                         = "true"
autoscaling_schedule                 = "true"
