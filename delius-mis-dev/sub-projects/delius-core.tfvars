# delius-mis-dev  delius-core.tfvars
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
  disk_iops_data       = 3000
  disk_iops_flash      = 3000
  disk_size_data       = 500 # Do not decrease this
  disk_size_flash      = 500 # Do not decrease this
  ## total_storage    = 1000 # This should equal disks_quantity x disk_size
}

ansible_vars_oracle_db = {
  service_user_name             = "oracle"
  database_global_database_name = "DMDNDA"
  database_sid                  = "DMDNDA"
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

env_user_access_cidr_blocks = [
]

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
    "value" = "delius-mis-dev"
  },
  {
    "name"  = "DSS_DSSWEBSERVERURL"
    "value" = "https://interface-app-internal.mis-dev.delius.probation.hmpps.dsd.io/NDeliusDSS/UpdateOffender"
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


# Self Signed Certs
self_signed_ca_algorithm = "RSA"
self_signed_ca_rsa_bits = "2048"
self_signed_ca_validity_period_hours = 8544
self_signed_ca_early_renewal_hours = 672
self_signed_server_algorithm = "RSA"
self_signed_server_rsa_bits = "2048"
self_signed_server_validity_period_hours = 2160
self_signed_server_early_renewal_hours = 336
