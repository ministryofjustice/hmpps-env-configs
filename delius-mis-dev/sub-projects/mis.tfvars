# This is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

# VPC variables
cloudwatch_log_retention = 14

# ROUTE53 ZONE probation.hmpps.dsd.io
route53_hosted_zone_id = "Z3VDCLGXC4HLOW"

public_ssl_arn = "arn:aws:acm:eu-west-2:723123699647:certificate/0b97aef6-3c80-48c2-818c-855d493b2d81"

# IAM
eng_root_arn = "arn:aws:iam::895523100917:root"

cross_account_iam_role = "arn:aws:iam::895523100917:role/tf-eu-west-2-hmpps-eng-dev-mis-runtime"

# Self Signed Certs
self_signed_ca_algorithm = "RSA"

self_signed_ca_rsa_bits = "4096"

self_signed_ca_validity_period_hours = 8544

self_signed_ca_early_renewal_hours = 672

self_signed_server_algorithm = "RSA"

self_signed_server_rsa_bits = "2048"

self_signed_server_validity_period_hours = 2160

self_signed_server_early_renewal_hours = 336

#Instance size for bcs
bcs_instance_type  = "t2.xlarge"
bcs_root_size = 75
bcs_server_count = 1

#Instance size for bfs
bfs_instance_type  = "t2.xlarge"
bfs_root_size = 75
bfs_server_count = 1

#Instance size for bps
bps_instance_type  = "t2.xlarge"
bps_root_size = 75
bps_server_count = 1

#Instance size for bws
bws_instance_type  = "t2.xlarge"
bws_root_size = 75
bws_server_count = 1

#Instance size for dis
dis_instance_type  = "t2.xlarge"
dis_root_size = 75
dis_server_count = 1

#Instance size for dfi
dfi_instance_type  = "t2.xlarge"
dfi_root_size = 75
dfi_server_count = 1

# Databases
## MIS Datamart
db_size_mis = {
  database_size  = "small"
  instance_type  = "t3.large"
  # disk_iops      = 5000
  # disks_quantity = 2          # Do not decrease this
  # disk_size      = 5000        # Do not decrease this

  disks_quantity      = 2   # Do not decrease this
  disks_quantity_data = 1
  disk_iops_data      = 5000
  disk_iops_flash     = 500
  disk_size_data      = 5000 # Do not decrease this
  disk_size_flash     = 5000 # Do not decrease this
  # total_storage  = 10000 # This should equal disks_quantity x disk_size
}

ansible_vars_mis_db = {
  service_user_name             = "oracle"
  database_global_database_name = "DMDMIS"
  database_sid                  = "DMDMIS"

  ## oradb_sys_password            = "/${environment_name}/${project}/mis-database/db/oradb_sys_password"
  ## oradb_system_password         = "/${environment_name}/${project}/mis-database/db/oradb_system_password"
  ## oradb_dbsnmp_password         = "/${environment_name}/${project}/mis-database/db/oradb_dbsnmp_password"
  ## oradb_asmsnmp_password        = "/${environment_name}/${project}/mis-database/db/oradb_asmsnmp_password"
  database_characterset = "AL32UTF8"

  database_bootstrap_restore = "False"         # whether primary db has db restore on bootstrap
  database_backup            = "NotApplicable" # path in S3 to directory backup files
  database_backup_sys_passwd = "NotApplicable" # ssm parameter store name for db backup password
  database_backup_location   = "NotApplicable" #default for local testing
  oracle_dbca_template_file  = "database"
}

## Business Objects Repo
db_size_misboe = {
  database_size  = "small"
  instance_type  = "t3.large"
  # disk_iops      = 1000
  # disks_quantity = 2          # Do not decrease this
  # disk_size      = 500        # Do not decrease this

  disks_quantity      = 2   # Do not decrease this
  disks_quantity_data = 1
  disk_iops_data      = 1000
  disk_iops_flash     = 500
  disk_size_data      = 500 # Do not decrease this
  disk_size_flash     = 500 # Do not decrease this
  # total_storage  = 1000 # This should equal disks_quantity x disk_size
}

ansible_vars_misboe_db = {
  service_user_name             = "oracle"
  database_global_database_name = "DMDBOE"
  database_sid                  = "DMDBOE"

  ## oradb_sys_password            = "/${environment_name}/${project}/misboe-database/db/oradb_sys_password"
  ## oradb_system_password         = "/${environment_name}/${project}/misboe-database/db/oradb_system_password"
  ## oradb_dbsnmp_password         = "/${environment_name}/${project}/misboe-database/db/oradb_dbsnmp_password"
  ## oradb_asmsnmp_password        = "/${environment_name}/${project}/misboe-database/db/oradb_asmsnmp_password"
  database_characterset = "AL32UTF8"

  database_bootstrap_restore = "False"         # whether primary db has db restore on bootstrap
  database_backup            = "NotApplicable" # path in S3 to directory backup files
  database_backup_sys_passwd = "NotApplicable" # ssm parameter store name for db backup password
  database_backup_location   = "NotApplicable" #default for local testing
  oracle_dbca_template_file  = "database"
}

## Data Services Repo
db_size_misdsd = {
  database_size  = "small"
  instance_type  = "t3.large"
  # disk_iops      = 1000
  # disks_quantity = 2          # Do not decrease this
  # disk_size      = 500        # Do not decrease this

  disks_quantity      = 2   # Do not decrease this
  disks_quantity_data = 1
  disk_iops_data      = 1000
  disk_iops_flash     = 500
  disk_size_data      = 500 # Do not decrease this
  disk_size_flash     = 500 # Do not decrease this
  # total_storage  = 1000 # This should equal disks_quantity x disk_size
}

ansible_vars_misdsd_db = {
  service_user_name             = "oracle"
  database_global_database_name = "DMDDSD"
  database_sid                  = "DMDDSD"

  ## oradb_sys_password            = "/${environment_name}/${project}/misdsd-database/db/oradb_sys_password"
  ## oradb_system_password         = "/${environment_name}/${project}/misdsd-database/db/oradb_system_password"
  ## oradb_dbsnmp_password         = "/${environment_name}/${project}/misdsd-database/db/oradb_dbsnmp_password"
  ## oradb_asmsnmp_password        = "/${environment_name}/${project}/misdsd-database/db/oradb_asmsnmp_password"
  database_characterset = "AL32UTF8"

  database_bootstrap_restore = "False"         # whether primary db has db restore on bootstrap
  database_backup            = "NotApplicable" # path in S3 to directory backup files
  database_backup_sys_passwd = "NotApplicable" # ssm parameter store name for db backup password
  database_backup_location   = "NotApplicable" #default for local testing
  oracle_dbca_template_file  = "database"
}

legacy_environment_name = "100"

#Nextcloud
nextcloud_instance_type      = "t2.small"
rds_instance_class           = "db.t2.small"
mariadb_monitoring_interval  = 30
rds_allocated_storage        = "500"
number_cache_clusters        = 2
nextcloud_redis_node_type    = "cache.t3.small"

#monitoring
mis_alarms_enabled = "true"

# mis fsx
fsx_copy_tags_to_backups = false
