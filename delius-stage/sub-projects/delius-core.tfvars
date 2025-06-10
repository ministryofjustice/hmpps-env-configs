# delius-stage  delius-core.tfvar
## Delius Core Specific

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size        = "x_large"
  instance_type        = "r5.2xlarge"
  disk_type_data       = "gp3" # Requires iops and throughput to be set
  disk_throughput_data = 400   # Only relevant when disks_volume_type = "gp3"
  disk_type_root       = "gp3" # Requires iops and throughput to be set
  disk_throughput_root = 400   # Only relevant when disks_volume_type = "gp3"
  disks_quantity       = 11    # Do not decrease this without adjusting ASM
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
  database_global_database_name = "STGNDA"
  database_sid                  = "STGNDA"
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

# LDAPhttps://github.com/ministryofjustice/hmpps-engineering-platform-terraform/pull/430
ldap_config = {
  instance_type = "m5.xlarge"
}

# WebLogic
delius_app_config = {
  min_capacity = 2
  max_capacity = 5

  # oauth
  env_OAUTH_URL = "https://sign-in-preprod.hmpps.service.justice.gov.uk/auth"
  # api access
  env_API_CLIENT_ID        = "delius-ui-client"
  secret_API_CLIENT_SECRET = "/delius-stage/delius/weblogic/ndelius-domain/api-client-secret"
  # Alfresco
  # env_DMS_HOST                      = "hmpps-delius-alfresco-stage.apps.live.cloud-platform.service.justice.gov.uk"
  # env_DMS_OFFICE_URI_HOST           = "hmpps-delius-alfresco-stage.apps.live.cloud-platform.service.justice.gov.uk"
  env_PREPARE_CASE_FOR_SENTENCE_URL = "https://prepare-a-case-preprod.apps.live-1.cloud-platform.service.justice.gov.uk"
}

# delius_eis_config = {
#   # alfresco
#   env_DMS_HOST            = "hmpps-delius-alfresco-stage.apps.live.cloud-platform.service.justice.gov.uk"
#   env_DMS_OFFICE_URI_HOST = "hmpps-delius-alfresco-stage.apps.live.cloud-platform.service.justice.gov.uk"
# }

# Dual-running config:
dual_run_with_sr28 = true
delius_SR28_config = {
  # oauth
  env_OAUTH_URL = "https://sign-in-preprod.hmpps.service.justice.gov.uk/auth"
  # api access
  # env_API_CLIENT_ID                 = "delius-ui-client"
  # secret_API_CLIENT_SECRET          = "/delius-stage/delius/weblogic/ndelius-domain/api-client-secret"
  # env_DMS_HOST                      = "hmpps-delius-alfresco-stage.apps.live.cloud-platform.service.justice.gov.uk"
  # env_DMS_OFFICE_URI_HOST           = "hmpps-delius-alfresco-stage.apps.live.cloud-platform.service.justice.gov.uk"
  env_PREPARE_CASE_FOR_SENTENCE_URL = "https://prepare-a-case-preprod.apps.live-1.cloud-platform.service.justice.gov.uk"
}

# GDPR
gdpr_config = {
  # api_min_capacity      = 1 # Batch processing currently doesn't scale so fixing to 1 instance
  # api_max_capacity      = 1
  # api_memory            = 16384 # 16GB
  # api_cpu               = 2048  # 2 vCPUs
  # ui_min_capacity       = 2
  # ui_max_capacity       = 10
  # api_version           = "0.39.0"
  # ui_version            = "0.39.0"
  # env_ALFRESCO_DMS-HOST = "hmpps-delius-alfresco-stage.apps.live.cloud-platform.service.justice.gov.uk"
  # Example CRON "0 0 15 ? * MON-FRI" # Run at 3pm Monday to Friday
  cron_identifyduplicates             = "-" # Batch schedules. Set to "-" to disable.
  cron_retainedoffenders              = "-" #
  cron_retainedoffendersiicsa         = "-" #
  cron_eligiblefordeletion            = "-" #
  # cron_deleteoffenders                = "-" # Disabled
  cron_destructionlogclearing         = "-" #
  cron_eligiblefordeletionsoftdeleted = "-" #
}

# Merge
merge_config = {
  # api_min_capacity      = 1 # Batch processing currently doesn't scale so fixing to 1 instance
  # api_max_capacity      = 1
  # ui_min_capacity       = 2
  # ui_max_capacity       = 10
  # api_version           = "0.35.0"
  # ui_version            = "0.35.0"
  # env_ALFRESCO_DMS-HOST = "hmpps-delius-alfresco-stage.apps.live.cloud-platform.service.justice.gov.uk"
}

# User Management
umt_config = {
  version = "1.17.0"
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
  APPINSIGHTS_INSTRUMENTATIONKEY = "/delius-stage/delius/newtech/offenderapi/appinsights_key"
  SPRING_DATASOURCE_PASSWORD     = "/delius-stage/delius/delius-database/db/delius_api_pool_password"
}

# community_api_config = {
#   env_ALFRESCO_BASEURL = "hmpps-delius-alfresco-stage.apps.live.cloud-platform.service.justice.gov.uk/alfresco/s/noms-spg"
# }

# Community API
community_api_ingress = [
  "51.140.228.7/32",  # azure hmpps-auth legacy server
  "20.39.163.219/32", # azure hmpps-auth nomisapi-preprod
]

# New Tech
# new_tech_config = {
#   env_STORE_ALFRESCO_URL = "https://hmpps-delius-alfresco-stage.apps.live.cloud-platform.service.justice.gov.uk/alfresco/service/"
# }


env_user_access_cidr_blocks = [
  # -i2n (Northgate) bastion IP traffic
  "62.232.198.68/32",
]

# CIDR of corresponding Modernisation Platform VPC. Used to allow traffic between legacy and migration environments
mp_corresponding_vpc_cidr = "10.27.0.0/21"

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
    "value" = "delius-stage"
  },
  {
    "name"  = "DSS_DSSWEBSERVERURL"
    "value" = "https://interface-app-internal.stage.delius.probation.hmpps.dsd.io/NDeliusDSS/UpdateOffender"
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
    "value" = "-Xms1024m -Xmx2048m"
  },
  {
    "name"  = "PARSEERRORMAXLIMITOVERRIDE"
    "value" = "100"
  }
]

# Self Signed Certs
self_signed_ca_algorithm                 = "RSA"
self_signed_ca_rsa_bits                  = "2048"
self_signed_ca_validity_period_hours     = 8544
self_signed_ca_early_renewal_hours       = 672
self_signed_server_algorithm             = "RSA"
self_signed_server_rsa_bits              = "2048"
self_signed_server_validity_period_hours = 2160
self_signed_server_early_renewal_hours   = 336
