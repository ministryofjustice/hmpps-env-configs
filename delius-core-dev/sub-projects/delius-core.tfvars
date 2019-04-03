# delius-core-dev  delius-core.tfvars
## Delius Core Specific

instance_type_weblogic = "t2.medium"
instance_count_weblogic_ndelius = "6"
instance_count_weblogic_spg = "6"
instance_count_weblogic_interface = "6"

egress_443 = true
egress_80 = true

ndelius_version = "4.1.7.3"

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size  = "small"
  instance_type  = "t3.large"
  disk_iops      = 1000
  disks_quantity = 2  # Do not decrease this
  disk_size      = 100 # Do not decrease this
  # total_storage  = 200 # This should equal disks_quantity x disk_size
}

ansible_vars_oracle_db = {
  service_user_name             = "oracle"
  database_global_database_name = "DNDA"
  database_sid                  = "DNDA"
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

ansible_vars_apacheds = {
  apacheds_version  = "apacheds-2.0.0.AM25-default"
  ldap_protocol     = "ldap"
  # ldap_port       = "${var.ldap_ports["ldap"]}"
  bind_user         = "uid=admin,ou=system"
  # bind_password   = "/${environment_name}/delius-core/apacheds/apacheds/ldap_admin_password"
  partition_id      = "moj"
  import_users_ldif = "IFSR3-181204.ldif"
  sanitize_oid_ldif = "yes"
}

ansible_vars = {
  ndelius_display_name = "National Delius - DEVELOPMENT USE ONLY"
  ndelius_training_mode = "development"
  ndelius_log_level = "DEBUG"
  database_sid = "DNDA"
}

env_user_access_cidr_blocks = []