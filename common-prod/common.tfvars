region = "eu-west-2"

availability_zone = {
  az1 = "eu-west-2a"
  az2 = "eu-west-2b"
  az3 = "eu-west-2c"
}

# LB Account is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

route53_domain_private = "probation.hmpps.dsd.io"

# ENVIRONMENT REMOTE STATES
eng_remote_state_bucket_name = "tf-eu-west-2-hmpps-eng-dev-remote-state"

bastion_remote_state_bucket_name = "tf-eu-west-2-hmpps-bastion-prod-remote-state"

eng_role_arn = "arn:aws:iam::895523100917:role/terraform"

bastion_role_arn = "arn:aws:iam::077643444046:role/terraform"

alfresco_app_name = "alfresco"

spg_app_name = "spgw"

# Alfresco
alf_backups_config = {
  transition_days                            = 7
  expiration_days                            = 180
  noncurrent_version_transition_days         = 30
  noncurrent_version_transition_glacier_days = 60
  noncurrent_version_expiration_days         = 2560
}

# elk
elk_backups_config = {
  transition_days = 7
  expiration_days = 2560
}

# elasticsearch
# jvm
es_jvm_heap_size = "8g"

# memory
es_ecs_memory = "9000"

es_ecs_mem_limit = "8500"

# instance type
es_instance_type = "i3.xlarge"

## Delius Core
weblogic_domain_ports = {
  weblogic_port      = "7001"
  weblogic_tls_port  = "7002"
  activemq_port      = "61617"
  spg_jms_broker     = "61616"
  spg_jms_broker_ssl = "61617"
}

ldap_ports = {
  ldap     = "10389"
  ldap_tls = "10636"
}

#SPG Partner Gateway
#Note we will be moving the ActiveMQ Broker away from servicemix and its own dedicated servers/service (AmazonMQ)

spg_partnergateway_domain_ports = {
  mutual_tls     = "9001"  # from POs unless TLS is terminated by NGINX
  internal_soap  = "8989"  # used between spg.iso and spg.mpx when they were separate modules. deprecated.
  http           = "8181"  # used from tls terminating loadbalancer, and devops ssh tunnelling
  jms_broker     = "61616" # used by SPG, ND and Alfresco consumers to push/pull JMS messages to spg.servicemix.ActiveMQ Broker
  jms_broker_ssl = "61617" # SSL version of the above

  amq_web_console     = "8161" # unsecured default port for activemq web console - not implemented
  amq_web_console_ssl = "8443" # secured default port for activemq web console - not implemented
  https               = "443"  # not yet implemented, would be used for devops non tunnelled console admin (ie hawtio)
}

#TODO: allow JMX ports for weblogic domains from bastion or admin

# public / user access
user_access_cidr_blocks = [
  "81.134.202.29/32",  #Moj VPN
  "217.33.148.210/32", #Digital studio
  "35.176.14.16/32",   #Engineering Jenkins non prod AZ 1
  "35.177.83.160/32",  #Engineering Jenkins non prod AZ 2
  "18.130.108.149/32", #Engineering Jenkins non prod AZ 3
  "18.130.105.155/32", #Engineering Jenkins prod AZ 1
  "18.130.54.20/32",   #Engineering Jenkins prod AZ 2
  "18.130.87.166/32",  #Engineering Jenkins prod AZ 3
  "194.75.210.208/28", #BCL
  "213.48.246.99/32",  #BCL
]

# jenkins access
jenkins_access_cidr_blocks = [
  "35.176.14.16/32",   #Engineering Jenkins non prod AZ 1
  "35.177.83.160/32",  #Engineering Jenkins non prod AZ 2
  "18.130.108.149/32", #Engineering Jenkins non prod AZ 3
  "18.130.105.155/32", #Engineering Jenkins prod AZ 1
  "18.130.54.20/32",   #Engineering Jenkins prod AZ 2
  "18.130.87.166/32",  #Engineering Jenkins prod AZ 3
]

#SPG has activeMQ running incomming
#database talks to activemq on spg weblogic domain
#spg talks to spg-weblogic-domain over activemq
#  # engineering
# dependencies_bucket_arn = "arn:aws:s3:::tf-eu-west-2-hmpps-eng-dev-artefacts-s3bucket"

