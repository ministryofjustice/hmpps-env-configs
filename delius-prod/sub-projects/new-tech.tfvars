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
  env_pull_base_url  ="https://gateway.nomis-api.service.justice.gov.uk/nomisapi/offenders/events/case_notes_for_delius"
}

# Override default PDF Generator Config
pdfgenerator_conf = {
  cpu                      = "1024"
  memory                   = "2048"
  ecs_scaling_min_capacity = 2
  ecs_scaling_max_capacity = 10
}

# Override default Offender API Config
offenderapi_conf = {
  env_oracledb_servicename = "PRDNDA_TAF"
  cpu                      = "2048"
  memory                   = "4096"
  ecs_scaling_min_capacity = 2
  ecs_scaling_max_capacity = 10
  env_jwt_public_key       = "LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0NCk1JSUJJakFOQmdrcWhraUc5dzBCQVFFRkFBT0NBUThBTUlJQkNnS0NBUUVBcEpHbWFqeklvTzlXUmNqMDNlU20NCkV5YlNic0loR2Q2RFZUNHFRYVJFNnA3dEg3WmlKSW9Fa3NzNGQ4WmEwaG5hYnBrQmpZNjBLc2cxbm15emhlWVINCithWXVtc0gxbm1JcmJ4ZCtqV043T3A2V1pteWRBU3JMek1XWVdBYlNHOHBXMXkxY1RwdkRaMTlBSGJTYTRRL2UNCkp0ZXAxbHArMjJ1RzFuZE1UcHJUZDY0S05HMmZ0cHJld2hRMXhOcXZrVFo2aEJ1UUVSSjMxYVFwZEU4TUExcUsNCkNacjdUMnFOTUFNY2ROWmJrQWpGNUs5cTRqVnRCRjdZcU95cnRPUmZOV2phQmhYcDlOU3RhYkJNcFRFN1A2by8NClhJaU9rcmltNjlzaG1OdDhVRlU3WUlJN0ZvejgzM29HZnk2dmtDRjRxcGpIZ0RNc21STjc1UXRrRmRtaU8xaDgNCnB3SURBUUFCDQotLS0tLUVORCBQVUJMSUMgS0VZLS0tLS0="
  env_features_noms_update_custody = "true"
  env_features_noms_update_booking_number = "true"
  env_features_noms_update_keydates = "true"
}

# Override default Elasticsearch Config
search_conf = {
  es_instance_count     = 3
  es_zone_aware_enabled = true
  es_ebs_size           = 50
  es_instance_type      = "m5.xlarge.elasticsearch"
}

# Override default Web Frontend Config
web_conf = {
  cpu                      = "2048"
  memory                   = "2048"
  ecs_scaling_min_capacity = 2
  ecs_scaling_max_capacity = 10
}

# Override default Offender Poll Push Config
offenderpollpush_conf = {
  cpu    = "3072"
  memory = "4096"
  env_sns_arn_topic = "arn:aws:sns:eu-west-2:754256621582:cloud-platform-Digital-Prison-Services-c2d997878cd24eef94e60f1404977153"
}

# Override default Offender Search Service Config
offendersearch_conf = {
  env_oauth2_jwt_jwk_set_uri = "https://gateway.prod.nomis-api.service.hmpps.dsd.io/auth/.well-known/jwks.json"
  ecs_scaling_min_capacity = 2
  ecs_scaling_max_capacity = 10
}

offender_api_allowed_cidrs = [
  "51.141.53.111/32" # Public IP of azure fortinet
]

offender_api_allowed_secure_cidrs = [
  "35.178.209.113/32", # cloudplatform-live1-1
  "3.8.51.207/32",     # cloudplatform-live1-2
  "35.177.252.54/32",  # cloudplatform-live1-3
  "35.177.252.195/32", # healthkick
  "51.141.82.211/32",  # azure oauth server
  "194.168.183.130/32", # CATS+ access
  "51.141.53.111/32", # Public IP of azure fortinet
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
  "35.178.209.113/32", # cloudplatform-live1-1
  "3.8.51.207/32",     # cloudplatform-live1-2
  "35.177.252.54/32",  # cloudplatform-live1-3
  "35.177.252.195/32", # healthkick
]

dashboards_enabled = "true"
