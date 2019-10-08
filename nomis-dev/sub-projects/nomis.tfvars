# nomis-dev  nomis-dev.tfvar
## Nomis Specific

egress_443 = true
egress_80 = true

# ref ../../common/common.tfvars
db_size_nomis = {
  database_size  = "small"
  instance_type  = "t3.large"
  disk_iops      = 1000
  disks_quantity = 2  # Do not decrease this
  disk_size      = 500 # Do not decrease this
  # total_storage  = 1000 # This should equal disks_quantity x disk_size
}

ansible_vars_oracle_db = {
  service_user_name             = "oracle"
  database_global_database_name = "DATNDA"
  database_sid                  = "DATNDA"
  ## oradb_sys_password            = "/${environment_name}/delius-core/oracle-database/db/oradb_sys_password"
  ## oradb_system_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_system_password"
  ## oradb_sysman_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_sysman_password"
  ## oradb_dbsnmp_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_dbsnmp_password"
  ## oradb_asmsnmp_password        = "/${environment_name}/delius-core/oracle-database/db/oradb_asmsnmp_password"
  database_characterset         = "AL32UTF8"
  database_bootstrap_restore    = "True" # whether primary db has db restore on bootstrap
  database_backup               = "dbbackup/dev/nomis" # path in S3 to directory backup files
  database_backup_sys_passwd    = "/dbbackup/nomis-dev/nomis/oracle-database/db/oradb_sys_password" # ssm parameter store name for db backup password
  database_backup_location      = "/u01/backup" #default for local testing
  oracle_dbca_template_file     = "database"
}

# WebLogic
ansible_vars = {
  nomis_display_name = "NOMIS - DEVELOPMENT USE ONLY"
  nomis_training_mode = "development"
  nomis_log_level = "DEBUG"
  database_sid = "DATNDA"
}

env_user_access_cidr_blocks = []
