# delius-pre-prod  delius-core.tfvar
## Delius Core Specific

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size        = "x_large"
  instance_type        = "r5.4xlarge"
  disk_type_data       = "gp3" # Requires iops and throughput to be set
  disk_throughput_data = 700   # Only relevant when disks_volume_type = "gp3"
  disk_type_root       = "gp3" # Requires iops and throughput to be set
  disk_throughput_root = 700   # Only relevant when disks_volume_type = "gp3"
  disks_quantity       = 16    # Do not decrease this
  disks_quantity_data  = 10
  disk_iops_root       = 3000
  disk_iops_data       = 3000
  disk_iops_flash      = 3000
  disk_size_data       = 1000 # Do not decrease this
  disk_size_flash      = 1000 # Do not decrease this
  ## total_storage    = 16000 # This should equal disks_quantity x disk_size
}

ansible_vars_oracle_db = {
  service_user_name             = "oracle"
  database_global_database_name = "PRENDA"
  database_sid                  = "PRENDA"
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

# WebLogic
delius_app_config = {
  # oauth
  env_OAUTH_URL = "https://sign-in-preprod.hmpps.service.justice.gov.uk/auth"
  # user sign-in
  env_OAUTH_LOGIN_ENABLED          = "false"
  env_OAUTH_CLIENT_ID              = "delius-ui"
  secret_OAUTH_CLIENT_SECRET       = "/delius-pre-prod/delius/weblogic/ndelius-domain/oauth-client-secret"
  env_OAUTH_TOKEN_VERIFICATION_URL = "https://token-verification-api-preprod.prison.service.justice.gov.uk/token/verify"
  env_OAUTH_CALLBACK_URL           = "https://ndelius.pre-prod.delius.probation.hmpps.dsd.io/NDelius-war/delius/JSP/auth/token.jsp"
  env_OAUTH_DEFAULT_SCOPE          = "delius"
  env_OAUTH_LOGIN_NAME             = ""
  # azure application insights
  secret_APPLICATIONINSIGHTS_CONNECTION_STRING = "/delius-pre-prod/delius/probation-integration/application-insights/connection-string"
  # api access
  env_API_CLIENT_ID        = "delius-ui-client"
  secret_API_CLIENT_SECRET = "/delius-pre-prod/delius/weblogic/ndelius-domain/api-client-secret"
  # probation search
  env_OFFENDER_SEARCH_API_URL = "https://probation-offender-search-preprod.hmpps.service.justice.gov.uk"
  env_ELASTICSEARCH_URL       = "https://probation-search-preprod.hmpps.service.justice.gov.uk/delius"
  # Temp set logging to DEBUG
  env_LOG_LEVEL_NDELIUS = "DEBUG"
  # PSR Service
  env_PSR_SERVICE_URL = "https://pre-sentence-service-preprod.hmpps.service.justice.gov.uk"
  env_PDFCREATION_URL = "https://ndelius-new-tech-preprod.hmpps.service.justice.gov.uk/newTech"
}
delius_eis_config = {
  # azure application insights
  secret_APPLICATIONINSIGHTS_CONNECTION_STRING = "/delius-pre-prod/delius/probation-integration/application-insights/connection-string"
}

# Dual-running config
dual_run_with_sr28 = true
delius_SR28_config = {
  # oauth
  env_OAUTH_URL = "https://sign-in-preprod.hmpps.service.justice.gov.uk/auth"
  # user sign-in
  env_OAUTH_LOGIN_ENABLED          = "false"
  env_OAUTH_CLIENT_ID              = "delius-ui"
  secret_OAUTH_CLIENT_SECRET       = "/delius-pre-prod/delius/weblogic/ndelius-domain/oauth-client-secret"
  env_OAUTH_TOKEN_VERIFICATION_URL = "https://token-verification-api-preprod.prison.service.justice.gov.uk/token/verify"
  env_OAUTH_CALLBACK_URL           = "https://ndelius.pre-prod.delius.probation.hmpps.dsd.io/NDelius-war/delius/JSP/auth/token.jsp"
  env_OAUTH_DEFAULT_SCOPE          = "delius"
  env_OAUTH_LOGIN_NAME             = ""
  # azure application insights
  secret_APPLICATIONINSIGHTS_CONNECTION_STRING = "/delius-pre-prod/delius/probation-integration/application-insights/connection-string"
  # api access
  env_API_CLIENT_ID        = "delius-ui-client"
  secret_API_CLIENT_SECRET = "/delius-pre-prod/delius/weblogic/ndelius-domain/api-client-secret"
  # probation search
  env_OFFENDER_SEARCH_API_URL = "https://probation-offender-search-preprod.hmpps.service.justice.gov.uk"
  env_ELASTICSEARCH_URL       = "https://probation-search-preprod.hmpps.service.justice.gov.uk/delius"
  # Temp set logging to DEBUG
  env_LOG_LEVEL_NDELIUS = "DEBUG"
  # PSR Service
  env_PSR_SERVICE_URL = "https://pre-sentence-service-preprod.hmpps.service.justice.gov.uk"
}

# GDPR
gdpr_config = {
  api_min_capacity = 1 # Batch processing currently doesn't scale so fixing to 1 instance
  api_max_capacity = 1
  api_memory       = 16384 # 16GB
  api_cpu          = 2048  # 2 vCPUs
  ui_min_capacity  = 2
  ui_max_capacity  = 10
  api_version      = "0.37.0"
  ui_version       = "0.37.0"
}

# Merge
merge_config = {
  api_min_capacity = 1 # Batch processing currently doesn't scale so fixing to 1 instance
  api_max_capacity = 1
  ui_min_capacity  = 2
  ui_max_capacity  = 10
  api_version      = "0.31.0" # Application version
  ui_version       = "0.31.0" # Application version
}

# UMT
umt_config = {
  version   = "1.15.0"
}

# Delius API
delius_api_environment = {
  SPRING_PROFILES_ACTIVE                                = "applicationinsights"
  SPRING_DATASOURCE_USERNAME                            = "DELIUS_API_POOL"
  SPRING_DATASOURCE_TYPE                                = "oracle.jdbc.pool.OracleDataSource"
  SPRING_SECURITY_OAUTH2_RESOURCESERVER_JWT_JWK-SET-URI = "https://sign-in-preprod.hmpps.service.justice.gov.uk/auth/.well-known/jwks.json"
  TOKENVERIFICATION_API_BASE_URL                        = "https://token-verification-api-preprod.prison.service.justice.gov.uk"
  PRE-SENTENCE-SERVICE_BASEURL                          = "https://pre-sentence-service-preprod.hmpps.service.justice.gov.uk"
}
delius_api_secrets = {
  APPINSIGHTS_INSTRUMENTATIONKEY = "/delius-pre-prod/delius/newtech/offenderapi/appinsights_key"
  SPRING_DATASOURCE_PASSWORD     = "/delius-pre-prod/delius/delius-database/db/delius_api_pool_password"
}

# Community API
community_api_ingress = [
  "51.140.228.7/32",  # azure hmpps-auth legacy server
  "20.39.163.219/32", # azure hmpps-auth nomisapi-preprod
]

env_user_access_cidr_blocks = [
  "5.148.69.16/28",    # Temporary access for NCC Group ITHC - Cheltenham  (review/remove after 06/02/2023 - see Slack thread: https://mojdt.slack.com/archives/C032BQQHJE5/p1672764936788469)
  "154.51.64.64/27",   # Temporary access for NCC Group ITHC - Leeds       (review/remove after 06/02/2023 - see Slack thread: https://mojdt.slack.com/archives/C032BQQHJE5/p1672764936788469)
  "167.98.200.192/27", # Temporary access for NCC Group ITHC - London      (review/remove after 06/02/2023 - see Slack thread: https://mojdt.slack.com/archives/C032BQQHJE5/p1672764936788469)
  "5.148.32.192/26",   # Temporary access for NCC Group ITHC - Manchester  (review/remove after 06/02/2023 - see Slack thread: https://mojdt.slack.com/archives/C032BQQHJE5/p1672764936788469)
  "195.95.131.0/24",   # Temporary access for NCC Group ITHC - Manchester  (review/remove after 06/02/2023 - see Slack thread: https://mojdt.slack.com/archives/C032BQQHJE5/p1672764936788469)
]

# CIDR of corresponding Modernisation Platform VPC. Used to allow traffic between legacy and migration environments
mp_corresponding_vpc_cidr = "10.27.0.0/21"

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
    "value" = "delius-pre-prod"
  },
  {
    "name"  = "DSS_DSSWEBSERVERURL"
    "value" = "https://interface-app-internal.pre-prod.delius.probation.hmpps.dsd.io/NDeliusDSS/UpdateOffender"
  },
  {
    "name"  = "DSS_PROJECT"
    "value" = "delius"
  },
  {
    "name"  = "JAVA_OPTS"
    "value" = "-Xms1024m -Xmx2048m"
  }
]

# Use dsd.io public zone until transition to gov.uk is complete for this environment
delius_core_public_zone = "legacy"

# Self Signed Certs
self_signed_ca_algorithm                 = "RSA"
self_signed_ca_rsa_bits                  = "2048"
self_signed_ca_validity_period_hours     = 8544
self_signed_ca_early_renewal_hours       = 672
self_signed_server_algorithm             = "RSA"
self_signed_server_rsa_bits              = "2048"
self_signed_server_validity_period_hours = 2160
self_signed_server_early_renewal_hours   = 336
