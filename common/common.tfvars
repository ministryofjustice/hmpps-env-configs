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

bastion_remote_state_bucket_name = "tf-eu-west-2-hmpps-bastion-dev-remote-state"

eng_role_arn = "arn:aws:iam::895523100917:role/terraform"

bastion_role_arn = "arn:aws:iam::895523100917:role/terraform"

# required for security group rules
oracle_db_operation = {
  eng_remote_state_bucket_name = "tf-eu-west-2-hmpps-eng-dev-remote-state"
  eng_role_arn                 = "arn:aws:iam::895523100917:role/terraform"
}

alfresco_app_name = "alfresco"

alf_cloudwatch_log_retention = 14

spg_app_name = "spg"

# Alfresco

# accounts used for updating alfresco ami permissions at release
alf_account_ids = {
  hmpps-delius-test      = "728765553488"
  hmpps-delius-training  = "330914586320"
  hmpps-delius-po-test1  = "716683748953"
  hmpps-delius-auto-test = "431912413968"
  hmpps-delius-core-dev  = "723123699647"
}

alfresco_jvm_memory = "8G"

alfresco_asg_props = {
  asg_desired       = 1
  asg_min           = 1
  asg_max           = 2
  asg_instance_type = "m4.xlarge"
  asg_ami           = ""
  ebs_volume_size   = 512
  min_elb_capacity  = 1
  ami_name          = "HMPPS Alfresco*"
  image_id = "ami-024bdaa974371ea6b" # used for updating ami launch permissions
}

alf_backups_config = {
  transition_days                            = 30
  expiration_days                            = 90
  noncurrent_version_transition_days         = 30
  noncurrent_version_transition_glacier_days = 60
  noncurrent_version_expiration_days         = 90
  provisioned_throughput_in_mibps            = 50
  throughput_mode                            = "provisioned"
}

# alerts
alf_ops_alerts = {
  slack_channel_name = "delius-alerts-alfresco-nonprod"
  log_level          = "info"
  messaging_status   = "disabled"
  runtime            = "python3.7"
  ssm_token          = "manual-ops-alerts-slack-token"
}

alf_rds_props = {
  instance_class          = "db.t2.large"
  iops                    = 0
  storage_type            = "gp2"
  allocated_storage       = 100
  maintenance_window      = "Wed:19:30-Wed:21:30"
  backup_window           = "02:00-04:00"
  backup_retention_period = 7
  family                  = "postgres9.6"
  engine                  = "postgres"
  major_engine_version    = "9.6"
  replica_engine_version  = "9.6.9"
  master_engine_version   = "9.6.9"
}

# alf solr
alf_solr_config = {
  ebs_size           = 100
  ebs_iops           = 100
  ebs_type           = "gp2"
  ebs_device_name    = "/dev/xvdc"
  java_xms           = "4000m"
  java_xmx           = "4000m"
  alf_jvm_memory     = "4000m"
  schedule           = "cron(0 01 * * ? *)"
  cold_storage_after = 14
  delete_after       = 120
  snap_tag           = "CreateSnapshotSolr"
  ebs_temp_device_name = "/dev/xvdd"
  ebs_temp_size        = 20
  ebs_temp_type        = "gp2" 
}

# ontrol rds deployment
alf_data_import = "disabled"

alf_rds_migration_parameters = []
alf_db_parameters = [
  {
    name  = "autovacuum_analyze_threshold"
    value = "20000"
    apply_method = "pending-reboot"
  },
  {
    name  = "autovacuum_analyze_scale_factor"
    value = "0.0"
    apply_method = "pending-reboot"
  },
  {
    name  = "max_connections"
    value = "1200"
    apply_method = "pending-reboot"
  },
  {
    name  = "work_mem"
    value = "8388608"
    apply_method = "pending-reboot"
  },
  {
    name  = "shared_preload_libraries"
    value = "pg_stat_statements"
    apply_method = "pending-reboot"
  },
  {
    name  = "track_activity_query_size"
    value = "2048"
    apply_method = "pending-reboot"
  },
  {
    name  = "pg_stat_statements.track"
    value = "ALL"
    apply_method = "pending-reboot"
  },
  {
    name  = "pg_stat_statements.max"
    value = "10000"
    apply_method = "pending-reboot"
  },
  {
    name  = "log_statement"
    value = "mod"
    apply_method = "pending-reboot"
  },
  {
    name  = "log_min_duration_statement"
    value = "5000"
    apply_method = "pending-reboot"
  }
]

