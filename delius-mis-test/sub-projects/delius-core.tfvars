# delius-mis-test  delius-core.tfvars
## Delius Core Specific

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size        = "small"
  instance_type        = "t3.large" # maps to instance_type aws_instance attribute
  disk_type_data       = "io1"      # Requires iops and throughput to be set
  disk_throughput_data = 125        # Only relevant when disks_volume_type = "gp3"
  disk_type_root       = "io1"      # Requires iops and throughput to be set
  disk_throughput_root = 125        # Only relevant when disks_volume_type = "gp3"
  disks_quantity       = 2          # Do not decrease this
  disks_quantity_data  = 1
  disk_iops_root       = 1000
  disk_iops_data       = 1000
  disk_iops_flash      = 500
  disk_size_data       = 500 # Do not decrease this
  disk_size_flash      = 500 # Do not decrease this
  ## total_storage    = 1000 # This should equal disks_quantity x disk_size
}

ansible_vars_oracle_db = {
  service_user_name             = "oracle"
  database_global_database_name = "DMTNDA"
  database_sid                  = "DMTNDA"
  ## oradb_sys_password            = "/${environment_name}/delius-core/oracle-database/db/oradb_sys_password"
  ## oradb_system_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_system_password"
  ## oradb_dbsnmp_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_dbsnmp_password"
  ## oradb_asmsnmp_password        = "/${environment_name}/delius-core/oracle-database/db/oradb_asmsnmp_password"
  database_characterset      = "AL32UTF8"
  database_bootstrap_restore = "True"                                                                        # whether primary db has db restore on bootstrap
  database_backup            = "dbbackup/dev/delius"                                                         # path in S3 to directory backup files
  database_backup_sys_passwd = "/dbbackup/delius-core-dev/delius-core/oracle-database/db/oradb_sys_password" # ssm parameter store name for db backup password
  database_backup_location   = "/u01/backup"                                                                 #default for local testing
  oracle_dbca_template_file  = "database"
}

ansible_vars = {
  ndelius_display_name = "National Delius - TEST USE ONLY"
  database_sid         = "DMTNDA"
}

env_user_access_cidr_blocks = [
]

# Use dsd.io public zone until transition to gov.uk is complete for this environment
delius_core_public_zone = "legacy"
