# This is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

# VPC variables
cloudwatch_log_retention = 14

# ROUTE53 ZONE probation.service.justice.gov.uk
route53_hosted_zone_id = "Z2SOZ79CNGAPIF"

# IAPS RDS INSTANCE
multi_az = true

rds_instance_class = "db.t3.large"

rds_backup_retention_period = 15

rds_monitoring_interval = 5

rds_allocated_storage = "500"

rds_family = "oracle-ee-19"

rds_major_engine_version = "19"

rds_engine = "oracle-ee"

rds_engine_version = "19.0.0.0.ru-2022-07.rur-2022-07.r1"

rds_character_set_name = "WE8ISO8859P15"

maintenance_window = "Mon:00:00-Mon:03:00"

backup_window = "03:00-06:00"

license_model = "bring-your-own-license"

storage_encrypted = true

iaps_app_name = "iaps"

auto_minor_version_upgrade = false

allow_major_version_upgrade = false

#========================
# IAPS EC2 ASG
#========================
# Flag to decommission IAPS v1 for each environment
deploy_iaps_v1 = false

instance_type = "m5.large"

psn_proxy_endpoint = "data-im-proxy.psn.probation.service.justice.gov.uk"

dashboards_enabled = "true"

# ASG Configuration
iaps_asg_props = {
  create_iaps_v1_asg = true
  owners             = "895523100917"
  ami_name           = "HMPPS IAPS Windows Server master*"
  ami_id             = "ami-00d40f926ee31fcd6"
  image_tag_version  = "1.0.0"
  # for pinning stage IAPS server deployment
  launch_template_id   = "lt-037d4a6184720ead9"
  launch_template_name = "delius-prod-delius-iaps-pri-tpl-20190920090854215500000001"
}

iaps_asg_suspended_processes = ["Launch", "Terminate", "HealthCheck", "ReplaceUnhealthy", "AZRebalance", "AlarmNotification", "ScheduledActions", "AddToLoadBalancer"]

#====================================
# IAPS V2 Appserver ASG Configuration
#====================================
iaps_asgv2_props = {
  ami_id            = "ami-035d1d647e1798734"
  image_tag_version = "0.42.0"
}

# monitoring overrides - used to specify the instance name we use in the env
iaps_monitoring_rds_db_instance_identifier = "tf-eu-west-2-hmpps-delius-prod-iaps"
copy_tags_to_snapshot = true

# for use when we need to restore db from RDS snapshot
snapshot_identifier = "iaps-pre-rds-fix"

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

# IAPS Proxy
iaps_proxy_access_cidr_blocks = [
  # -i2n (Northgate) AWS Account
  "10.110.96.0/24",
  "10.110.97.0/24",
  "10.110.98.0/24",
]

iaps_proxy_monitoring_enabled = "1"  #Enable IAPS Proxy Monitoring in the environment

