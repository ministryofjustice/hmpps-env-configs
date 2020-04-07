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

}

# Override default PDF Generator Config
pdfgenerator_conf = {}

# Override default Offender API Config
offenderapi_conf = {
  env_oracledb_servicename = "TSTNDA_TAF"
  env_jwt_public_key = "LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUF6Y3g3WWJ3MkJBV3Y3U3NFSVVHUAppeUpTSURndHFCeDE5VHdtN3VJM1RYNXpSY3JabFV4Y0VtUEpHVWd5K0QySkloVmxxbWVxd0dWMkNOT3FaQmdHCmo4ZUpHQTU5aUlUemU4ZG1SSk5JYzdsNmxESmc5RE5KVk9pTHFVbFpGRENJcXplSTYzb3E2dWhjY2c1RFBpVE4KcU9HWmM4dXBOK3c1ZFpyTnYrMkdMZ3hLMnBldE1VL0JoWWVXZjNLdllJTzE2djF1dm5GT0dPMTNIb1d1NUJ0ZApTdC9UZ2NsRmhWTEVkR3c3WGJpWUhuTlpJZGh3YU5RaVlnbVhtalpWZE15Q1BETW8xMExrVjFwM1V5MTVwTU14ClVwc2xKYU8wNlZIYXJtY3ZWYzNleHg5NlpHTjE2T2U4ZWZoeG5Rdmhzd0ZrbXlYT25sSForNDI1MnJHcHlKTG8KbHdJREFRQUIKLS0tLS1FTkQgUFVCTElDIEtFWS0tLS0tCg=="
  memory        = "2048"
  env_features_noms_update_custody = "true"
  env_features_noms_update_booking_number = "true"
  env_features_noms_update_keydates = "true"
  env_features_noms_update_noms_number = "true"
}

# Override default Elasticsearch Config
search_conf = {}

# Override default Web Frontend Config
web_conf = {}

# Override default Offender Poll Push Config
offenderpollpush_conf = {
  env_sns_arn_topic = "arn:aws:sns:eu-west-2:754256621582:cloud-platform-Digital-Prison-Services-453cac1179377186788c5fcd12525870"
}


# Override default Offender Search Service Config
offendersearch_conf = {
  env_oauth2_jwt_jwk_set_uri = "https://gateway.t3.nomis-api.hmpps.dsd.io/auth/.well-known/jwks.json"
}

offender_api_allowed_cidrs = [
  "81.134.202.29/32", # Moj VPN
  "217.33.148.210/32", # Digital studio
  "51.141.45.69/32", # Public IP of azure fortinet (test)
]

offender_api_allowed_secure_cidrs = [
  "81.134.202.29/32",  # Moj VPN
  "217.33.148.210/32", # Digital studio
  "35.178.209.113/32", # cloudplatform-live1-1
  "3.8.51.207/32",     # cloudplatform-live1-2
  "35.177.252.54/32",  # cloudplatform-live1-3
  "35.177.252.195/32", # healthkick
  "51.140.222.8/32",   # azure oauth server
  "194.168.183.130/32", # CATS+ access
  "51.141.45.69/32", # Public IP of azure fortinet (test)
  "34.252.4.39/32", # Analytics platform
  "34.251.212.33/32", # Analytics platform
  "34.250.17.221/32", # Analytics platform
  "34.247.31.101/32", # Analytics platform
  "3.248.11.160/32", # Analytics platform
  "54.194.123.60/32", # Analytics platform
  "34.249.60.91/32", # Analytics platform
  "34.251.199.153/32", # Analytics platform
  "34.249.194.106/32", # Analytics platform
]

offender_search_allowed_secure_cidrs = [
  "81.134.202.29/32",  # Moj VPN
  "217.33.148.210/32", # Digital studio
  "35.178.209.113/32", # cloudplatform-live1-1
  "3.8.51.207/32",     # cloudplatform-live1-2
  "35.177.252.54/32",  # cloudplatform-live1-3
  "35.177.252.195/32", # healthkick
]

dashboards_enabled = "true"
