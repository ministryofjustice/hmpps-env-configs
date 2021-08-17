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

cr_jitbit_access_cidrs = []

# AutoStop
autostop_enable              = "true"
autoscaling_schedule         = "true"
rds_schedule                 = "true"
autostop_notification_enable = "true"
channel                      = "cr-alert-jitbit-nonprod"
