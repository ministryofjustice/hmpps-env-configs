# delius-core-sandpit  delius-core.tfvar
## Delius Core Specific

egress_443 = true
egress_80 = true

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size  = "small"
  instance_type  = "t3.large"
  disk_iops      = 1000
  disks_quantity = 8  # Do not decrease this
  disk_size      = 100 # Do not decrease this
  # total_storage  = 200 # This should equal disks_quantity x disk_size
}

ansible_vars_oracle_db = {
  service_user_name             = "oracle"
  database_global_database_name = "SANNDA"
  database_sid                  = "SANNDA"
  ## oradb_sys_password            = "/${environment_name}/delius-core/oracle-database/db/oradb_sys_password"
  ## oradb_system_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_system_password"
  ## oradb_sysman_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_sysman_password"
  ## oradb_dbsnmp_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_dbsnmp_password"
  ## oradb_asmsnmp_password        = "/${environment_name}/delius-core/oracle-database/db/oradb_asmsnmp_password"
  database_characterset         = "AL32UTF8"
  database_bootstrap_restore    = "True" # whether primary db has db restore on bootstrap
  database_backup               = "dbbackup/dev/delius" # path in S3 to directory backup files
  database_backup_sys_passwd    = "/dbbackup/delius-core-dev/delius-core/oracle-database/db/oradb_sys_password" # ssm parameter store name for db backup password
  database_backup_location      = "/u01/backup" #default for local testing
  oracle_dbca_template_file     = "database"
}

# LDAP
ansible_vars_apacheds = {
}

# WebLogic
ansible_vars = {
  ndelius_display_name = "National Delius - DEVELOPMENT USE ONLY"
  ndelius_training_mode = "development"
  ndelius_log_level = "DEBUG"
  database_sid = "SANNDA"
}

env_user_access_cidr_blocks = []

# DSS Batch Task
dss_batch_instances = ["m5.large", "c5.large"]

dss_min_vcpu = 0

dss_max_vcpu = 8

dss_job_image = "mojdigitalstudio/hmpps-delius-dss-docker:latest"

dss_job_vcpus = 1

dss_job_memory = 128

dss_job_schedule = "cron(00 23 * * ? *)"

dss_job_retries = 1

dss_job_envvars = [
  {
    "name" = "DSS_TESTMODE"
    "value" =  "true"
  },
  {
    "name" = "DSS_TESTINGAUTOCORRECT"
    "value" = "true"
  }
]

dss_job_ulimits = [
  {
    "name"      = "nofile"
    "hardLimit" = "1024"
    "softLimit" = "1024"
  }
]

dss_queue_state = "ENABLED"
