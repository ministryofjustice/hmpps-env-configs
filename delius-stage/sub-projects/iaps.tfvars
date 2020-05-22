# This is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

# VPC variables
cloudwatch_log_retention = 14

# ROUTE53 ZONE probation.hmpps.dsd.io
route53_hosted_zone_id = "Z1XOU6Z3TY3K2F"

# IAPS RDS INSTANCE
rds_instance_class = "db.t3.large"

rds_backup_retention_period = 2

rds_monitoring_interval = 5

rds_allocated_storage = "500"

rds_family = "oracle-ee-12.1"

rds_major_engine_version = "12.1"

rds_engine = "oracle-ee"

rds_engine_version = "12.1.0.2.v19"

rds_character_set_name = "WE8ISO8859P15"

maintenance_window = "Mon:00:00-Mon:03:00"

backup_window = "03:00-06:00"

license_model = "bring-your-own-license"

storage_encrypted = true

iaps_app_name = "iaps"

instance_type = "m5.large"

psn_proxy_endpoint = "data-im-proxy-int-psn.stage.probation.service.justice.gov.uk"

dashboards_enabled = "true"


# IAPS Appserver ASG Configuration
iaps_asg_props = {
  owners            = ["895523100917"]
  ami_name          = "HMPPS IAPS Windows Server master*"
  ami_id            = "ami-075d55ae08f16e8e6"
  image_tag_version = "1.0.0"
}
