# delius-prod  delius-core.tfvar
## Delius Core Specific

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size        = "x_large"
  instance_type        = "r5.4xlarge"
  disk_type_data       = "gp3" # Requires iops and throughput to be set
  disk_throughput_data = 1000  # Only relevant when disks_volume_type = "gp3"
  disk_type_root       = "gp3" # Requires iops and throughput to be set
  disk_throughput_root = 1000  # Only relevant when disks_volume_type = "gp3"
  disks_quantity       = 16    # Do not decrease this
  disks_quantity_data  = 10
  disk_iops_root       = 4000
  disk_iops_data       = 4000
  disk_iops_flash      = 4000
  disk_size_data       = 1000 # Do not decrease this
  disk_size_flash      = 1000 # Do not decrease this
  ## total_storage    = 16000 # This should equal disks_quantity x disk_size
}

ansible_vars_oracle_db = {
  service_user_name             = "oracle"
  database_global_database_name = "PRDNDA"
  database_sid                  = "PRDNDA"
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

# LDAP
ldap_config = {
  backup_retention_days = 90
}

# WebLogic
delius_app_config = {
  min_capacity = 40 # Increased to handle higher memory usage following session timeout extension

  # oauth
  env_OAUTH_URL = "https://sign-in.hmpps.service.justice.gov.uk/auth"
  # user sign-in
  env_OAUTH_LOGIN_ENABLED          = "false"
  env_OAUTH_CLIENT_ID              = "delius-ui"
  secret_OAUTH_CLIENT_SECRET       = "/delius-prod/delius/weblogic/ndelius-domain/oauth-client-secret"
  env_OAUTH_TOKEN_VERIFICATION_URL = "https://token-verification-api.prison.service.justice.gov.uk/token/verify"
  env_OAUTH_CALLBACK_URL           = "https://ndelius.probation.service.justice.gov.uk/NDelius-war/delius/JSP/auth/token.jsp"
  env_OAUTH_DEFAULT_SCOPE          = "delius"
  env_OAUTH_LOGIN_NAME             = ""
  # azure application insights
  secret_APPLICATIONINSIGHTS_CONNECTION_STRING = "/delius-prod/delius/probation-integration/application-insights/connection-string"
  # api access
  env_API_CLIENT_ID        = "delius-ui-client"
  secret_API_CLIENT_SECRET = "/delius-prod/delius/weblogic/ndelius-domain/api-client-secret"
  # gov.uk notify
  secret_NOTIFICATION_API_KEY = "/delius-prod/delius/delius-application/govuk-notify/api-key"
  # probation search
  env_OFFENDER_SEARCH_API_URL = "https://probation-offender-search.hmpps.service.justice.gov.uk"
  env_ELASTICSEARCH_URL       = "https://probation-search.hmpps.service.justice.gov.uk/delius"

  env_PREPARE_CASE_FOR_SENTENCE_URL = "https://prepare-case-probation.service.justice.gov.uk/"
  env_PSR_SERVICE_URL               = "https://pre-sentence-service.hmpps.service.justice.gov.uk"
}
delius_eis_config = {
  # azure application insights
  secret_APPLICATIONINSIGHTS_CONNECTION_STRING = "/delius-prod/delius/probation-integration/application-insights/connection-string"
}

# WebLogic
dual_run_with_sr28 = true
delius_SR28_config = {
  # oauth
  env_OAUTH_URL = "https://sign-in.hmpps.service.justice.gov.uk/auth"
  # user sign-in
  env_OAUTH_LOGIN_ENABLED          = "false"
  env_OAUTH_CLIENT_ID              = "delius-ui"
  secret_OAUTH_CLIENT_SECRET       = "/delius-prod/delius/weblogic/ndelius-domain/oauth-client-secret"
  env_OAUTH_TOKEN_VERIFICATION_URL = "https://token-verification-api.prison.service.justice.gov.uk/token/verify"
  env_OAUTH_CALLBACK_URL           = "https://ndelius.probation.service.justice.gov.uk/NDelius-war/delius/JSP/auth/token.jsp"
  env_OAUTH_DEFAULT_SCOPE          = "delius"
  env_OAUTH_LOGIN_NAME             = ""
  # azure application insights
  secret_APPLICATIONINSIGHTS_CONNECTION_STRING = "/delius-prod/delius/probation-integration/application-insights/connection-string"
  # api access
  env_API_CLIENT_ID        = "delius-ui-client"
  secret_API_CLIENT_SECRET = "/delius-prod/delius/weblogic/ndelius-domain/api-client-secret"
  # gov.uk notify
  secret_NOTIFICATION_API_KEY = "/delius-prod/delius/delius-application/govuk-notify/api-key"
  # probation search
  env_OFFENDER_SEARCH_API_URL = "https://probation-offender-search.hmpps.service.justice.gov.uk"
  env_ELASTICSEARCH_URL       = "https://probation-search.hmpps.service.justice.gov.uk/delius"

  env_PREPARE_CASE_FOR_SENTENCE_URL = "https://prepare-case-probation.service.justice.gov.uk/"
  env_PSR_SERVICE_URL               = "https://pre-sentence-service.hmpps.service.justice.gov.uk"
}

# GDPR
gdpr_config = {
  api_min_capacity = 1 # Batch processing currently doesn't scale so fixing to 1 instance
  api_max_capacity = 1
  ui_min_capacity  = 2
  ui_max_capacity  = 10
}

# Merge
merge_config = {
  # Temporarily disable merge 0.30.0 in production until DB patch is applied:
  api_min_capacity = 0
  api_max_capacity = 0
  ui_min_capacity  = 0
  ui_max_capacity  = 0
}

# Delius API
delius_api_environment = {
  SPRING_PROFILES_ACTIVE                                = "applicationinsights"
  SPRING_DATASOURCE_USERNAME                            = "DELIUS_API_POOL"
  SPRING_DATASOURCE_TYPE                                = "oracle.jdbc.pool.OracleDataSource"
  SPRING_SECURITY_OAUTH2_RESOURCESERVER_JWT_JWK-SET-URI = "https://sign-in.hmpps.service.justice.gov.uk/auth/.well-known/jwks.json"
  TOKENVERIFICATION_API_BASE_URL                        = "https://token-verification-api.prison.service.justice.gov.uk"
  PRE-SENTENCE-SERVICE_BASEURL                          = "https://pre-sentence-service.hmpps.service.justice.gov.uk"
}
delius_api_secrets = {
  APPINSIGHTS_INSTRUMENTATIONKEY = "/delius-prod/delius/newtech/offenderapi/appinsights_key"
  SPRING_DATASOURCE_PASSWORD     = "/delius-prod/delius/delius-database/db/delius_api_pool_password"
}

# Community API
community_api_ingress = [
  "51.141.82.211/32", # azure hmpps-auth legacy server
  "40.81.114.76/32",  # azure hmpps-auth nomisapi-prod
]

env_user_access_cidr_blocks = [
  # IP ranges for other interfacing systems
  # - CFO
  "194.168.183.130/32",

  # Requested by Mark Hosmer ALS-3983
  "51.149.249.0/27",
  "51.149.249.32/27",
  "194.33.248.0/24",
  "194.33.249.0/24",
]

# CIDR of corresponding Modernisation Platform VPC. Used to allow traffic between legacy and migration environments
mp_corresponding_vpc_cidr = "10.27.8.0/21"

# DSS Batch Task
dss_job_image = "895523100917.dkr.ecr.eu-west-2.amazonaws.com/hmpps/dss:3.1.6"

dss_job_envvars = [
  {
    "name"  = "DSS_TESTMODE"
    "value" = "false"
  },
  {
    "name"  = "DSS_TESTINGAUTOCORRECT"
    "value" = "true"
  },
  {
    "name"  = "DSS_ENVIRONMENT"
    "value" = "delius-prod"
  },
  {
    "name"  = "DSS_DSSWEBSERVERURL"
    "value" = "https://interface-app-internal.probation.service.justice.gov.uk/NDeliusDSS/UpdateOffender"
  },
  {
    "name"  = "DSS_HMPSSERVERURL"
    "value" = "https://www.offloc.service.justice.gov.uk/"
  },
  {
    "name"  = "DSS_PROJECT"
    "value" = "delius"
  },
  {
    "name"  = "JAVA_OPTS"
    "value" = "-Xms1024m -Xmx2560m"
  },
  {
    "name"  = "PARSEERRORMAXLIMITOVERRIDE"
    "value" = "100"
  }
]

# Make the National Delius front-end pingdom report available to the public:
pingdom_publicreports = ["ndelius_frontend"]

# In production, the "legacy" public zone actually refers to the .gov.uk domain, and the strategic domain isn't created.
# This means we must point delius-core to the "legacy" zone for prod, until we manage to take out the manual/conditional bits.
delius_core_public_zone = "legacy"
