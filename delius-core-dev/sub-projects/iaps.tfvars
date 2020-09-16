# This is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

# VPC variables
cloudwatch_log_retention = 14

# ROUTE53 ZONE probation.hmpps.dsd.io
route53_hosted_zone_id = "Z3VDCLGXC4HLOW"

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

instance_type = "t3.medium"

psn_proxy_endpoint = "data-im-proxy-int-psn.dev.probation.service.justice.gov.uk"

dashboards_enabled = "true"


# IAPS Appserver ASG Configuration
iaps_asg_props = {
  owners            = "895523100917"
  ami_name          = "HMPPS IAPS Windows Server master*"
  ami_id            = "ami-061a833926cd59750"
  image_tag_version = "1.0.0"
  # for pinning stage IAPS server deployment
  launch_template_id = "lt-01eef5355623b3cf8"
  launch_template_name = "delius-stage-delius-iaps-pri-tpl-20200113121918038900000001"
}

iaps_asg_suspended_processes = {
  processes = []
}

# IAPS V2 Appserver ASG Configuration
iaps_asgv2_props = {
  ami_id = "ami-057ab0802db21890d"
}

# monitoring overrides - used to specify the instance name we use in the env
iaps_monitoring_rds_db_instance_identifier = ""