# dev
dependencies_bucket_arn = "arn:aws:s3:::tf-eu-west-2-hmpps-eng-dev-delius-core-dependencies-s3bucket"

migration_bucket_arn = "arn:aws:s3:::tf-eu-west-2-hmpps-eng-prod-artefacts-s3bucket"

## These are the reference maps for the database sizes
## copy block into the appropriate env config file and rename

database_size_small = {
  database_size  = "small"
  instance_type  = "t3.large"
  disk_iops      = 1000
  disks_quantity = 2   # Do not decrease this
  disk_size      = 100 # Do not decrease this

  # total_storage  = 200 # This should equal disks_quantity x disk_size
}

database_size_medium = {
  database_size  = "medium"
  instance_type  = "r5.xlarge"
  disk_iops      = 1000
  disks_quantity = 2   # Do not decrease this
  disk_size      = 500 # Do not decrease this

  # total_storage  = 1000 # This should equal disks_quantity x disk_size
}

database_size_large = {
  database_size  = "large"
  instance_type  = "r5.2xlarge"
  disk_iops      = 1000
  disks_quantity = 8    # Do not decrease this
  disk_size      = 1000 # Do not decrease this

  # total_storage  = 8000 # This should equal disks_quantity x disk_size
}

database_size_x_large = {
  database_size  = "x_large"
  instance_type  = "r5.4xlarge"
  disk_iops      = 1000
  disks_quantity = 16   # Do not decrease this
  disk_size      = 1000 # Do not decrease this

  # total_storage  = 16000 # This should equal disks_quantity x disk_size
}

# How long we keep our indices for in elastic search in days
retention_period = 365

# How long we keep our backups on the efs share in days, we don't have a policy on s3 yet
backup_retention_days = 30

# How long do we keep our instance volume snapshots for
snapshot_retention_days = 30

# Default values for ApacheDS LDAP
instance_type_ldap = "m5.xlarge"

ldap_slave_asg_min = "1"

ldap_slave_asg_desired = "2"

ldap_slave_asg_max = "10"

default_ansible_vars_apacheds = {
  # ApacheDS
  jvm_mem_args               = "12228" # (in MB)
  apacheds_version           = "apacheds-2.0.0.AM25-default"
  apacheds_install_directory = "/var/lib/apacheds-2.0.0.AM25/default"
  apacheds_lib_directory     = "/opt/apacheds-2.0.0.AM25"
  workspace                  = "/tmp/apacheds-bootstrap"
  log_level                  = "WARN"

  # LDAP
  ldap_protocol = "ldap"
  bind_user     = "uid=admin,ou=system"
  partition_id  = "moj"
  base_root     = "dc=moj,dc=com"

  # Data import
  sanitize_oid_ldif = "yes"
}

# Default values for NDelius WebLogic
instance_type_weblogic = "m5.xlarge"

instance_count_weblogic_ndelius = "30"

instance_count_weblogic_spg = "6"

instance_count_weblogic_interface = "6"

default_ansible_vars = {
  # Server/WebLogic config
  jvm_mem_args            = "-Xms12g -Xmx12g"
  domain_name             = "NDelius" # This is defined by the AMI, so should not be overridden
  server_name             = "AdminServer"
  weblogic_admin_username = "weblogic"
  server_listen_address   = "0.0.0.0"

  # Database
  setup_datasources = "true"
  database_host     = "delius-db"

  # Alfresco
  alfresco_host        = "alfresco"
  alfresco_port        = 80
  alfresco_office_host = "alfresco"
  alfresco_office_port = 443

  #SPG jms may get moved to amazonMQ (and thereby wont be hosted on the mpx server) so rename to jms host and use another dns name
  #spg_host = "spgw-mpx-int"
  spg_jms_host = "spgw-jms-int"

  activemq_data_folder = "/activemq-data"

  # LDAP
  ldap_host          = "ldap-elb"
  ldap_readonly_host = "ldap-readonly-elb"
  partition_id       = "moj"
  ldap_base          = "dc=moj,dc=com"
  ldap_user_base     = "cn=Users,dc=moj,dc=com"
  ldap_group_base    = "cn=EISUsers,cn=Users,dc=moj,dc=com"

  # App Config
  ndelius_display_name  = "National Delius"
  ndelius_training_mode = "production" # development, training, production
  ndelius_log_level     = "ERROR"
  ndelius_analytics_tag = "UA-122274748-2"
  ldap_passfile         = "/u01/app/oracle/middleware/user_projects/domains/NDelius/password.keyfile"

  # New Tech
  newtech_search_url             = "/newTech"
  newtech_pdfgenerator_url       = "/newTech"
  newtech_pdfgenerator_templates = "shortFormatPreSentenceReport"
  newtech_pdfgenerator_secret    = "ThisIsASecretKey" # TODO pull from param store

  # User Management Tool
  usermanagement_url = "/umt/"

  # NOMIS
  nomis_url           = "https://gateway.prod.nomis-api.hmpps.dsd.io/elite2api"
  nomis_client_id     = "delius"
  nomis_client_secret = "ThisIsASecretKey" # TODO pull from param store
}

