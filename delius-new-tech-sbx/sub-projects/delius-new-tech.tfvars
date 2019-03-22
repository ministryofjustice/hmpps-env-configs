# This is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

# VPC variables
cloudwatch_log_retention = 14

route53_sub_domain = "sbx.delius-new-tech"

# ROUTE53 ZONE probation.hmpps.dsd.io
route53_hosted_zone_id = "Z3VDCLGXC4HLOW"

# ALFRESCO RDS INSTANCE
rds_instance_class = "db.t2.large"

rds_backup_retention_period = 2

rds_monitoring_interval = 5

rds_allocated_storage = "1000"

# Self Signed Certs
self_signed_ca_algorithm = "RSA"

self_signed_ca_rsa_bits = "4096"

self_signed_ca_validity_period_hours = 8544

self_signed_ca_early_renewal_hours = 672

self_signed_server_algorithm = "RSA"

self_signed_server_rsa_bits = "2048"

self_signed_server_validity_period_hours = 2160

self_signed_server_early_renewal_hours = 336

app_name = "new-tech"

# LB

case-notes-health_check = [
  {
    target              = "HTTP:8080/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  },
]

case-notes-listener = [
  {
    instance_port     = "8080"
    instance_protocol = "HTTP"
    lb_port           = "80"
    lb_protocol       = "HTTP"
  },
]

# images
case-notes-image_url = "895523100917.dkr.ecr.eu-west-2.amazonaws.com/hmpps/case-notes-poll-push:latest"

#delius_endpoint 
push_base_url = "https://interface.dev.delius-core.probation.hmpps.dsd.io"
