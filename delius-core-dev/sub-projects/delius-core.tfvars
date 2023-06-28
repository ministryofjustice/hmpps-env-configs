# delius-core-dev  delius-core.tfvars
## Delius Core Specific

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size        = "small"
  instance_type        = "t3.large" # maps to instance_type aws_instance attribute
  disk_type_data       = "gp3"      # Requires iops and throughput to be set
  disk_throughput_data = 125        # Only relevant when disks_volume_type = "gp3"
  disk_type_root       = "gp3"      # Requires iops and throughput to be set
  disk_throughput_root = 125        # Only relevant when disks_volume_type = "gp3"
  disks_quantity       = 2          # Do not decrease this
  disks_quantity_data  = 1
  disk_iops_root       = 3000
  disk_iops_data       = 3000 # Used for setting ebs volume iops if disks_quantity value applicable, if not flash value used
  disk_iops_flash      = 3000 # Used for setting ebs volume iops if disks_quantity value not applicable
  disk_size_data       = 500  # Do not decrease this
  disk_size_flash      = 500  # Do not decrease this
  ## total_storage    = 1000 # This should equal disks_quantity x disk_size
}

ansible_vars_oracle_db = {
  service_user_name             = "oracle"
  database_global_database_name = "DNDA"
  database_sid                  = "DNDA"
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

# enable ingress from the CI (Jenkins/AWS Codepipeline)
ci_db_ingress_1521 = true

# Delius WebLogic
delius_app_config = {
  env_TRAINING_MODE_APP_NAME = "National Delius - DEVELOPMENT USE ONLY"
  env_TRAINING_MODE          = "development"

  # oauth
  env_OAUTH_URL = "https://sign-in-dev.hmpps.service.justice.gov.uk/auth"
  # user sign-in
  env_OAUTH_LOGIN_ENABLED          = "true"
  env_OAUTH_CLIENT_ID              = "delius-ui"
  secret_OAUTH_CLIENT_SECRET       = "/delius-core-dev/delius-core/weblogic/ndelius-domain/oauth-client-secret"
  env_OAUTH_TOKEN_VERIFICATION_URL = "https://token-verification-api-dev.prison.service.justice.gov.uk/token/verify"
  env_OAUTH_CALLBACK_URL           = "https://ndelius.dev.probation.service.justice.gov.uk/NDelius-war/delius/JSP/auth/token.jsp"
  env_OAUTH_DEFAULT_SCOPE          = "delius"
  env_OAUTH_LOGIN_NAME             = ""
  # api access
  env_API_CLIENT_ID        = "delius-ui-client"
  secret_API_CLIENT_SECRET = "/delius-core-dev/delius-core/weblogic/ndelius-domain/api-client-secret"
  # gov.uk notify
  secret_NOTIFICATION_API_KEY = "/delius-core-dev/delius-core/delius-application/govuk-notify/api-key"
}

# User Management
umt_config = {
  version = "latest"
}

# Delius API
delius_api_environment = {
  LOGGING_LEVEL_ORG_HIBERNATE_SQL                       = "DEBUG"
  SPRING_JPA_PROPERTIES_HIBERNATE_SHOW_SQL              = "true"
  SPRING_DATASOURCE_USERNAME                            = "DELIUS_API_POOL"
  SPRING_DATASOURCE_TYPE                                = "oracle.jdbc.pool.OracleDataSource"
  SPRING_SECURITY_OAUTH2_RESOURCESERVER_JWT_JWK-SET-URI = "https://sign-in-dev.hmpps.service.justice.gov.uk/auth/.well-known/jwks.json"
  TOKENVERIFICATION_API_BASE_URL                        = "https://token-verification-api-dev.prison.service.justice.gov.uk"
  PRE-SENTENCE-SERVICE_BASEURL                          = "https://pre-sentence-service-dev.hmpps.service.justice.gov.uk"
}
delius_api_secrets = {
  SPRING_DATASOURCE_PASSWORD = "/delius-core-dev/delius-core/delius-database/db/delius_api_pool_password"
}

# PDF Generator Service
pdf_generator_config = {
  env_DEBUG_LOG = true
}

# Community API
community_api_ingress = [
  "51.140.222.8/32",  # azure hmpps-auth legacy server
  "20.39.162.11/32",  # azure hmpps-auth nomisapi-t3
  "20.39.161.240/32", # azure hmpps-auth nomisapi-t2
  "54.76.254.148/32", # DXW
]

env_user_access_cidr_blocks = []

# CIDR of corresponding Modernisation Platform VPC. Used to allow traffic between legacy and migration environments
mp_corresponding_vpc_cidr = "10.26.24.0/21"

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
    "value" = "delius-core-dev"
  },
  {
    "name"  = "DSS_DSSWEBSERVERURL"
    "value" = "https://interface-app-internal.dev.delius-core.probation.hmpps.dsd.io/NDeliusDSS"
  },
  {
    "name"  = "DSS_PROJECT"
    "value" = "delius-core"
  }
]
