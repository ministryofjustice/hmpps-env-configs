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
pdfgenerator_conf = {}

# Override default Offender API Config
offenderapi_conf = {
    env_oracledb_servicename = "PRENDA_TAF"
}

# Override default Elasticsearch Config
search_conf = {
    es_instance_count = 3
    es_zone_aware_enabled = true
    es_ebs_size = 50
}

# Override default Web Frontend Config
web_conf = {
  cpu                      = "2048"
  memory                   = "2048"
  ecs_scaling_min_capacity = 2
  ecs_scaling_max_capacity = 10
  image_version = "0.2.9"
}

# Override default Offender Poll Push Config
offenderpollpush_conf = {}

offender_api_allowed_cidrs = [
  "51.141.53.111/32", # Public IP of azure fortinet
  "81.134.202.29/32",  #Moj VPN
  "217.33.148.210/32" #Digital studio
]