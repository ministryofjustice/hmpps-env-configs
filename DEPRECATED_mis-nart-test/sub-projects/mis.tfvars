mis_app_name = "mis"

# Windows admin password length
password_length = "12"

# This is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

# VPC variables
cloudwatch_log_retention = 14

# ROUTE53 ZONE probation.hmpps.dsd.io
route53_hosted_zone_id = "Z3VDCLGXC4HLOW"

public_ssl_arn = "arn:aws:acm:eu-west-2:723123699647:certificate/0b97aef6-3c80-48c2-818c-855d493b2d81"


# ENVIRONMENT ROLE ARNS
eng_role_arn = "arn:aws:iam::895523100917:role/terraform"

eng_root_arn = "arn:aws:iam::895523100917:root"

cross_account_iam_role = "arn:aws:iam::895523100917:role/tf-eu-west-2-hmpps-eng-dev-mis-runtime"

# ALLOWED CIDRS
allowed_cidr_block = [
  "86.132.187.22/32",  #Don Home
  "81.134.202.29/32",  #Moj VPN
  "217.33.148.210/32", #Digital studio
  "35.176.14.16/32",   #Engineering Jenkins non prod AZ 1
  "35.177.83.160/32",  #Engineering Jenkins non prod AZ 2
  "18.130.108.149/32", #Engineering Jenkins non prod AZ 3
  "194.75.210.218/32", #MIS Tolomy
  "90.212.106.30/32",  #MIS Tolomy
  "82.14.114.76/32",   #MIS Tolomy
]

# Self Signed Certs
self_signed_ca_algorithm = "RSA"

self_signed_ca_rsa_bits = "4096"

self_signed_ca_validity_period_hours = 8544

self_signed_ca_early_renewal_hours = 672

self_signed_server_algorithm = "RSA"

self_signed_server_rsa_bits = "2048"

self_signed_server_validity_period_hours = 2160

self_signed_server_early_renewal_hours = 336

# LB
health_check = [
  {
    target              = "TCP:443"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  },
]
