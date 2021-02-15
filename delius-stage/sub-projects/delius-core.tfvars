# delius-stage  delius-core.tfvar
## Delius Core Specific

egress_443 = true
egress_80  = true

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size       = "x_large"
  instance_type       = "r5.2xlarge"
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

# LDAP
ldap_config = {
  instance_type = "m5.xlarge"
}

# User Management
umt_config = {
  version = "latest"
}

# WebLogic
instance_count_weblogic_ndelius = "6"

ansible_vars = {
  database_sid = "STGNDA"
}

# Delius API
delius_api_environment = {
  TOKENVERIFICATION_API_BASE_URL                        = "https://sign-in-preprod.hmpps.service.justice.gov.uk/auth"
  SPRING_SECURITY_OAUTH2_RESOURCESERVER_JWT_JWK-SET-URI = "https://sign-in-preprod.hmpps.service.justice.gov.uk/auth/.well-known/jwks.json"
  SPRING_DATASOURCE_USERNAME                            = "DELIUS_POOL"
  SPRING_DATASOURCE_TYPE                                = "oracle.jdbc.pool.OracleDataSource"
}
delius_api_secrets = {
  APPINSIGHTS_INSTRUMENTATIONKEY = "/delius-stage/delius/newtech/offenderapi/appinsights_key"
  SPRING_DATASOURCE_PASSWORD     = "/delius-stage/delius/delius-database/db/delius_pool_password"
}

env_user_access_cidr_blocks = [
  # Parent Organisation IP ranges
  # -RRP (Reducing Reoffending Partnership)
  "62.253.83.37/32",

  # IP ranges for PTTP 'MoJ Official Devices'
  "51.149.251.0/24", # Pre-Production Devices for testing

  # -MTCNovo
  "62.25.109.202/32",

  # -i2n (Northgate) bastion IP traffic
  "62.232.198.68/32",
  
  # -Sodexo Justice Services
  "80.86.46.16/31",
  "80.86.46.18/32",

  # -SEETEC
  "80.86.46.16/30",
  "195.224.76.229/32",
  "51.179.199.82/32", #ROK user outbound for wales,DDC,BGSW - requested via slack support channel https://mojdt.slack.com/archives/GNXRQ5HUN/p1570199298064800
  "195.153.64.66/32",   # Seetec VPN
]

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
    "value" = "30"
  }
]
