vpc_supernet = "10.160.48.0/20"

aws_nameserver = "10.160.48.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "Z222MCWUHZK2CF"

public_ssl_arn = ""

## Delius Core Specific

instance_type_weblogic = "t2.large"

instance_type_db = "t2.large"

egress_443 = true
egress_80  = true

ndelius_version = "4.1.7.3"

#Instance size for smtp server
smtp_instance_type = "m5.xlarge"

#'data'=use amazonMQ
SPG_GATEWAY_MQ_URL_SOURCE    = "data"
spg_messaging_broker_url_src = "data"
spg_jms_host_src             = "data"

