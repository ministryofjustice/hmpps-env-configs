vpc_supernet = "10.164.48.0/20"

aws_nameserver = "10.164.48.2"

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

cr_jitbit_access_cidrs = []

# Auto Start/Stop
autostop_enable                   = "false"
autoscaling_schedule              = "false"
rds_schedule                      = "false"
autostartstop_notification_enable = "false"
channel                           = "cr-alert-jitbit-nonprod"

# Tags for Auto Start/Stop
rds_stop_resources_tag_phase1 = "PreProdPhase1"
asg_stop_resources_tag_phase2 = "PreProdPhase2"

# Set RDS to Single AZ in Dev to support Auto Start/Stop
disable_multi_az = true

alarms_config = {
    enabled     = false
    quiet_hours = [18, 8]
}
