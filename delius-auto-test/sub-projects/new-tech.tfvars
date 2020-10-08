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
  # env_pull_base_url  ="https://gateway.nomis-api-auto-test.service.justice.gov.uk/nomisapi/offenders/events/case_notes_for_delius"

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
  env_oracledb_servicename   = "DATNDA_TAF"
  env_oauth2_jwt_jwk_set_uri = "https://sign-in-dev.hmpps.service.justice.gov.uk/auth/.well-known/jwks.json"
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