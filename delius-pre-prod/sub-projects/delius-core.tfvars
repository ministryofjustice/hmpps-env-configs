# delius-pre-prod  delius-core.tfvar
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
  env_OAUTH_URL                       = "https://sign-in-preprod.hmpps.service.justice.gov.uk/auth"
  env_OAUTH_CALLBACK_URL              = "https://ndelius.pre-prod.delius.probation.hmpps.dsd.io/NDelius-war/delius/JSP/auth/token.jsp"
  env_OAUTH_LOGIN_NAME                = "Login using justice.gov.uk credentials"
  env_OAUTH_USER_INFO_ENDPOINT        = "/api/user/me"
  env_OAUTH_DELIUS_USERNAME_ATTRIBUTE = "username"
  env_OAUTH_DEFAULT_SCOPE             = "delius"
  env_OAUTH_CLIENT_ID                 = "delius-unilink-preprod"
  secret_OAUTH_CLIENT_SECRET          = "/delius-pre-prod/delius/weblogic/ndelius-domain/oauth-client-secret"
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
  APPINSIGHTS_INSTRUMENTATIONKEY = "/delius-pre-prod/delius/newtech/offenderapi/appinsights_key"
  SPRING_DATASOURCE_PASSWORD     = "/delius-pre-prod/delius/delius-database/db/delius_api_pool_password"
}

# Community API
community_api_ingress = [
  "51.140.228.7/32",  # azure hmpps-auth legacy server
  "20.39.163.219/32", # azure hmpps-auth nomisapi-preprod
]

env_user_access_cidr_blocks = [
  # Parent Organisation IP ranges
  # -MTCNovo
  "62.25.109.202/32", # MTCNovo old frontend desktops Egress IP (Pre March 2021)
  "192.57.152.98/32", # MTCNovo new frontend desktops Egress IP (March 2021 on)
  "52.56.48.146/32",  # MTCNovo ZScaler internet-facing IP addresses
  "52.56.64.210/32",  # MTCNovo ZScaler internet-facing IP addresses

  # -SEETEC
  "80.86.46.16/30",
  "195.224.76.229/32",
  "51.179.199.82/32", #ROK user outbound for wales,DDC,BGSW - requested via slack support channel https://mojdt.slack.com/archives/GNXRQ5HUN/p1570199298064800
  "195.153.64.66/32", # Seetec VPN

  # -Interserve
  "46.227.51.224/29",
  "46.227.51.232/29",
  "46.227.51.240/28",
  "51.179.196.131/32",

  # -Meganexus
  "51.179.210.36/32",
  "83.151.209.178/32",  # PF SPG Server Public IP/NAT
  "83.151.209.179/32",  # PF SPG Server Public IP/NAT 2
  "213.105.186.130/31", # Meganexus London (Firewall IP + Gateway IP)
  "202.189.235.70/32",  # Meganexus India

  # -Sodexo Justice Services
  "80.86.46.16/31",
  "80.86.46.18/32",

  # -RRP (Reducing Reoffending Partnership)
  "62.253.83.37/32",

  # - ARCC/DTV (Achieving Real Change in Communities - Durham & Tees Valley)
  "51.179.197.1/32",

  # - EOS
  "5.153.255.210/32", # EOS Public IP
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
