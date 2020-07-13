# This is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

# VPC variables
cloudwatch_log_retention = 14

route53_sub_domain = "delius-stage.alfresco"

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

# ALLOWED CIDRS

allowed_cidr_block = [
  "109.148.151.107/32", #Don Home
  "81.134.202.29/32",   #Moj VPN
  "217.33.148.210/32",  #Digital studio
  "35.176.14.16/32",    #Engineering Jenkins non prod AZ 1
  "35.177.83.160/32",   #Engineering Jenkins non prod AZ 2
  "18.130.108.149/32",  #Engineering Jenkins non prod AZ 3
  "35.178.206.119/32",  #SPG instance public NAT address
  "194.75.210.208/28",  #BCL
  "213.48.246.99/32",   #BCL
]

# common
allowed_ssh_cidr = [
  "81.134.202.29/32",  #Moj VPN
  "217.33.148.210/32", #Digital studio
]

alfresco_app_name = "alfresco"

# spg broker url
spg_messaging_broker_url = "failover:(ssl://b-3466dbe4-d378-4614-9c03-4e94452c9849-1.mq.eu-west-2.amazonaws.com:61617,ssl://b-3466dbe4-d378-4614-9c03-4e94452c9849-2.mq.eu-west-2.amazonaws.com:61617)"

# used for iam copying from prod backup bucket
alf_iam_cross_account_perms = true

# ASG Configuration
alfresco_asg_props = {
  asg_desired       = 2
  asg_min           = 2
  asg_max           = 2
}

# RDs
alf_rds_props = {
  snapshot_identifier = "alf-stage-16-06-20"
}
