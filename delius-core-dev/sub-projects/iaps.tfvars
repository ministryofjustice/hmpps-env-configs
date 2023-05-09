# This is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

# VPC variables
cloudwatch_log_retention = 14

# ROUTE53 ZONE probation.hmpps.dsd.io
route53_hosted_zone_id = "Z3VDCLGXC4HLOW"

#========================
# IAPS RDS INSTANCE
#========================
multi_az = false

rds_instance_class = "db.t3.large"

rds_backup_retention_period = 2

rds_monitoring_interval = 5

rds_allocated_storage = "500"

rds_family = "oracle-ee-19"

rds_major_engine_version = "19"

rds_engine = "oracle-ee"

rds_engine_version = "19.0.0.0.ru-2022-01.rur-2022-01.r1"

rds_character_set_name = "WE8ISO8859P15"

maintenance_window = "Mon:00:00-Mon:03:00"

backup_window = "03:00-06:00"

license_model = "bring-your-own-license"

storage_encrypted = true

iaps_app_name = "iaps"

allow_major_version_upgrade = true

#========================
# IAPS EC2 ASG
#========================
# Flag to decommission IAPS v1 for each environment
deploy_iaps_v1 = false

instance_type = "t3.medium"

psn_proxy_endpoint = "data-im-proxy-int-psn.dev.probation.service.justice.gov.uk"

dashboards_enabled = "false"

# IAPS Appserver ASG Configuration
iaps_asg_props = {
  create_iaps_v1_asg = false
  owners             = "895523100917"
  ami_name           = "HMPPS IAPS Windows Server master*"
  ami_id             = "ami-061a833926cd59750"
  image_tag_version  = "1.0.0"
  # for pinning stage IAPS server deployment
  launch_template_id   = ""
  launch_template_name = ""
}

iaps_asg_suspended_processes = []

# IAPS V2 Appserver ASG Configuration
iaps_asgv2_props = {
  ami_id            = "ami-035d1d647e1798734"
  image_tag_version = "0.42.0"
}


# monitoring overrides - used to specify the instance name we use in the env
iaps_monitoring_rds_db_instance_identifier = "tf-eu-west-2-hmpps-delius-core-dev-iaps"

copy_tags_to_snapshot = true
auto_minor_version_upgrade = false

# for use when we need to restore db from RDS snapshot
snapshot_identifier = ""

# IAPS Proxy
iaps_proxy_access_cidr_blocks = [
  # -i2n (Northgate) AWS Account
  "10.110.96.0/24",
  "10.110.97.0/24",
  "10.110.98.0/24",
]
