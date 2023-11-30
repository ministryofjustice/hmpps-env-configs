# delius-test  delius-core.tfvars
## Delius Core Specific

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size        = "medium"
  instance_type        = "r5.xlarge"
  disk_type_data       = "gp3" # Requires iops and throughput to be set
  disk_throughput_data = 125   # Only relevant when disks_volume_type = "gp3"
  disk_type_root       = "gp3" # Requires iops and throughput to be set
  disk_throughput_root = 125   # Only relevant when disks_volume_type = "gp3"
  disks_quantity       = 3     # Do not decrease this without amending ASM
  disks_quantity_data  = 2
  disk_iops_root       = 3000
  disk_iops_data       = 3000
  disk_iops_flash      = 3000
  disk_size_data       = 500 # Do not decrease this
  disk_size_flash      = 500 # Do not decrease this
  ## total_storage    = 2000 # This should equal disks_quantity x disk_size
}

ansible_vars_oracle_db = {
  service_user_name             = "oracle"
  database_global_database_name = "TSTNDA"
  database_sid                  = "TSTNDA"

  ## oradb_sys_password            = "/${environment_name}/delius-core/oracle-database/db/oradb_sys_password"
  ## oradb_system_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_system_password"
  ## oradb_dbsnmp_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_dbsnmp_password"
  ## oradb_asmsnmp_password        = "/${environment_name}/delius-core/oracle-database/db/oradb_asmsnmp_password"
  database_characterset = "AL32UTF8"

  database_bootstrap_restore = "True"                                                                        # whether primary db has db restore on bootstrap
  database_backup            = "dbbackup/dev/delius"                                                         # path in S3 to directory backup files
  database_backup_sys_passwd = "/dbbackup/delius-core-dev/delius-core/oracle-database/db/oradb_sys_password" # ssm parameter store name for db backup password
  database_backup_location   = "/u01/backup"                                                                 #default for local testing
  oracle_dbca_template_file  = "database"
}

# enable ingress from the CI (Jenkins/AWS Codepipeline)
ci_db_ingress_1521 = true

# WebLogic
delius_app_config = {

  # Increase min capacity due to issues with regression pack execution
  # DST-12284 Intermittent 502 Bad Gateway / 504 Gateway Timeout errors
  min_capacity = 8
  max_capacity = 10

  env_TRAINING_MODE_APP_NAME = "National Delius - TEST USE ONLY"

  # oauth
  env_OAUTH_URL = "https://sign-in-dev.hmpps.service.justice.gov.uk/auth"
  # user sign-in
  env_OAUTH_LOGIN_ENABLED          = "false"
  env_OAUTH_CLIENT_ID              = "delius-ui"
  secret_OAUTH_CLIENT_SECRET       = "/delius-test/delius/weblogic/ndelius-domain/oauth-client-secret"
  env_OAUTH_TOKEN_VERIFICATION_URL = "https://token-verification-api-dev.prison.service.justice.gov.uk/token/verify"
  env_OAUTH_CALLBACK_URL           = "https://ndelius.test.probation.service.justice.gov.uk/NDelius-war/delius/JSP/auth/token.jsp"
  env_OAUTH_DEFAULT_SCOPE          = "delius"
  env_OAUTH_LOGIN_NAME             = ""
  # api access
  env_API_CLIENT_ID        = "delius-ui-client"
  secret_API_CLIENT_SECRET = "/delius-test/delius/weblogic/ndelius-domain/api-client-secret"
  # gov.uk notify
  secret_NOTIFICATION_API_KEY = "/delius-test/delius/delius-application/govuk-notify/api-key"
  # probation search
  env_OFFENDER_SEARCH_API_URL = "https://probation-offender-search-dev.hmpps.service.justice.gov.uk"
  env_ELASTICSEARCH_URL       = "https://probation-search-dev.hmpps.service.justice.gov.uk/delius"

  env_PREPARE_CASE_FOR_SENTENCE_URL = "https://prepare-case-probation.service.justice.gov.uk"
  env_PSR_SERVICE_URL               = "https://pre-sentence-service-dev.hmpps.service.justice.gov.uk"
}
delius_SR28_config = {
  env_TRAINING_MODE_APP_NAME = "National Delius - TEST USE ONLY"
  # oauth
  env_OAUTH_URL = "https://sign-in-dev.hmpps.service.justice.gov.uk/auth"
  # user sign-in
  env_OAUTH_LOGIN_ENABLED          = "false"
  env_OAUTH_CLIENT_ID              = "delius-ui"
  secret_OAUTH_CLIENT_SECRET       = "/delius-test/delius/weblogic/ndelius-domain/oauth-client-secret"
  env_OAUTH_TOKEN_VERIFICATION_URL = "https://token-verification-api-dev.prison.service.justice.gov.uk/token/verify"
  env_OAUTH_CALLBACK_URL           = "https://ndelius-sr28.test.probation.service.justice.gov.uk/NDelius-war/delius/JSP/auth/token.jsp"
  env_OAUTH_DEFAULT_SCOPE          = "delius"
  env_OAUTH_LOGIN_NAME             = ""
  # api access
  env_API_CLIENT_ID        = "delius-ui-client"
  secret_API_CLIENT_SECRET = "/delius-test/delius/weblogic/ndelius-domain/api-client-secret"
  # gov.uk notify
  secret_NOTIFICATION_API_KEY = "/delius-test/delius/delius-application/govuk-notify/api-key"
  # probation search
  env_OFFENDER_SEARCH_API_URL = "https://probation-offender-search-dev.hmpps.service.justice.gov.uk"
  env_ELASTICSEARCH_URL       = "https://probation-search-dev.hmpps.service.justice.gov.uk/delius"

  env_PREPARE_CASE_FOR_SENTENCE_URL = "https://prepare-case-probation.service.justice.gov.uk"
  env_PSR_SERVICE_URL               = "https://pre-sentence-service-dev.hmpps.service.justice.gov.uk"
}

