# delius-prod  delius-core.tfvar
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
  database_global_database_name = "PRDNDA"
  database_sid                  = "PRDNDA"
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
  import_users_ldif = "LATEST"
  import_users_ldif_base_users = "ou=Users,dc=moj,dc=com"
}

# WebLogic
instance_type_weblogic = "m5.xlarge"
instance_count_weblogic_ndelius = "30"
ansible_vars = {
  database_sid = "PRDNDA"
  ndelius_log_level = "ERROR"
  ndelius_analytics_tag = "UA-122274748-1"
  nomis_url = "https://gateway.nomis-api.service.justice.gov.uk/elite2api"
}

env_user_access_cidr_blocks = [
  # Parent Organisation IP ranges
  # -MTCNovo
  "62.25.109.202/32",

  # -SEETEC
  "80.86.46.16/30",
  "195.224.76.229/32",
  "51.179.199.82/32", #ROK user outbound for wales,DDC,BGSW - requested via slack support channel https://mojdt.slack.com/archives/GNXRQ5HUN/p1570199298064800

  # -Interserve
  "46.227.51.224/29",
  "46.227.51.232/29",
  "46.227.51.240/28",
  "51.179.196.131/32",

  # -Meganexus
  "51.179.210.36/32",
  "83.151.209.178/32",  # PF SPG Server Public IP/NAT
  "83.151.209.179/32", # PF SPG Server Public IP/NAT 2
  "213.105.186.130/31", # Meganexus London (Firewall IP + Gateway IP)
  "49.248.250.6/32",    # Meganexus India (Gateway IP)

  # -Sodexo Justice Services
  "80.86.46.16/31",
  "80.86.46.18/32",

  # -RRP (Reducing Reoffending Partnership)
  "62.253.83.37/32",

  # - ARCC
  "51.179.193.241/32",

  # - EOS
  "5.153.255.210/32",   # EOS Public IP

  # - CFO
  "194.168.183.130/32",
]

# DSS Batch Task
dss_job_envvars = [
  {
    "name" = "DSS_TESTMODE"
    "value" =  "false"
  },
  {
    "name" = "DSS_TESTINGAUTOCORRECT"
    "value" = "true"
  },
  {
    "name" = "DSS_ENVIRONMENT"
    "value" = "delius-prod"
  },
  {
    "name" = "DSS_DSSWEBSERVERURL"
    "value" = "https://interface-app-internal.probation.service.justice.gov.uk/NDeliusDSS/UpdateOffender"
  },
  {
    "name" = "DSS_HMPSSERVERURL"
    "value" = "https://www.offloc.service.justice.gov.uk/"
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

# Make the National Delius front-end pingdom report available to the public:
pingdom_publicreports = ["ndelius_frontend"]

azure_community_proxy_source = [
  "51.141.53.111/32" # Public IP of azure fortinet
]