# elk
elk_backups_config = {
  transition_days                 = 2
  expiration_days                 = 7
  provisioned_throughput_in_mibps = 50
  throughput_mode                 = "provisioned"
}

# elasticsearch
# jvm
es_jvm_heap_size = "8g"

# memory
es_ecs_memory = "9000"

es_ecs_mem_limit = "8500"

# instance type
es_instance_type = "m5d.xlarge"

# es_admin
alf_restore_status     = "restore"

es_admin_instance_type = "t2.large"

es_admin_volume_props = {
  size            = 200
  type            = "gp2"
  iops            = 100
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
  "18.130.186.182/32", #TEST  test-test-windows-injector-0
  "35.178.200.180/32", #TEST  test-test-windows-injector-1
  "35.176.195.86/32",  #TEST  test-test-windows-loadrunner
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
  disk_size      = 500 # Do not decrease this

  # total_storage  = 1000 # This should equal disks_quantity x disk_size
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
retention_period = 60

# How long we keep our backups on the efs share in days, we don't have a policy on s3 yet
backup_retention_days = 7

# How long do we keep our instance volume snapshots for
snapshot_retention_days = 7

# Default values for LDAP
default_ldap_config = {
  # ASG
  instance_type         = "t3.small"
  instance_count        = 3
  # Connection
  protocol              = "ldap"
  port                  = 389
  bind_user             = "cn=admin,dc=moj,dc=com"
  #bind_password        = "${environment_name}/${project_name}/apacheds/apacheds/ldap_admin_password"
  # Structure
  base_root             = "dc=moj,dc=com"
  base_users            = "ou=Users,dc=moj,dc=com"
  base_service_users    = "cn=EISUsers,ou=Users,dc=moj,dc=com"
  base_roles            = "cn=ndRoleCatalogue,ou=Users,dc=moj,dc=com"
  base_role_groups      = "cn=ndRoleGroups,ou=Users,dc=moj,dc=com"
  base_groups           = "ou=Groups,dc=moj,dc=com"
  # Logging
  log_level             = "stats,sync"
  # Backups
  backup_frequency      = "daily"
  backup_retention_days = 7
  # Performance/tuning
  query_time_limit      = 30 # seconds
  db_max_size           = 16106127360 # bytes (=15GB)
  # Disk
  disk_volume_type      = "io1"
  disk_volume_size      = 30 # GB
  disk_iops             = 1000
}
ldap_config = {}

# Default values for NDelius WebLogic
instance_type_weblogic = "t3.medium"
instance_count_weblogic_ndelius = "3"
instance_count_weblogic_spg = "3"
instance_count_weblogic_interface = "3"
default_ansible_vars = {
  # Server/WebLogic config
  jvm_mem_args            = "-Xms3g -Xmx3g -XX:MaxPermSize=512m"
  domain_name             = "NDelius" # This is defined by the AMI, so should not be overridden
  server_name             = "AdminServer"
  weblogic_admin_username = "weblogic"
  server_listen_address   = "0.0.0.0"

  # Database
  setup_datasources      = "true"
  database_host          = "delius-db"
  database_min_pool_size = 10
  database_max_pool_size = 15

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
  ndelius_log_level     = "INFO"
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
  nomis_url           = "https://gateway.t3.nomis-api.hmpps.dsd.io/elite2api"
  nomis_client_id     = "delius"
  nomis_client_secret = "ThisIsASecretKey" # TODO pull from param store

  # Approved Premises Tracker API
  aptracker_api_errors_url = "/aptracker-api/errors"
}

# PWM
pwm_config = {
  instance_type            = "t3.large" # AWS instance type to use
  memory                   = 6144       # Memory to assign to ECS container in MB
  ecs_scaling_min_capacity = 1          # Minimum number of running tasks
  ecs_scaling_max_capacity = 10         # Maximum number of running tasks
  ec2_scaling_min_capacity = 1          # Minimum number of running instances
  ec2_scaling_max_capacity = 10         # Maximum number of running instances
  ecs_target_cpu           = 60         # CPU target value for scaling of ECS tasks
  scale_up_cpu_threshold   = 50         # CPU threshold to trigger scale up of EC2 instances
  scale_down_cpu_threshold = 15         # CPU threshold to trigger scale down of EC2 instances
}

# UMT
default_umt_config = {
  version                       = "1.7.3-SNAPSHOT"  # Application version
  memory                        = 1024              # Memory to assign to ECS container in MB
  cpu                           = 512               # CPU to assign to ECS container
  ecs_scaling_min_capacity      = 1                 # Minimum number of running tasks
  ecs_scaling_max_capacity      = 10                # Maximum number of running tasks
  ecs_target_cpu                = 60                # CPU target value for scaling of ECS tasks
  redis_node_type               = "cache.t3.small"  # Instance type to use for the Redis token store cluster
  redis_node_groups             = 1                 # Number of Redis shards (node groups) in the cluster
  redis_replicas_per_node_group = 0                 # Number of read-only replicas for each shard (node group)
}
umt_config = {}

# Approved Premises Tracker API
default_aptracker_api_config = {
  version                  = "1.13"   # Application version
  memory                   = 1024       # Memory to assign to ECS container in MB
  cpu                      = 512        # CPU to assign to ECS container
  ecs_scaling_min_capacity = 1          # Minimum number of running tasks
  ecs_scaling_max_capacity = 10         # Maximum number of running tasks
  ecs_target_cpu           = 60         # CPU target value for scaling of ECS tasks
  log_level                = "DEBUG"    # Application log-level
}
aptracker_api_config = {}

# Delius GDPR compliance tool
default_gdpr_config = {
  api_image_url               = "895523100917.dkr.ecr.eu-west-2.amazonaws.com/hmpps/delius-gdpr"
  api_version                 = "0.24.0"               # Application version
  api_memory                  = 512                    # Memory to assign to API container
  api_cpu                     = 512                    # CPU to assign to API container
  cron_identifyduplicates     = "-"                    # Batch schedules. Set to "-" to disable.
  cron_retainedoffenders      = "-"                    #
  cron_retainedoffendersiicsa = "-"                    #
  cron_eligiblefordeletion    = "-"                    #
  cron_deleteoffenders        = "-"                    #
  cron_destructionlogclearing = "-"                    #
  ui_image_url                = "895523100917.dkr.ecr.eu-west-2.amazonaws.com/hmpps/delius-gdpr-ui"
  ui_version                  = "0.24.0"               # Application version
  ui_memory                   = 512                    # Memory to assign to UI container
  ui_cpu                      = 512                    # CPU to assign to UI container
  ui_scaling_min_capacity     = 1                      # Minimum number of running tasks per service
  ui_scaling_max_capacity     = 10                     # Maximum number of running tasks per service
  ui_target_cpu               = 60                     # CPU target value for scaling of ECS tasks
  db_instance_class           = "db.t3.small"          # Instance type to use for the database
  db_storage                  = 30                     # Allocated database storage in GB
  db_maintenance_window       = "Wed:21:00-Wed:23:00"  # Maintenance window for database patching/upgrades
  db_backup_window            = "19:00-21:00"          # Daily window to take RDS backups
  db_backup_retention_period  = 1                      # Number of days to retain RDS backups for
  log_level                   = "DEBUG"                # Application log-level
}
gdpr_config = {}

# Elasticsearch
es_jvm_heap_size = "8g"

# DSS Batch Task
dss_batch_instances = ["m5.large", "c5.large"]

dss_min_vcpu = 0

dss_max_vcpu = 8

dss_job_image = "895523100917.dkr.ecr.eu-west-2.amazonaws.com/hmpps/dss:3.0"

dss_job_vcpus = 1

dss_job_memory = 256

dss_job_schedule = "cron(00 23 * * ? *)"

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
    "value" = "false"
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

delius_core_haproxy_instance_type = "t3.micro"
delius_core_haproxy_instance_count = "3"

loadrunner_config = {
  "instance_type" = "t3.micro"
}

azure_oasys_proxy_source = [
  "51.140.255.11/32", # Public IP of Fix & Go Azure API Gateway used for NDH
  "51.137.128.165/32", # NDH Bridge
]


#these 3 vars dictate whether or not to use AmazonMQ, vs spg-mpx-broker ('data'|'var')
#var = spg local MQ, data = amazon mq
SPG_GATEWAY_MQ_URL_SOURCE    = "var"
spg_messaging_broker_url_src = "var"
spg_jms_host_src             = "var"

# Parent R53 Zone ID for strategic domain (probation.service.justice.gov.uk)
strategic_parent_zone_id = "Z2SOZ79CNGAPIF"
strategic_parent_zone_delegation_role = "arn:aws:iam::050243167760:role/r53_delegation_role"