# PWM
pwm_config = {
  instance_type            = "t3.large" # AWS instance type to use
  memory                   = 6144       # Memory to assign to ECS container in MB
  ecs_scaling_min_capacity = 3          # Minimum number of running tasks
  ecs_scaling_max_capacity = 30         # Maximum number of running tasks
  ec2_scaling_min_capacity = 3          # Minimum number of running instances
  ec2_scaling_max_capacity = 30         # Maximum number of running instances
  ecs_target_cpu           = 60         # CPU target value for scaling of ECS tasks
  scale_up_cpu_threshold   = 50         # CPU threshold to trigger scale up of EC2 instances
  scale_down_cpu_threshold = 15         # CPU threshold to trigger scale down of EC2 instances
}

# UMT
umt_config = {
  version                  = "latest"   # Application version
  instance_type            = "t3.large" # AWS instance type to use
  memory                   = 6144       # Memory to assign to ECS container in MB
  ecs_scaling_min_capacity = 3          # Minimum number of running tasks
  ecs_scaling_max_capacity = 30         # Maximum number of running tasks
  ec2_scaling_min_capacity = 3          # Minimum number of running instances
  ec2_scaling_max_capacity = 30         # Maximum number of running instances
  ecs_target_cpu           = 60         # CPU target value for scaling of ECS tasks
  scale_up_cpu_threshold   = 50         # CPU threshold to trigger scale up of EC2 instances
  scale_down_cpu_threshold = 15         # CPU threshold to trigger scale down of EC2 instances
}

# DSS Batch Task
dss_batch_instances = ["m5.large", "c5.large"]

dss_min_vcpu = 0

dss_max_vcpu = 8

dss_job_image = "895523100917.dkr.ecr.eu-west-2.amazonaws.com/hmpps/dss:3.0"

dss_job_vcpus = 1

dss_job_memory = 256

dss_job_schedule = "cron(00 05 * * ? *)"

dss_job_retries = 1

dss_queue_state = "ENABLED"

dss_job_ulimits = [
  {
    "name"      = "nofile"
    "hardLimit" = "1024"
    "softLimit" = "1024"
  },
]

# Testing/Chaosmonkey 
ce_instances = ["m5.large", "c5.large"]

ce_min_vcpu = 0

ce_max_vcpu = 8

ce_queue_state = "ENABLED"

chaosmonkey_job_image = "mojdigitalstudio/hmpps-chaosmonkey:latest"

chaosmonkey_job_vcpus = 1

chaosmonkey_job_memory = 512

chaosmonkey_job_retries = 1

chaosmonkey_job_envvars = [
  {
    "name"  = "SIMIANARMY_CLIENT_LOCALDB_ENABLED"
    "value" = "true"
  },
  {
    "name"  = "SIMIANARMY_CALENDAR_TIMEZONE"
    "value" = "Europe/London"
  },
  {
    "name"  = "SIMIANARMY_CHAOS_LEASHED"
    "value" = "true"
  },
  {
    "name"  = "SIMIANARMY_CALENDAR_OPENHOUR"
    "value" = "9"
  },
  {
    "name"  = "SIMIANARMY_CALENDAR_CLOSEHOUR"
    "value" = "17"
  },
  {
    "name"  = "SIMIANARMY_CLIENT_AWS_REGION"
    "value" = "eu-west-2"
  },
]

chaosmonkey_job_ulimits = []

delius_core_haproxy_instance_type = "t3.large"
delius_core_haproxy_instance_count = "3"