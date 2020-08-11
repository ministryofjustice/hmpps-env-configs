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
  env_oracledb_servicename = "PERNDA_TAF"
  cpu                      = "2048"
  memory                   = "4096"
  ecs_scaling_min_capacity = 2
  ecs_scaling_max_capacity = 10
  env_oauth2_jwt_jwk_set_uri = "https://sign-in-preprod.hmpps.service.justice.gov.uk/auth/.well-known/jwks.json"
}

# Override default Elasticsearch Config
search_conf = {
    es_instance_count = 3
    es_zone_aware_enabled = true
    es_ebs_size = 50
}

# Override default Web Frontend Config
web_conf = {
  image_version = "0.2.2"
}

# Override default Offender Poll Push Config
offenderpollpush_conf = {
  cpu    = "3072"
  memory = "4096"
  env_sns_arn_topic = "arn:aws:sns:eu-west-2:754256621582:cloud-platform-Digital-Prison-Services-31651e5217b97de528d32e6164d0d53a"
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
  "35.177.252.195/32",  # healthkick
  "194.168.183.130/32" # CATS+ access
]
