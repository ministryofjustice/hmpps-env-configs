vpc_supernet = "10.161.4.0/22"

aws_nameserver = "10.161.4.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "ZWRS0ZWYX7JX9"

#lambda auto start stop vars
ec2_schedule                         = "true"
autoscaling_schedule                 = "true"
calendar_rule_enabled                = "true"
