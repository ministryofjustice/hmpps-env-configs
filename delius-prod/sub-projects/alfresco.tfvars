# This is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

# VPC variables
cloudwatch_log_retention = 14

route53_sub_domain = "delius-prod.alfresco"

# ROUTE53 ZONE probation.hmpps.dsd.io
route53_hosted_zone_id = "Z3VDCLGXC4HLOW"

# ALFRESCO RDS INSTANCE
rds_instance_class = "db.m4.2xlarge"

rds_backup_retention_period = 7

rds_monitoring_interval = 5

rds_allocated_storage = "2000"

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

alfresco_access_cidr_blocks = [
  "51.149.250.0/24",   #Moj Official Prisons
]

# common
allowed_ssh_cidr = [
  "109.148.137.148/32", #Don Home
  "81.134.202.29/32",   #Moj VPN
  "217.33.148.210/32",  #Digital studio
]

alfresco_app_name = "alfresco"

# spg broker url
spg_messaging_broker_url = "tcp://spgw-jms-int.probation.service.justice.gov.uk:61616"

# alerts
alf_ops_alerts = {
  slack_channel_name = "delius-alerts-alfresco-production"
  log_level          = "info"
  messaging_status   = "enabled"
  runtime            = "python3.7"
  ssm_token          = "/alfresco/slack/token"
}

# Environment-specific configuration for alfresco-database RDS instance
alf_rds_props = {
  instance_class          = "db.m5.12xlarge"
  iops                    = 10000
  storage_type            = "io1"
  allocated_storage       = 1000
  maintenance_window      = "Wed:19:30-Wed:21:30"
  backup_window           = "02:00-04:00"
  backup_retention_period = 28
  family                  = "postgres9.6"
  engine                  = "postgres"
  major_engine_version    = "9.6"
  replica_engine_version  = "9.6.9"
  master_engine_version   = "9.6.9"
  engine_version          = "11.14"
}

alf_elk_service_map = {
  instance_type         = "m5.xlarge.elasticsearch"
  dedicated_master_type = "m5.large.elasticsearch"
  es_ebs_type           = "io1"
  es_ebs_size           = 900
  backup_units_count    = 2
  snapshot_unit_count   = 180
  indices_unit_count    = 365
  iops                  = 5000
}

alf_backups_map = {
  backups_expiration = 300
}

alfresco_search_solr_configs_overrides = {
  backup_cold_storage_after = 14
  backup_delete_after       = 120
}

solr_cmis_managed = true
