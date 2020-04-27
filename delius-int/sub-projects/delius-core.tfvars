# delius-po-test1  delius-core.tfvars
## Delius Core Specific

egress_443 = true
egress_80 = true

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size  = "small"
  instance_type  = "t3.large"
  disk_iops      = 1000
  disks_quantity = 2  # Do not decrease this
  disk_size      = 500 # Do not decrease this
  # total_storage  = 1000 # This should equal disks_quantity x disk_size
}

ansible_vars_oracle_db = {
  service_user_name             = "oracle"
  database_global_database_name = "POT1NDA"
  database_sid                  = "POT1NDA"
  ## oradb_sys_password            = "/${environment_name}/delius-core/oracle-database/db/oradb_sys_password"
  ## oradb_system_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_system_password"
  ## oradb_sysman_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_sysman_password"
  ## oradb_dbsnmp_password         = "/${environment_name}/delius-core/oracle-database/db/oradb_dbsnmp_password"
  ## oradb_asmsnmp_password        = "/${environment_name}/delius-core/oracle-database/db/oradb_asmsnmp_password"
  database_characterset         = "AL32UTF8"
  database_bootstrap_restore    = "True" # whether primary db has db restore on bootstrap
  database_backup               = "dbbackup/dev/delius" # path in S3 to directory backup files
  database_backup_sys_passwd    = "/dbbackup/delius-core-dev/delius-core/oracle-database/db/oradb_sys_password" # ssm parameter store name for db backup password
  database_backup_location      = "/u01/backup" #default for local testing
  oracle_dbca_template_file     = "database"
}

# WebLogic
instance_count_weblogic_interface = "0"
ansible_vars = {
  ndelius_display_name = "National Delius - TEST USE ONLY"
  database_sid = "POT1NDA"
}

env_user_access_cidr_blocks = [
  # Parent Organisation IP ranges

  # -MTCNovo
  "62.25.109.202/32",

  # -SEETEC
  "80.86.46.16/30",
  "195.224.76.229/32",
  "195.153.64.66/32",   # Seetec VPN

  # -Interserve
//  "46.227.51.224/29", removed 25/11/2019 by request of perry sutherland https://mojdt.slack.com/archives/GNPCZF3J5/p1574431551042500
//  "46.227.51.232/29", removed 25/11/2019 by request of perry sutherland https://mojdt.slack.com/archives/GNPCZF3J5/p1574431551042500
//  "46.227.51.240/28", removed 25/11/2019 by request of perry sutherland https://mojdt.slack.com/archives/GNPCZF3J5/p1574431551042500
//  "51.179.196.131/32", removed 25/11/2019 by request of perry sutherland https://mojdt.slack.com/archives/GNPCZF3J5/p1574431551042500

  # -Meganexus
  #"51.179.210.36/32",  #this mapped to PFs spg server in IFSR1 should no longer be needed - see parent orgs if required
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
  "5.153.255.210/32",   # EOS Public IP
]

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
    "value" = "delius-po-test1"
  },
  {
    "name" = "DSS_DSSWEBSERVERURL"
    "value" = "https://interface-app-internal.po-test1.delius.probation.hmpps.dsd.io/NDeliusDSS/UpdateOffender"
  },
  {
    "name" = "DSS_PROJECT"
    "value" = "delius"
  }
]