# GDPR
gdpr_config = {
  api_min_capacity  = 1 # Batch processing currently doesn't scale so fixing to 1 instance
  api_max_capacity  = 1
  api_version       = "0.35.0"
  ui_min_capacity   = 1
  ui_max_capacity   = 5
  ui_version        = "0.35.0"
  db_instance_class = "db.m5.large"
  db_storage        = 100
  # second (0-59), minute (0 - 59), hour (0 - 23), day of the month (1 - 31), month (1 - 12) (or JAN-DEC), day of the week (0 - 7) (or MON-SUN -- 0 or 7 is Sunday)
  # Example CRON "0 0 15 ? * MON-FRI" # Run at 3pm Monday to Friday
  # "0 0 9 ? * MON" Monday at 9am
  cron_identifyduplicates             = "-"                 # Batch schedules. Set to "-" to disable.
  cron_retainedoffenders              = "-"                 # disabled
  cron_retainedoffendersiicsa         = "0 0 8 ? * MON-FRI" # Run at 8am Monday to Friday
  cron_eligiblefordeletion            = "-"                 # disabled
  cron_deleteoffenders                = "-"                 # disabled
  cron_destructionlogclearing         = "-"                 # disabled
  cron_eligiblefordeletionsoftdeleted = "-"                 # disabled
}

# Merge
merge_config = {
  api_min_capacity = 1 # Batch processing currently doesn't scale so fixing to 1 instance
  api_max_capacity = 1
  api_version      = "0.29.0"
  ui_min_capacity  = 1
  ui_max_capacity  = 5
  ui_version       = "0.29.0"
  schedule         = "0 5/10 7-23 ? * MON-FRI" # When to run the merge/unmerge scheduled process
}

# User Management
umt_config = {
  version = "1.13.1"
}

# Delius API
delius_api_environment = {
  SPRING_PROFILES_ACTIVE                                = "applicationinsights"
  SPRING_DATASOURCE_USERNAME                            = "DELIUS_API_POOL"
  SPRING_DATASOURCE_TYPE                                = "oracle.jdbc.pool.OracleDataSource"
  SPRING_SECURITY_OAUTH2_RESOURCESERVER_JWT_JWK-SET-URI = "https://sign-in-dev.hmpps.service.justice.gov.uk/auth/.well-known/jwks.json"
  TOKENVERIFICATION_API_BASE_URL                        = "https://token-verification-api-dev.prison.service.justice.gov.uk"
  PRE-SENTENCE-SERVICE_BASEURL                          = "https://pre-sentence-service-dev.hmpps.service.justice.gov.uk"
}
delius_api_secrets = {
  APPINSIGHTS_INSTRUMENTATIONKEY = "/delius-test/delius/newtech/offenderapi/appinsights_key"
  SPRING_DATASOURCE_PASSWORD     = "/delius-test/delius/delius-database/db/delius_api_pool_password"
}

# Community API
community_api_ingress = [
  "51.140.222.8/32",  # azure hmpps-auth legacy server
  "20.39.162.11/32",  # azure hmpps-auth nomisapi-t3
  "20.39.161.240/32", # azure hmpps-auth nomisapi-t2
  "54.76.254.148/32", # DXW
]

env_user_access_cidr_blocks = [
  "54.76.254.148/32" # DXW VPN
]

# CIDR of corresponding Modernisation Platform VPC. Used to allow traffic between legacy and migration environments
mp_corresponding_vpc_cidr = "10.26.8.0/21"

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
    "value" = "delius-test"
  },
  {
    "name"  = "DSS_DSSWEBSERVERURL"
    "value" = "https://interface-app-internal.test.delius.probation.hmpps.dsd.io/NDeliusDSS/UpdateOffender"
  },
  {
    "name"  = "DSS_PROJECT"
    "value" = "delius"
  }
]
