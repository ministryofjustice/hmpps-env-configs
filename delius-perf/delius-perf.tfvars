vpc_supernet = "10.160.48.0/20"

aws_nameserver = "10.160.48.2"

# Moved from spg.tfvars
route53_strategic_hosted_zone_id = "Z222MCWUHZK2CF"

public_ssl_arn = ""

## Delius Core Specific

instance_type_weblogic = "t2.large"

instance_type_db = "t2.large"

egress_443 = true
egress_80 = true

ndelius_version = "4.1.7.3"

#Instance size for smtp server
smtp_instance_type = "m5.xlarge"

#'data'=use amazonMQ
SPG_GATEWAY_MQ_URL_SOURCE    = "data"
spg_messaging_broker_url_src = "data"
spg_jms_host_src             = "data"

#Alfresco specific DB changes - 16MB work mem

alf_db_parameters = [
  {
    name         = "autovacuum_analyze_threshold"
    value        = "20000"
    apply_method = "pending-reboot"
  },
  {
    name         = "autovacuum_analyze_scale_factor"
    value        = "0.0"
    apply_method = "pending-reboot"
  },
  {
    name         = "max_connections"
    value        = "1200"
    apply_method = "pending-reboot"
  },
  {
    name         = "work_mem"
    value        = "16384"
    apply_method = "pending-reboot"
  },
  {
    name         = "shared_preload_libraries"
    value        = "pg_stat_statements"
    apply_method = "pending-reboot"
  },
  {
    name         = "track_activity_query_size"
    value        = "2048"
    apply_method = "pending-reboot"
  },
  {
    name         = "pg_stat_statements.track"
    value        = "ALL"
    apply_method = "pending-reboot"
  },
  {
    name         = "pg_stat_statements.max"
    value        = "10000"
    apply_method = "pending-reboot"
  },
  {
    name         = "log_statement"
    value        = "mod"
    apply_method = "pending-reboot"
  },
  {
    name         = "log_min_duration_statement"
    value        = "5000"
    apply_method = "pending-reboot"
  }
]
