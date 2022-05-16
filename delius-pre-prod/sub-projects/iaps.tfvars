# This is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

# VPC variables
cloudwatch_log_retention = 14

# ROUTE53 ZONE probation.hmpps.dsd.io
route53_hosted_zone_id = "ZL1RSLMZP6BJA"

# IAPS RDS INSTANCE
multi_az = false

rds_instance_class = "db.t3.xlarge"

rds_backup_retention_period = 2

rds_monitoring_interval = 5

rds_allocated_storage = "500"

rds_family = "oracle-ee-12.1"

rds_major_engine_version = "12.1"

rds_engine = "oracle-ee"

rds_engine_version = "12.1.0.2.v27"

rds_character_set_name = "WE8ISO8859P15"

maintenance_window = "Mon:00:00-Mon:03:00"

backup_window = "03:00-06:00"

license_model = "bring-your-own-license"

storage_encrypted = true

iaps_app_name = "iaps"
instance_type = "m5.large"
dashboards_enabled = "true"

options_local = {
  OEM_AGENT = {
    options = {
      port =  "3872",
      version = "13.4.0.9.v1",
      vpc_security_group_memberships  = ""
    }
    settings = { 
      OMS_HOST = "oem-db-1.engineering-prod.probation.hmpps.dsd.io"
      OMS_PORT = "4903"
      AGENT_REGISTRATION_PASSWORD = ""
    }
  }
}

parameters_local = {
  max_string_size = "EXTENDED"
  control_management_pack_access = "NONE"
}

copy_tags_to_snapshot = true
auto_minor_version_upgrade = true