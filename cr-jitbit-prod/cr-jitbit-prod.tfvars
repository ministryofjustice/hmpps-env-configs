vpc_supernet = "10.163.64.0/20"

aws_nameserver = "10.163.64.2"

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

channel = "cr-alert-jitbit-prod"

# FSx file system
storage_capacity = 320
# throughput_capacity = 16 # To increase storage_capacity, throughput_capacity needs to be at least 16
