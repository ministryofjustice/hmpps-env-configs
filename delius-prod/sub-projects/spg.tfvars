#DOCKER IMAGE VERSION OF THE SPG DEPLOYABLE CODE
image_version = "branch-latest-DAM-695"

# This is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

# VPC variables
cloudwatch_log_retention = 90

# ROUTE53 ZONE probation.hmpps.dsd.io
route53_hosted_zone_id = "Z3VDCLGXC4HLOW"

# ROUTE53 ZONE strategic probation.service.justice.gov.uk (same as normal)
route53_strategic_hosted_zone_id = "Z2SOZ79CNGAPIF"




# ALLOWED CIDRS
allowed_cidr_block = [
  "109.148.137.148/32", #Don Home
  "81.134.202.29/32",   #Moj VPN
  "217.33.148.210/32",  #Digital studio
  "35.176.14.16/32",    #Engineering Jenkins non prod AZ 1
  "35.177.83.160/32",   #Engineering Jenkins non prod AZ 2
  "18.130.108.149/32",  #Engineering Jenkins non prod AZ 3
]


//NOTE in ukcloud servers are spec'd at 32GIG ram
//I think could easily get away with 4, but need to performance test


aws_broker_deployment_mode = "ACTIVE_STANDBY_MULTI_AZ"

spg_app_name = "spgw"

s3_bucket_config = "tf-eu-west-2-hmpps-delius-prod-spgw-s3bucket"
spg_build_inv_dir = "/tmp/ansible/inventories/hmpps/generic-default"




#ecs cpu units set to null (default appears to be 1024 across micro/small/medium)
#ecs memory is instance memory less headroom required for the service (see hmpps-delius-spg-shared-terraform/README_ECS_MEMORY_AND_CPU_LIMITS.md
#Java needs to be approx 1.5gig less than available memory to allow for things like clamscan (1.2gig and growing) & sshd & filebeat etc


### MPX ###
asg_instance_type_mpx = "t2.2xlarge"

spg_mpx_asg_desired = 3 #3 when aMQ and identity generator deployed  (4 to include the original machine with many logs on it)
spg_mpx_asg_max = 3 #6 when aMQ and identity generator deployed
spg_mpx_asg_min = 3 #3 when aMQ and identity generator deployed

spg_mpx_service_desired_count = 3 # 3 when aMQ and identity generator deployed
spg_mpx_ecs_memory = 32100
SPG_MPX_JAVA_MAX_MEM = 30600
SPG_MPX_HOST_TYPE = "hybrid"


### CRC ###
asg_instance_type_crc = "t2.small"

spg_crc_service_desired_count = 1
spg_crc_ecs_memory = 1881
SPG_CRC_JAVA_MAX_MEM = 1500
SPG_CRC_HOST_TYPE = "crc"


### ISO ###
asg_instance_type_iso = "t2.2xlarge"

spg_iso_asg_desired = 3 #6 when live
spg_iso_asg_max = 6 #6 when live
spg_iso_asg_min = 3 #3 when live

spg_iso_service_desired_count = 3 # 3 when aMQ and identity generator deployed
spg_iso_ecs_memory = 32100
SPG_ISO_JAVA_MAX_MEM = 30600
SPG_ISO_HOST_TYPE = "iso"



SPG_GENERIC_BUILD_INV_DIR = "/tmp/spg/ansible/inventories/generic-default"


#SPG_ENVIRONMENT_CN represents the strategic public DNS gov domain, and is used by SPG to know the name of the certificates it imports
#as well as displaying the environment in terminals and splash screens
#eg spgw-ext.{{ SPG_ENVIRONMENT_CN }}.pfx

SPG_ENVIRONMENT_CODE = "prod"
SPG_ENVIRONMENT_CN = "probation.service.justice.gov.uk"


SPG_GATEWAY_MQ_URL="tcp://localhost:61616"
SPG_DELIUS_MQ_URL ="tcp://delius-jms.delius-prod.internal:61617"

SPG_DOCUMENT_REST_SERVICE_ADMIN_URL  ="https://alfresco.probation.service.justice.gov.uk/alfresco/service/admin-spg"
SPG_DOCUMENT_REST_SERVICE_PUBLIC_URL  ="https://alfresco.probation.service.justice.gov.uk/alfresco/service/noms-spg"


SPG_ISO_FQDN  = "spgw-ext.probation.service.justice.gov.uk"
SPG_MPX_FQDN  = "spgw-mpx-int.probation.service.justice.gov.uk"
SPG_CRC_FQDN  = "spgw-crc-ext.probation.service.justice.gov.uk"


SPG_ENV_VARS = {
  SPG_INTERNAL_SCHEMA_VERSION = "0-9-14"
}