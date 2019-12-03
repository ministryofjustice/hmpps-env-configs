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

# required for security group rules
oracle_db_operation = {
  eng_remote_state_bucket_name = "tf-eu-west-2-hmpps-eng-prod-remote-state"
  eng_role_arn                 = "arn:aws:iam::077643444046:role/terraform"
}

alfresco_app_name = "alfresco"

spg_app_name = "spgw"

# Alfresco
# accounts used for updating alfresco ami permissions at release
alf_account_ids = {
  hmpps-delius-pre-prod = "010587221707"
  hmpps-delius-stage    = "205048117103"
}

# ASG Configuration
alfresco_asg_props = {
  asg_desired       = 4
  asg_min           = 4
  asg_max           = 4
  asg_instance_type = "m5.2xlarge"
  asg_ami           = "ami-0324358f836834251"
  ebs_volume_size   = 1000
  min_elb_capacity  = 2
  ami_name          = "HMPPS Alfresco master*"
  image_id          = "ami-0f7eff23903506a77" # used for updating ami launch permissions
}

# jvm heap
alfresco_jvm_memory = "24G"

alfresco_volume_size = 60

alf_backups_config = {
  transition_days                            = 30
  expiration_days                            = 2560
  noncurrent_version_transition_days         = 30
  noncurrent_version_transition_glacier_days = 60
  noncurrent_version_expiration_days         = 2560
  provisioned_throughput_in_mibps            = 20
  throughput_mode                            = "provisioned"
  prod_backups_bucket                        = "tf-eu-west-2-hmpps-delius-prod-alfresco-alf-backups"
  prod_kms_key_arn                           = "arn:aws:kms:eu-west-2:050243167760:key/f32be75c-beb8-409c-a970-db9de7201473"
}

alf_cloudwatch_log_retention = 60

alf_rds_props = {
  instance_class          = "db.m5.2xlarge"
  iops                    = 10000
  storage_type            = "io1"
  allocated_storage       = 1000
  maintenance_window      = "Wed:19:30-Wed:21:30"
  backup_window           = "02:00-04:00"
  backup_retention_period = 28
  family                  = "postgres9.6"
  engine                  = "postgres"
  major_engine_version    = "9.6"
  replica_engine_version  = "9.6.9"
  master_engine_version   = "9.6.9"
}

# ontrol rds deployment
alf_data_import = "disabled"

alf_rds_migration_parameters = [
  {
    name         = "maintenance_work_mem"
    value        = 8388608
    apply_method = "pending-reboot"
  },
  {
    name         = "max_wal_size"
    value        = 256
    apply_method = "pending-reboot"
  },
  {
    name         = "checkpoint_timeout"
    value        = 1800
    apply_method = "pending-reboot"
  },
  {
    name         = "synchronous_commit"
    value        = "Off"
    apply_method = "pending-reboot"
  },
  {
    name         = "wal_buffers"
    value        = 8192
    apply_method = "pending-reboot"
  },
  {
    name         = "autovacuum"
    value        = "Off"
    apply_method = "pending-reboot"
  }
]

# elk
elk_backups_config = {
  transition_days                 = 28
  expiration_days                 = 2560
  provisioned_throughput_in_mibps = 20
  throughput_mode                 = "provisioned"
}

# elasticsearch
# jvm
es_jvm_heap_size = "16g"

# memory
es_ecs_memory = "26000"

es_ecs_mem_limit = "25500"

elk_migration_props = {
  min_size                        = 3
  max_size                        = 3
  desired                         = 3
  ecs_cpu_units                   = 500
  ecs_memory                      = 18000
  jvm_heap_size                   = "16g"
  image_url                       = "mojdigitalstudio/hmpps-elasticsearch-5:latest"
  kibana_image_url                = "mojdigitalstudio/hmpps-kibana-5:latest"
  logstash_image_url              = "mojdigitalstudio/hmpps-logstash:latest"
  block_device                    = "/dev/nvme0n1"
  es_master_nodes                 = 2
  ecs_service_desired_count       = 3
  instance_type                   = "i3.xlarge"
  kibana_instance_type            = "m4.large"
  kibana_desired_count            = 2
  kibana_asg_size                 = 2
  logstash_desired_count          = 2
  provisioned_throughput_in_mibps = 50
  throughput_mode                 = "provisioned"
}

# es_admin
alf_restore_status     = "restore"
es_admin_instance_type = "c5.xlarge"

es_admin_volume_props = {
  size            = 1000
  type            = "io1"
  iops            = 32000
  encrypted       = true
  device_name     = "/dev/xvdb"
  create_snapshot = false
}

## Delius Core
weblogic_domain_ports = {
  weblogic_port      = "80"
  weblogic_tls_port  = "443" # currently unused, as tls is terminated at the load-balancer
  activemq_port      = "61617"
  spg_jms_broker     = "61616"
  spg_jms_broker_ssl = "61617"
}

