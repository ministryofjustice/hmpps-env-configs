vpc_supernet = "10.163.48.0/20"

aws_nameserver = "10.163.48.2"

env_user_access_cidr_blocks = [
    "81.134.202.29/32",  #Moj VPN
]

# @justice.gov.uk email address (ssm name allows only .-_on the name)
mail_account = [
  "dtv.office",
  "dtv.oakwood",
  "dtv.external",
  "dtv.ttg",
  "dtv.recalls",
  "dtv.precons",
  "dtv.programmes",
  "dtv.secureinfo",
  "dtv.iom",
]

cr_jitbit_overrides = {
  asg_min_size              = 0
  asg_max_size              = 0
  asg_capacity              = 0
}

cr_jitbit_access_cidrs = []

# Auto Start/Stop
autostop_enable                   = "true"
autoscaling_schedule              = "true"
rds_schedule                      = "true"
autostartstop_notification_enable = "true"
channel                           = "cr-alert-jitbit-nonprod"

# Tags for Auto Start/Stop
rds_stop_resources_tag_phase1 = "Phase1"
asg_stop_resources_tag_phase2 = "Phase2"

# Set RDS to Single AZ in Dev to support Auto Start/Stop
disable_multi_az = true

alarms_config = {
    enabled     = true
    quiet_hours = [18, 8]
}

# FSx file system
storage_capacity = 36
