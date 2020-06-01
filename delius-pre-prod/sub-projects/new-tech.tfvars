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
  env_pull_base_url = "https://gateway.preprod.nomis-api.service.hmpps.dsd.io/nomisapi/offenders/events/case_notes_for_delius"
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
  env_oracledb_servicename = "PRENDA_TAF"
  cpu                      = "2048"
  memory                   = "4096"
  ecs_scaling_min_capacity = 2
  ecs_scaling_max_capacity = 10
  env_jwt_public_key       = "LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0NCk1JSUJJakFOQmdrcWhraUc5dzBCQVFFRkFBT0NBUThBTUlJQkNnS0NBUUVBalRkdXRLS2VQUkJlQWNrZ1M2cC8NCmxWK2Q1WXFiM3ExOHo2VXdoMU1OWXhwM0hxWXBZVis5MnlGeGUyUTVSN0tWakl5S3kyZkdBanNXeStlU04yM1QNCkZURVVUeXdHdnc0SkJrRGRoaUUvKy80SjR2TWFHMzBYN29GdE9JUWIwaENFQVlWM3o4emc1WVd2OGZlRkVnWGcNCkp3SjVCc2krU0NvajNIZDlERXk1ZGZaTTljL3BoOXN5YWpLU1ZiQW8rRCtXanhQWHU4UndRSk9BU0g0NUVwclQNCjNJMy9NdllyY1ZvdkN4UVZyUWNwYzNiY0U0bHpYdFlSVy9wSWpHUVpBKy9WYjNXZXZuR1FiYndTNHp6eXkzazgNCkRCZ0pzQVJlVDI1eHp0ckptRGlZZXBHYkVKVHV0alRqR2NVOG1qUjRWZ3gwdHdqMk9DMzBES3dXbGlrMzhXTWwNCk5RSURBUUFCDQotLS0tLUVORCBQVUJMSUMgS0VZLS0tLS0="
  env_features_noms_update_custody = "true"
  env_features_noms_update_booking_number = "true"
  env_features_noms_update_keydates = "true"
  env_features_noms_update_noms_number = "true"
}

# Override default Elasticsearch Config
search_conf = {
  es_instance_count = 3
  es_zone_aware_enabled = true
  es_ebs_size = 50
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
  env_sns_arn_topic = "arn:aws:sns:eu-west-2:754256621582:cloud-platform-Digital-Prison-Services-dbe10e8d9c1f4d100f0c723d5d9b754e"
}

# Override default Offender Search Service Config
offendersearch_conf = {
  env_oauth2_jwt_jwk_set_uri = "https://gateway.preprod.nomis-api.service.hmpps.dsd.io/auth/.well-known/jwks.json"
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
  "51.140.228.7/32",   # azure hmpps-auth legacy server
  "51.11.124.154/32",  # azure hmpps-auth nomisapi-preprod
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
