# delius-core-dev  delius-core.tfvars
## Delius Core Specific

instance_type_weblogic = "t2.large"
instance_count_weblogic_ndelius = "1"
instance_count_weblogic_spg = "1"
instance_count_weblogic_interface = "1"

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
  setup_datasources = "true"
  #s3_dependencies_bucket = derived from dependencies_bucket_arn
  database_host = "delius-db"
  alfresco_host = "alfresco"
  alfresco_office_host = "alfresco"
  ldap_host = "ldap-elb"
  spg_host = "gw-int-direct"

  ndelius_display_name = "National Delius - DEVELOPMENT USE ONLY"
  ndelius_training_mode = "development"
  ndelius_log_level = "DEBUG"
  ndelius_analytics_tag = "UA-122274748-2"
  newtech_search_url = "/newTech"
  newtech_pdfgenerator_url = "/newTech"
  usermanagement_url = "/umt/"
  nomis_url = "https://gateway.t3.nomis-api.hmpps.dsd.io/elite2api"


  domain_name = "NDelius"  # This is defined by the AMI
  server_name = "AdminServer"
  server_params = "-Xms2048m -Xmx2048m -XX:MaxPermSize=256m"
  weblogic_admin_username = "weblogic"
  #weblogic_admin_password = "/${environment_name}/delius-core/weblogic/${app_name}-domain/weblogic_admin_password"
  server_listen_address = "0.0.0.0"
  #server_listen_port = "${var.weblogic_domain_ports["ndelius_admin"]}"

  jvm_mem_args = "-Xms2g -Xmx2g"

  database_port = "1521"
  database_sid = "DNDA"
  #database_password = "/${environment_name}/delius-core/oracle-database/db/delius_app_schema_password"

  activemq_data_folder = "/activemq-data"

  alfresco_port = "80"
  alfresco_office_port = "443"

  #ldap_port       = "${var.ldap_ports["ldap"]}"
  #ldap_principal = "${var.ansible_vars_apacheds["bind_user"]}"
  #ldap_admin_password = "/${environment_name}/delius-core/apacheds/apacheds/ldap_admin_password"
  #partition_id = "${var.ansible_vars_apacheds["bind_user"]}"
}

env_user_access_cidr_blocks = []