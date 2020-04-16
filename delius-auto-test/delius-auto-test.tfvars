vpc_supernet = "10.162.128.0/20"

aws_nameserver = "10.162.128.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "Z18PY2AZJLFAV2"

#lambda auto start stop vars
ec2_schedule                         = "true"
autoscaling_schedule                 = "true"
calendar_rule_enabled                = "true"