ldap_ports = {
  ldap     = "389"
  ldap_tls = "636" # currently unused, as the ldap can only be accessed internally
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
  "35.176.246.202/32", #Engineering Jenkins non prod windows slave
  "194.75.210.208/28", #BCL
  "213.48.246.99/32",  #BCL
  "195.59.75.0/24",    # ARK internet (DOM1)
  "194.33.192.0/25",   # ARK internet (DOM1)
  "194.33.193.0/25",   # ARK internet (DOM1)
  "194.33.196.0/25",   # ARK internet (DOM1)
  "194.33.197.0/25",   # ARK internet (DOM1)
  "212.137.36.230/32", # Quantum
  "62.25.109.197/32",  # Quantum
  "195.92.38.16/28",   # Quantum
  "62.25.106.209/32",  # OMNI
  "195.92.40.49/32",   # OMNI
  "62.232.198.64/28",  # I2N 
  "3.10.56.113/32",    # PSN Proxy A
  "35.178.173.171/32", # PSN Proxy B
  "82.38.248.151/32",  # Steve James Office
  "213.86.81.13/32",   # Zaizi London Office
]

# jenkins access
jenkins_access_cidr_blocks = [
  "35.176.14.16/32",   #Engineering Jenkins non prod AZ 1
  "35.177.83.160/32",  #Engineering Jenkins non prod AZ 2
  "18.130.108.149/32", #Engineering Jenkins non prod AZ 3
  "35.176.246.202/32", #Engineering Jenkins non prod windows slave
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

# Default values for LDAP
instance_type_ldap = "m5.8xlarge"
ldap_disk_config = {
  volume_type = "io1"
  volume_size = 100
  iops        = 5000
}
default_ansible_vars_apacheds = {
  workspace = "/root/bootstrap-workspace"

  # LDAP
  ldap_protocol = "ldap"
  bind_user     = "cn=admin,dc=moj,dc=com"
  base_root     = "dc=moj,dc=com"
  base_users    = "ou=Users,dc=moj,dc=com"

  # Data import
  import_users_ldif            = "LATEST"
  import_users_ldif_base_users = "ou=Users,dc=moj,dc=com"
  sanitize_oid_ldif            = "yes"
  perf_test_users              = "0"
}

# Default values for NDelius WebLogic
instance_type_weblogic            = "m5.xlarge"
instance_count_weblogic_ndelius   = "30"
instance_count_weblogic_spg       = "6"
instance_count_weblogic_interface = "6"
default_ansible_vars = {
  # Server/WebLogic config
  jvm_mem_args            = "-Xms12g -Xmx12g -XX:MaxPermSize=512m"
  domain_name             = "NDelius" # This is defined by the AMI, so should not be overridden
  server_name             = "AdminServer"
  weblogic_admin_username = "weblogic"
  server_listen_address   = "0.0.0.0"

  # Database
  setup_datasources      = "true"
  database_host          = "delius-db"
  database_min_pool_size = 50
  database_max_pool_size = 100

  # Alfresco
  alfresco_host        = "alfresco"
  alfresco_port        = 443
  alfresco_office_host = "alfresco"
  alfresco_office_port = 443

  #spg hostname prefix for generating a url when not using amazonMQ (ie when spg_jms_host_src=var  instead of data (data mode uses the terraform state to generate the url )
  spg_jms_host = "spgw-jms-int"

  activemq_data_folder = "/activemq-data"

  # App Config
  ndelius_display_name  = "National Delius"
  ndelius_training_mode = "production" # development, training, production
  ndelius_log_level     = "ERROR"
  ndelius_analytics_tag = "UA-122274748-2"
  ldap_passfile         = "/u01/app/oracle/middleware/user_projects/domains/NDelius/password.keyfile"

  # New Tech
  newtech_search_url             = "/newTech"
  newtech_pdfgenerator_url       = "/newTech"
  newtech_pdfgenerator_templates = "shortFormatPreSentenceReport|paroleParom1Report"
  newtech_pdfgenerator_secret    = "ThisIsASecretKey" # TODO pull from param store

  # User Management Tool
  usermanagement_url = "/umt/"

  # NOMIS
  nomis_url           = "https://gateway.preprod.nomis-api.service.hmpps.dsd.io/elite2api"
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

dss_job_memory = 3096

dss_job_schedule = "cron(00 07 * * ? *)"

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

delius_core_haproxy_instance_type  = "t3.large"
delius_core_haproxy_instance_count = "3"

# Shared ECS Cluster
ecs_instance_type = "m4.xlarge"
node_max_count    = 20
node_min_count    = 5

loadrunner_config = {
  "instance_type" = "t3.large"
}

azure_oasys_proxy_source = [
  "51.140.255.11/32" # Public IP of Fix & Go Azure API Gateway used for NDH
]

#these 3 vars dictate whether or not to use AmazonMQ, vs spg-mpx-broker ('data'|'var')
#var = spg local MQ, data = amazon mq
SPG_GATEWAY_MQ_URL_SOURCE    = "var"
spg_messaging_broker_url_src = "var"
spg_jms_host_src             = "var"

# Parent R53 Zone ID for strategic domain (probation.service.justice.gov.uk)
strategic_parent_zone_id              = "Z2SOZ79CNGAPIF"
strategic_parent_zone_delegation_role = "arn:aws:iam::050243167760:role/r53_delegation_role"
