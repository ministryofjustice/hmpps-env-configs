# This is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

# VPC variables
cloudwatch_log_retention = 14

route53_sub_domain = "dev.alfresco"

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
  "81.134.202.29/32",  #Moj VPN
  "217.33.148.210/32", #Digital studio
  "35.176.14.16/32",   #Engineering Jenkins non prod AZ 1
  "35.177.83.160/32",  #Engineering Jenkins non prod AZ 2
  "18.130.108.149/32", #Engineering Jenkins non prod AZ 3
  "35.178.206.119/32", #SPG instance public NAT address
  "194.75.210.216/29", # Unilink AOVPN
  "83.98.63.176/29",   # Unilink AOVPN
  "78.33.10.50/31",    # Unilink AOVPN
  "78.33.10.52/30",    # Unilink AOVPN
  "78.33.10.56/30",    # Unilink AOVPN
  "78.33.10.60/32",    # Unilink AOVPN
  "78.33.32.99/32",    # Unilink AOVPN
  "78.33.32.100/30",   # Unilink AOVPN
  "78.33.32.104/30",   # Unilink AOVPN
  "78.33.32.108/32",   # Unilink AOVPN
  "217.138.45.109/32", # Unilink AOVPN
  "217.138.45.110/32", # Unilink AOVPN
]

# ASG Configuration
alfresco_asg_props = {
  ami_name = "HMPPS Alfresco *"
}

spg_messaging_broker_url_src = ""

# common
allowed_ssh_cidr = [
  "109.148.137.148/32", #Don Home
  "81.134.202.29/32",   #Moj VPN
  "217.33.148.210/32",  #Digital studio

]

alfresco_app_name = "alfresco"

# restore dataset
alf_restore_status = "restore"

alf_elk_service_map = {
  create_service_role = 0
}

alfresco_content_configs = {
  image_url       = "563502482979.dkr.ecr.eu-west-2.amazonaws.com/hmpps/alfresco-content"
  db_pool_initial = 100
  db_pool_max     = 300
}

alfresco_ro_content_configs = {
  image_url       = "563502482979.dkr.ecr.eu-west-2.amazonaws.com/hmpps/alfresco-content"
  db_pool_initial = 100
  db_pool_max     = 300
}

alfresco_share_configs = {
  image_url = "563502482979.dkr.ecr.eu-west-2.amazonaws.com/hmpps/alfresco-share"
}

# Environment-specific configuration for alfresco-database RDS instance
alf_rds_props = {
  instance_class          = "db.t2.large"
  iops                    = 0
  storage_type            = "gp2"
  allocated_storage       = 100
  max_allocated_storage   = 0 # disable storage auto scaling
  maintenance_window      = "Wed:19:30-Wed:21:30"
  backup_window           = "02:00-04:00"
  backup_retention_period = 7
  engine_version          = "11.14"
}