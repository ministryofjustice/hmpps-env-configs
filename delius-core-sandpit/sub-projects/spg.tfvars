# This is used for ALB logs to S3 bucket.
# This is fixed for each region. if region changes, this changes
lb_account_id = "652711504416"

# VPC variables
cloudwatch_log_retention = 14

# ROUTE53 ZONE probation.hmpps.dsd.io
route53_hosted_zone_id = "Z3VDCLGXC4HLOW"

# ENVIRONMENT REMOTE STATES
eng-remote_state_bucket_name = "tf-eu-west-2-hmpps-eng-dev-remote-state"

# ENVIRONMENT ROLE ARNS
eng_role_arn = "arn:aws:iam::895523100917:role/terraform"

eng_root_arn = "arn:aws:iam::895523100917:root"

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

s3_bucket_config = "tf-eu-west-2-hmpps-delius-core-sandpit-spgw-s3bucket"
spg_build_inv_dir = "/tmp/ansible/inventories/hmpps/non-prod/sandpit"




# Self Signed Certs
self_signed_ca_algorithm = "RSA"

self_signed_ca_rsa_bits = "4096"

self_signed_ca_validity_period_hours = 8760

#672 = 28 days
self_signed_ca_early_renewal_hours = 672

self_signed_server_algorithm = "RSA"

self_signed_server_rsa_bits = "4096"

#8760=365 days
self_signed_server_validity_period_hours = 8760


#336 = 14 days
self_signed_server_early_renewal_hours = 336



SPG_GATEWAY_MQ_URL="tcp://localhost:61616"
SPG_DELIUS_MQ_URL ="tcp://spg-internal.sandpit.delius-core.probation.hmpps.dsd.io"

SPG_DOCUMENT_REST_SERVICE_ADMIN_URL  ="https://alfresco.sandpit.delius-core.probation.hmpps.dsd.io/alfresco/service/admin-spg"
SPG_DOCUMENT_REST_SERVICE_PUBLIC_URL  ="https://alfresco.sandpit.delius-core.probation.hmpps.dsd.io/alfresco/service/noms-spg"

SPG_ISO_FQDN  = "spgw-ext.sandpit.delius-core.probation.hmpps.dsd.io"
SPG_MPX_FQDN  = "spgw-crc-int.sandpit.delius-core.probation.hmpps.dsd.io"
SPG_CRC_FQDN  = "spgw-mpx-int.sandpit.delius-core.probation.hmpps.dsd.io"



}
