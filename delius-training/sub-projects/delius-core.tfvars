# delius-training  delius-core.tfvars
## Delius Core Specific

egress_443 = true
egress_80  = true

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size       = "small"
  instance_type       = "t3.large"
  disks_quantity      = 2 # Do not decrease this
  disks_quantity_data = 1
  disk_iops_data      = 1000
  disk_iops_flash     = 500
  disk_size_data      = 500 # Do not decrease this
  disk_size_flash     = 500 # Do not decrease this
  ## total_storage    = 1000 # This should equal disks_quantity x disk_size
}

ansible_vars_oracle_db = {
  service_user_name             = "oracle"
  database_global_database_name = "TRNDA"
  database_sid                  = "TRNDA"
  ## oradb_sys_password            = "/${environment_name}/delius-core/oracle-database/db/oradb_sys_password"
  ## oradb_system_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_system_password"
  ## oradb_sysman_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_sysman_password"
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
ansible_vars = {
  database_sid          = "TRNDA"
  ndelius_training_mode = "training"
}

env_user_access_cidr_blocks = [
  # Parent Organisation IP ranges

  # -MTCNovo
  "62.25.109.202/32",
  "52.56.48.146/32", # MTCNovo ZScaler internet-facing IP addresses
  "52.56.64.210/32", # MTCNovo ZScaler internet-facing IP addresses

  # -SEETEC
  "80.86.46.16/30",
  "195.224.76.229/32",
  "195.153.64.66/32",  # Seetec VPN
  "62.232.148.165/32", # Seetec IP addresses provided 19/10/2020 by Jon Kennerly
  "83.71.136.162/32",  #
  "213.86.23.194/32",  #

  # -Sopra Steria
  "195.206.180.12/32", # Dedicated IP provided by Nicki Berry on 24/12/2020 (ALS-2487)
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
    "value" = "delius-training"
  },
  {
    "name"  = "DSS_DSSWEBSERVERURL"
    "value" = "https://interface-app-internal.training.delius.probation.hmpps.dsd.io/NDeliusDSS/UpdateOffender"
  },
  {
    "name"  = "DSS_PROJECT"
    "value" = "delius"
  }
]
