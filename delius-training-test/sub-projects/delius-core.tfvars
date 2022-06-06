# delius-training-test  delius-core.tfvars
## Delius Core Specific

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size        = "small"
  instance_type        = "t3.large"
  disk_type_data       = "io1" # Requires iops and throughput to be set
  disk_throughput_data = 750   # Only relevant when disks_volume_type = "gp3"
  disk_type_root       = "io1" # Requires iops and throughput to be set
  disk_throughput_root = 125   # Only relevant when disks_volume_type = "gp3"
  disks_quantity       = 2     # Do not decrease this
  disks_quantity_data  = 1
  disk_iops_root       = 1000
  disk_iops_data       = 1000
  disk_iops_flash      = 500
  disk_size_data       = 200 # Do not decrease this
  disk_size_flash      = 200 # Do not decrease this
  ## total_storage    = 400 # This should equal disks_quantity x disk_size
}

ansible_vars_oracle_db = {
  service_user_name             = "oracle"
  database_global_database_name = "TRTNDA"
  database_sid                  = "TRTNDA"
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

# WebLogic
delius_app_config = {
  env_TRAINING_MODE_APP_NAME = "National Delius - TEST USE ONLY"
  env_TRAINING_MODE          = "training"
}

env_user_access_cidr_blocks = [
  # -Sopra Steria
  "195.206.180.12/32", # Dedicated IP provided by Nicki Berry on 26/02/2020
]

# DSS Batch Task
dss_job_envvars = [
  {
    "name"  = "DSS_TESTMODE"
    "value" = "true"
  },
  {
    "name"  = "DSS_TESTINGAUTOCORRECT"
    "value" = "true"
  },
  {
    "name"  = "DSS_ENVIRONMENT"
    "value" = "delius-training-test"
  },
  {
    "name"  = "DSS_DSSWEBSERVERURL"
    "value" = "https://interface-app-internal.training-test.delius.probation.hmpps.dsd.io/NDeliusDSS/UpdateOffender"
  },
  {
    "name"  = "DSS_PROJECT"
    "value" = "delius"
  }
]
