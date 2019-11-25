# This is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

# VPC variables
cloudwatch_log_retention = 14

# Origial ported tfavrs from beanstalk env_config
delius_api_min_asg_size = 1
delius_api_max_asg_size = 4
delius_api_instance_type = "t2.micro"
delius_api_lower_cpu_trigger = 5
delius_api_upper_cpu_trigger = 10

# Override default casenotes Config
casenotes_conf = {
  cpu    = "1024"
  memory = "2048"
  env_pull_base_url = "https://gateway.t3.nomis-api.hmpps.dsd.io/nomisapi/offenders/events/case_notes_for_delius"
}
# Override default PDF Generator Config
pdfgenerator_conf = {}

# Override default Offender API Config
offenderapi_conf = {
  env_jwt_public_key = "LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUF6Y3g3WWJ3MkJBV3Y3U3NFSVVHUAppeUpTSURndHFCeDE5VHdtN3VJM1RYNXpSY3JabFV4Y0VtUEpHVWd5K0QySkloVmxxbWVxd0dWMkNOT3FaQmdHCmo4ZUpHQTU5aUlUemU4ZG1SSk5JYzdsNmxESmc5RE5KVk9pTHFVbFpGRENJcXplSTYzb3E2dWhjY2c1RFBpVE4KcU9HWmM4dXBOK3c1ZFpyTnYrMkdMZ3hLMnBldE1VL0JoWWVXZjNLdllJTzE2djF1dm5GT0dPMTNIb1d1NUJ0ZApTdC9UZ2NsRmhWTEVkR3c3WGJpWUhuTlpJZGh3YU5RaVlnbVhtalpWZE15Q1BETW8xMExrVjFwM1V5MTVwTU14ClVwc2xKYU8wNlZIYXJtY3ZWYzNleHg5NlpHTjE2T2U4ZWZoeG5Rdmhzd0ZrbXlYT25sSForNDI1MnJHcHlKTG8KbHdJREFRQUIKLS0tLS1FTkQgUFVCTElDIEtFWS0tLS0tCg=="
}

# Override default Elasticsearch Config
search_conf = {}

# Override default Web Frontend Config
web_conf = {
  image_version = "0.2.2"
}

# Override default Offender Poll Push Config
offenderpollpush_conf = {
  env_debug_log = "true"
}

offender_api_allowed_cidrs = [
  "81.134.202.29/32", # Moj VPN
  "217.33.148.210/32" # Digital studio
]

offender_api_allowed_secure_cidrs = [
  "81.134.202.29/32",  # Moj VPN
  "217.33.148.210/32", # Digital studio
  "35.178.209.113/32", # cloudplatform-live1-1
  "3.8.51.207/32",     # cloudplatform-live1-2
  "35.177.252.54/32",  # cloudplatform-live1-3
  "35.177.252.195/32"  # healthkick
]

dashboards_enabled = "true"
