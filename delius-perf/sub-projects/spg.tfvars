# This is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

# VPC variables
cloudwatch_log_retention = 14

# ROUTE53 ZONE probation.hmpps.dsd.io
route53_hosted_zone_id = "Z3VDCLGXC4HLOW"

# ENVIRONMENT REMOTE STATES
eng-remote_state_bucket_name = "tf-eu-west-2-hmpps-eng-dev-remote-state"


# ALLOWED CIDRS
allowed_cidr_block = [
  "109.148.137.148/32", #Don Home
  "81.134.202.29/32",   #Moj VPN
  "217.33.148.210/32",  #Digital studio
  "35.176.14.16/32",    #Engineering Jenkins non prod AZ 1
  "35.177.83.160/32",   #Engineering Jenkins non prod AZ 2
  "18.130.108.149/32",  #Engineering Jenkins non prod AZ 3
]

# ASG Configuration
az_asg_desired = {
  az1 = "1"

  az2 = "0"

  az3 = "0"
}

az_asg_max = {
  az1 = "2"

  az2 = "0"

  az3 = "0"
}

az_asg_min = {
  az1 = "1"

  az2 = "0"

  az3 = "0"
}

asg_instance_type_crc = "t2.small"
asg_instance_type_mpx = "t2.medium"
asg_instance_type_iso = "t2.small"


spg_app_name = "spgw"

s3_bucket_config = "tf-eu-west-2-hmpps-delius-perf-spgw-s3bucket"
spg_build_inv_dir = "/tmp/ansible/inventories/hmpps/prod/perf"




#ecs cpu units set to null (default appears to be 1024 across micro/small/medium)
#ecs memory is instance memory less headroom required for the service (see hmpps-delius-spg-shared-terraform/README_ECS_MEMORY_AND_CPU_LIMITS.md
#Java needs to be approx 200MB less than available memory to allow for things like clamscan & sshd etc (this is a guestimate)
//spg_mpx_ecs_cpu_units = 1024
spg_mpx_ecs_memory = 3835
SPG_MPX_JAVA_MAX_MEM = 3645
SPG_MPX_HOST_TYPE = "one"

//spg_crc_ecs_cpu_units = 1024
spg_crc_ecs_memory = 1881
SPG_CRC_JAVA_MAX_MEM = 1691
SPG_CRC_HOST_TYPE = "crc"

//spg_iso_ecs_cpu_units = 1024
spg_iso_ecs_memory = 1881
SPG_ISO_JAVA_MAX_MEM = 1691
SPG_ISO_HOST_TYPE = "iso"



SPG_GENERIC_BUILD_INV_DIR = "/tmp/spg/ansible/inventories/generic-default"


SPG_ENVIRONMENT_CODE = "perf"
SPG_ENVIRONMENT_CN = "perf.delius.probation.hmpps.dsd.io"


SPG_GATEWAY_MQ_URL="tcp://localhost:61616"
SPG_DELIUS_MQ_URL ="tcp://delius-jms.perf.delius.probation.hmpps.dsd.io:61617"

SPG_DOCUMENT_REST_SERVICE_ADMIN_URL  ="https://alfresco.perf.delius.probation.hmpps.dsd.io/alfresco/service/admin-spg"
SPG_DOCUMENT_REST_SERVICE_PUBLIC_URL  ="https://alfresco.perf.delius.probation.hmpps.dsd.io/alfresco/service/noms-spg"

//USING LOCALHOST FOR FQDNs UNTIL CERTS IN PLACE

//SPG_ISO_FQDN  = "spgw-ext.perf.delius.probation.hmpps.dsd.io"
//SPG_MPX_FQDN  = "spgw-mpx-int.perf.delius.probation.hmpps.dsd.io"
//SPG_CRC_FQDN  = "spgw-crc-int.perf.delius.probation.hmpps.dsd.io"

SPG_ISO_FQDN  = "localhost"
SPG_MPX_FQDN  = "localhost"
SPG_CRC_FQDN  = "localhost"