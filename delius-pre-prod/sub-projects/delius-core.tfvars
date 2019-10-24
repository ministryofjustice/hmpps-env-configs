# delius-pre-prod  delius-core.tfvar
## Delius Core Specific

egress_443 = true
egress_80 = true

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size  = "x_large"
  instance_type  = "r5.4xlarge"
  disk_iops      = 1000
  disks_quantity = 16           # Do not decrease this
  disk_size      = 1000         # Do not decrease this
  # total_storage  = 16000 # This should equal disks_quantity x disk_size
}

ansible_vars_oracle_db = {
  service_user_name             = "oracle"
  database_global_database_name = "PRENDA"
  database_sid                  = "PRENDA"
  ## oradb_sys_password            = "/${environment_name}/delius-core/oracle-database/db/oradb_sys_password"
  ## oradb_system_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_system_password"
  ## oradb_sysman_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_sysman_password"
  ## oradb_dbsnmp_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_dbsnmp_password"
  ## oradb_asmsnmp_password        = "/${environment_name}/delius-core/oracle-database/db/oradb_asmsnmp_password"
  database_characterset         = "AL32UTF8"
  database_bootstrap_restore    = "False" # whether primary db has db restore on bootstrap
  database_backup               = "NotApplicable" # path in S3 to directory backup files
  database_backup_sys_passwd    = "NotApplicable" # ssm parameter store name for db backup password
  database_backup_location      = "NotApplicable" #default for local testing
  oracle_dbca_template_file     = "database"
}

# LDAP
ansible_vars_apacheds = {
  import_users_ldif = "PROD-191003/OID/PROD-191003.ldif"
  import_users_ldif_base_users = "ou=NDProd,cn=Users,dc=moj,dc=com"
}

# WebLogic
instance_type_weblogic = "m5.xlarge"
instance_count_weblogic_ndelius = "30"
ansible_vars = {
  jvm_mem_args = "-Xms12g -Xmx12g"
  database_sid = "PRENDA"
  ndelius_log_level = "ERROR"
  nomis_url = "https://gateway.preprod.nomis-api.hmpps.dsd.io/elite2api"
}

env_user_access_cidr_blocks = []

# DSS Batch Task
dss_job_envvars = [
  {
    "name" = "DSS_TESTMODE"
    "value" =  "true"
  },
  {
    "name" = "DSS_TESTINGAUTOCORRECT"
    "value" = "true"
  },
  {
    "name" = "DSS_ENVIRONMENT"
    "value" = "delius-pre-prod"
  },
  {
    "name" = "DSS_DSSWEBSERVERURL"
    "value" = "https://interface-app-internal.pre-prod.delius.probation.hmpps.dsd.io/NDeliusDSS/UpdateOffender"
  },
  {
    "name" = "DSS_PROJECT"
    "value" = "delius"
  },
  {
    "name" = "JAVA_OPTS"
    "value" = "-Xms1024m -Xmx2048m"
  }
]

azure_community_proxy_source = [
  "51.141.53.111/32" # Public IP of azure fortinet
]