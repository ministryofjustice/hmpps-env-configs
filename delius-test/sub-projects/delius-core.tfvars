# delius-test  delius-core.tfvars
## Delius Core Specific

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size       = "medium"
  instance_type       = "r5.xlarge"
  disks_quantity      = 4 # Do not decrease this
  disks_quantity_data = 2
  disk_iops_data      = 1000
  disk_iops_flash     = 500
  disk_size_data      = 500 # Do not decrease this
  disk_size_flash     = 500 # Do not decrease this
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
  env_TRAINING_MODE_APP_NAME = "National Delius - TEST USE ONLY"

  # oauth
  env_OAUTH_URL = "https://sign-in-dev.hmpps.service.justice.gov.uk/auth"
  # user sign-in
  env_OAUTH_LOGIN_ENABLED          = "true"
  env_OAUTH_CLIENT_ID              = "delius-ui"
  secret_OAUTH_CLIENT_SECRET       = "/delius-test/delius/weblogic/ndelius-domain/oauth-client-secret"
  env_OAUTH_TOKEN_VERIFICATION_URL = "https://token-verification-api-dev.prison.service.justice.gov.uk/token/verify"
  env_OAUTH_CALLBACK_URL           = "https://ndelius.test.probation.service.justice.gov.uk/NDelius-war/delius/JSP/auth/token.jsp"
  env_OAUTH_DEFAULT_SCOPE          = "delius"
  env_OAUTH_LOGIN_NAME             = ""
  # api access
  env_API_CLIENT_ID        = "delius-ui-client"
  secret_API_CLIENT_SECRET = "/delius-test/delius/weblogic/ndelius-domain/api-client-secret"

  env_PREPARE_CASE_FOR_SENTENCE_URL = "https://prepare-case-probation.service.justice.gov.uk"
}

# GDPR
gdpr_config = {
  api_min_capacity = 1 # Batch processing currently doesn't scale so fixing to 1 instance
  api_max_capacity = 1
  ui_min_capacity  = 1
  ui_max_capacity  = 5
}

# Merge
merge_config = {
  api_min_capacity = 1 # Batch processing currently doesn't scale so fixing to 1 instance
  api_max_capacity = 1
  ui_min_capacity  = 1
  ui_max_capacity  = 5
  schedule         = "0 0/1 * * * *"      # When to run the merge/unmerge scheduled process
}

# User Management
umt_config = {
  version = "latest"
}

# Delius API
delius_api_environment = {
  SPRING_PROFILES_ACTIVE                                = "applicationinsights"
  TOKENVERIFICATION_API_BASE_URL                        = "https://token-verification-api-dev.prison.service.justice.gov.uk"
  SPRING_SECURITY_OAUTH2_RESOURCESERVER_JWT_JWK-SET-URI = "https://sign-in-dev.hmpps.service.justice.gov.uk/auth/.well-known/jwks.json"
  SPRING_DATASOURCE_USERNAME                            = "DELIUS_API_POOL"
  SPRING_DATASOURCE_TYPE                                = "oracle.jdbc.pool.OracleDataSource"
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
