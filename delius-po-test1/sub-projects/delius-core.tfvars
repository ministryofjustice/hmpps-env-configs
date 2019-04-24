# delius-core-dev  delius-core.tfvars
## Delius Core Specific

instance_type_weblogic = "t2.medium"
instance_count_weblogic_ndelius = "6"
instance_count_weblogic_spg = "6"
instance_count_weblogic_interface = "6"

egress_443 = true
egress_80 = true

ndelius_version = "4.1.8.2"

# ref ../../common/common.tfvars
db_size_delius_core = {
  database_size  = "small"
  instance_type  = "t3.large"
  disk_iops      = 1000
  disks_quantity = 2  # Do not decrease this
  disk_size      = 200 # Do not decrease this
  # total_storage  = 400 # This should equal disks_quantity x disk_size
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

ansible_vars_apacheds = {
  apacheds_version  = "apacheds-2.0.0.AM25-default"
  ldap_protocol     = "ldap"
  # ldap_port       = "${var.ldap_ports["ldap"]}"
  bind_user         = "uid=admin,ou=system"
  # bind_password   = "/${environment_name}/delius-core/apacheds/apacheds/ldap_admin_password"
  partition_id      = "moj"
  import_users_ldif = "IFSR1/OID/IFSR1-190412.ldif"
  sanitize_oid_ldif = "yes"
}

ansible_vars = {
  ndelius_display_name = "National Delius - TEST USE ONLY"
  database_sid = "POT1NDA"
}

env_user_access_cidr_blocks = [
  "62.25.109.202/32",   # MTCNovo PO
  "80.86.46.16/30",     # Seetec PO
  "46.227.51.224/29",   # Interserve
  "46.227.51.232/29",   # Interserve
  "46.227.51.240/28",   # Interserve
  "51.179.210.36/32",   # Meganexus
  "213.105.186.130/31", # Meganexus London (Firewall IP + Gateway IP)
  "49.248.250.6/32",    # Meganexus India (Gateway IP)
  "80.86.46.16/31",     # Sodexo
  "80.86.46.18/32",     # Sodexo
  "62.253.83.37/32",    # RRP
]
