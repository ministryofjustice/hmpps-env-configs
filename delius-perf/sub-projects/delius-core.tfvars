# delius-perf  delius-core.tfvar
## Delius Core Specific

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size       = "x_large"
  instance_type       = "r5.4xlarge"
  disks_quantity      = 16 # Do not decrease this
  disks_quantity_data = 10
  disk_iops_data      = 1000
  disk_iops_flash     = 500
  disk_size_data      = 1000 # Do not decrease this
  disk_size_flash     = 1000 # Do not decrease this
  ## total_storage    = 16000 # This should equal disks_quantity x disk_size
}

ansible_vars_oracle_db = {
  service_user_name             = "oracle"
  database_global_database_name = "PERNDA"
  database_sid                  = "PERNDA"
  ## oradb_sys_password            = "/${environment_name}/delius-core/oracle-database/db/oradb_sys_password"
  ## oradb_system_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_system_password"
  ## oradb_dbsnmp_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_dbsnmp_password"
  ## oradb_asmsnmp_password        = "/${environment_name}/delius-core/oracle-database/db/oradb_asmsnmp_password"
  database_characterset      = "AL32UTF8"
  database_bootstrap_restore = "False"         # whether primary db has db restore on bootstrap
  database_backup            = "NotApplicable" # path in S3 to directory backup files
  database_backup_sys_passwd = "NotApplicable" # ssm parameter store name for db backup password
  database_backup_location   = "NotApplicable" #default for local testing
  oracle_dbca_template_file  = "database"
}

# enable ingress from the CI (Jenkins/AWS Codepipeline)
ci_db_ingress_1521 = true

# WebLogic
delius_app_config = {
  # oauth
  env_OAUTH_URL = "https://sign-in-preprod.hmpps.service.justice.gov.uk/auth"
  # api access
  env_API_CLIENT_ID        = "delius-ui-client"
  secret_API_CLIENT_SECRET = "/delius-perf/delius/weblogic/ndelius-domain/api-client-secret"
}

# GDPR
gdpr_config = {
  api_min_capacity = 1 # Batch processing currently doesn't scale so fixing to 1 instance
  api_max_capacity = 1
  cron_identifyduplicates     = "-" # Batch schedules. Set to "-" to disable.
  cron_retainedoffenders      = "-" #
  cron_retainedoffendersiicsa = "-" #
  cron_eligiblefordeletion    = "-" #
  cron_deleteoffenders        = "-" #
  cron_destructionlogclearing = "-" #
  ui_min_capacity  = 2
  ui_max_capacity  = 10
}

# Delius API
delius_api_environment = {
  SPRING_PROFILES_ACTIVE                                = "applicationinsights"
  TOKENVERIFICATION_API_BASE_URL                        = "https://token-verification-api-preprod.prison.service.justice.gov.uk"
  SPRING_SECURITY_OAUTH2_RESOURCESERVER_JWT_JWK-SET-URI = "https://sign-in-preprod.hmpps.service.justice.gov.uk/auth/.well-known/jwks.json"
  SPRING_DATASOURCE_USERNAME                            = "DELIUS_API_POOL"
  SPRING_DATASOURCE_TYPE                                = "oracle.jdbc.pool.OracleDataSource"
}
delius_api_secrets = {
  APPINSIGHTS_INSTRUMENTATIONKEY = "/delius-perf/delius/newtech/offenderapi/appinsights_key"
  SPRING_DATASOURCE_PASSWORD     = "/delius-perf/delius/delius-database/db/delius_api_pool_password"
}

env_user_access_cidr_blocks = []

# Delius-Core Slack alarms
delius_alarms_config = {
  enabled     = true
  quiet_hours = [19, 7] # 19:00-07:00 to coincide with auto-stop/start
}

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
    "value" = "delius-perf"
  },
  {
    "name"  = "DSS_DSSWEBSERVERURL"
    "value" = "https://interface-app-internal.perf.delius.probation.hmpps.dsd.io/NDeliusDSS/UpdateOffender"
  },
  {
    "name"  = "DSS_PROJECT"
    "value" = "delius"
  }
]
