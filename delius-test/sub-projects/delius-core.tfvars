# delius-test  delius-core.tfvars
## Delius Core Specific

egress_443 = true

egress_80 = true

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size  = "medium"
  instance_type  = "r5.xlarge"
  disk_iops      = 1000
  disks_quantity = 4           # Do not decrease this
  disk_size      = 500         # Do not decrease this

  # total_storage  = 2000 # This should equal disks_quantity x disk_size
}

ansible_vars_oracle_db = {
  service_user_name             = "oracle"
  database_global_database_name = "TSTNDA"
  database_sid                  = "TSTNDA"

  ## oradb_sys_password            = "/${environment_name}/delius-core/oracle-database/db/oradb_sys_password"
  ## oradb_system_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_system_password"
  ## oradb_sysman_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_sysman_password"
  ## oradb_dbsnmp_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_dbsnmp_password"
  ## oradb_asmsnmp_password        = "/${environment_name}/delius-core/oracle-database/db/oradb_asmsnmp_password"
  database_characterset = "AL32UTF8"

  database_bootstrap_restore = "True"                                                                        # whether primary db has db restore on bootstrap
  database_backup            = "dbbackup/dev/delius"                                                         # path in S3 to directory backup files
  database_backup_sys_passwd = "/dbbackup/delius-core-dev/delius-core/oracle-database/db/oradb_sys_password" # ssm parameter store name for db backup password
  database_backup_location   = "/u01/backup"                                                                 #default for local testing
  oracle_dbca_template_file  = "database"
}

# LDAP
ansible_vars_apacheds = {
  import_users_ldif = "SR2-190412/OID/SR2-190412.ldif"
}

# WebLogic
ansible_vars = {
  ndelius_display_name = "National Delius - TEST USE ONLY"
  database_sid         = "TSTNDA"
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
    "name" = "DSS_TESTMODE",
    "value" =  "true"
  },
  {
    "name" = "DSS_TESTINGAUTOCORRECT",
    "value" = "true"
  }
]

dss_job_ulimits = [
  {
    "name"      = "nofile"
    "hardLimit" = 1024
    "softLimit" = 1024
  },
]

dss_queue_state = "ENABLED"