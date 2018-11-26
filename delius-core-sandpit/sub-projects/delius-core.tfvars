# delius-core-sandpit  delius-core.tfvar

ansible_vars_apacheds = {
  apacheds_version  = "apacheds-2.0.0.AM25-default"
  ldap_protocol     = "ldap"
  # ldap_port       = "${var.ldap_ports["ldap"]}"
  bind_user         = "uid=admin,ou=system"
  # bind_password   = "/TG_ENVIRONMENT_NAME/TG_PROJECT_NAME/apacheds/apacheds/ldap_admin_password"
  partition_id      = "moj"
  create_test_users = "yes"
}

ansible_vars = {
  setup_datasources = "false"
  #s3_dependencies_bucket = derived from dependencies_bucket_arn
  database_host = "delius-db"
  alfresco_host = "alfresco"
  alfresco_office_host = "alfresco"
  spg_host = "gw-int-direct"
  oid_host = "oid-wls-instance"
  ndelius_display_name = "National Delius - DEVELOPMENT USE ONLY"
  ndelius_training_mode = "development"
  ndelius_log_level = "DEBUG"
  ndelius_analytics_tag = "UA-122274748-2"
  newtech_search_url = "/newTech"
  newtech_pdfgenerator_url = "/newTech"
  usermanagement_url = "/umt/"
  nomis_url = "https://gateway.t3.nomis-api.hmpps.dsd.io/elite2api"
}
