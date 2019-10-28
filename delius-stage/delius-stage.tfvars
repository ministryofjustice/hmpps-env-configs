vpc_supernet = "10.162.32.0/20"

aws_nameserver = "10.162.32.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "Z2JOUHN6429CPG"

public_ssl_arn = ""

## Delius Core Specific

instance_type_weblogic = "t2.large"

instance_type_db = "t2.large"

egress_443 = true
egress_80 = true

ndelius_version = "4.1.7.3"
