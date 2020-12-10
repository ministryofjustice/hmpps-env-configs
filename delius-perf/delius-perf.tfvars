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



#lambda auto start stop vars
ec2_schedule                         = "true"
autoscaling_schedule                 = "true"
calendar_rule_enabled                = "true"
autostop_notify_rule_enabled         = "true"
create_autostop_instance             = "true"

database_high_availability_count = {
  delius = 1
  mis    = 0
  misboe = 0
  misdsd = 0
}
