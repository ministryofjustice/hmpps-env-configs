#DOCKER IMAGE VERSION OF THE SPG DEPLOYABLE CODE
image_version = "latest"

# This is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

# VPC variables
cloudwatch_log_retention = 14

# ROUTE53 ZONE probation.hmpps.dsd.io
route53_hosted_zone_id = "Z3VDCLGXC4HLOW"


esc_container_stop_timeout = "310s"

deployment_minimum_healthy_percent = "50"

# ALLOWED CIDRS
allowed_cidr_block = [
  "109.148.137.148/32", #Don Home
  "81.134.202.29/32",   #Moj VPN
  "217.33.148.210/32",  #Digital studio
  "35.176.14.16/32",    #Engineering Jenkins non prod AZ 1
  "35.177.83.160/32",   #Engineering Jenkins non prod AZ 2
  "18.130.108.149/32",  #Engineering Jenkins non prod AZ 3
]


asg_instance_type_crc = "t2.small"
asg_instance_type_mpx = "t2.medium"
asg_instance_type_iso = "t2.small"

aws_broker_deployment_mode = "ACTIVE_STANDBY_MULTI_AZ"

spg_app_name = "spgw"

s3_bucket_config = "tf-eu-west-2-hmpps-delius-perf-spgw-s3bucket"
spg_build_inv_dir = "/tmp/ansible/inventories/hmpps/generic-default"




#ecs cpu units set to null (default appears to be 1024 across micro/small/medium)
#ecs memory is instance memory less headroom required for the service (see hmpps-delius-spg-shared-terraform/README_ECS_MEMORY_AND_CPU_LIMITS.md
#Java needs to be approx 200MB less than available memory to allow for things like clamscan & sshd etc (this is a guestimate)


### MPX ###

spg_mpx_asg_desired = 1
spg_mpx_asg_max = 2
spg_mpx_asg_min = 1
spg_mpx_service_desired_count = 1
SPG_MPX_JAVA_MAX_MEM = 3645
SPG_MPX_HOST_TYPE = "hybrid"


### CRC ###

spg_crc_asg_desired = 1
spg_crc_asg_max = 2
spg_crc_asg_min = 1
spg_crc_ecs_memory = 1881
SPG_CRC_JAVA_MAX_MEM = 1691
SPG_CRC_HOST_TYPE = "crc"


### ISO ###

spg_iso_asg_desired = 1
spg_iso_asg_max = 2
spg_iso_asg_min = 1
spg_iso_service_desired_count = 1
spg_iso_ecs_memory = 1881
SPG_ISO_JAVA_MAX_MEM = 1691
SPG_ISO_HOST_TYPE = "iso"



SPG_GENERIC_BUILD_INV_DIR = "/tmp/spg/ansible/inventories/generic-default"


#SPG_ENVIRONMENT_CN represents the strategic public DNS gov domain, and is used by SPG to know the name of the certificates it imports
#as well as displaying the environment in terminals and splash screens
#eg spgw-ext.{{ SPG_ENVIRONMENT_CN }}.pfx

SPG_ENVIRONMENT_CODE = "perf"
SPG_ENVIRONMENT_CN = "perf.probation.service.justice.gov.uk"


SPG_GATEWAY_MQ_URL="tcp://localhost:61616"
SPG_DELIUS_MQ_URL ="tcp://delius-jms.delius-perf.internal:61617"

SPG_DOCUMENT_REST_SERVICE_ADMIN_URL  ="https://alfresco.perf.delius.probation.hmpps.dsd.io/alfresco/service/admin-spg"
SPG_DOCUMENT_REST_SERVICE_PUBLIC_URL  ="https://alfresco.perf.delius.probation.hmpps.dsd.io/alfresco/service/noms-spg"


SPG_ISO_FQDN  = "spgw-ext.perf.probation.service.justice.gov.uk"
SPG_MPX_FQDN  = "spgw-mpx-int.perf.delius.probation.hmpps.dsd.io"
SPG_CRC_FQDN  = "spgw-crc-ext.perf.probation.service.justice.gov.uk"

SPG_GATEWAY_MQ_URL_SOURCE="data"