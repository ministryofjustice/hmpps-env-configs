#!!!!! SHOULD THESE ALL BE COMMON VARS?????
#
# VPC variables
cloudwatch_log_retention = 14
#
# ROUTE53 ZONE probation.hmpps.dsd.io
route53_hosted_zone_id = "Z3VDCLGXC4HLOW"
#
# ENVIRONMENT REMOTE STATES
eng-remote_state_bucket_name = "tf-eu-west-2-hmpps-eng-dev-remote-state"
#
# ENVIRONMENT ROLE ARNS
eng_role_arn = "${TERRAGRUNT_IAM_ROLE}"
#eng_role_arn N/A as specified in delius-test.properties/TERRAGRUNT_IAM_ROLE
eng_root_arn = "arn:aws:iam::895523100917:root"
#
#
# ALLOWED CIDRS
allowed_cidr_block = [
  "51.148.142.120/32",  #Brett Home
  "109.148.137.148/32", #Don Home
  "81.134.202.29/32",   #Moj VPN
  "217.33.148.210/32",  #Digital studio
  "35.176.14.16/32",    #Engineering Jenkins non prod AZ 1
  "35.177.83.160/32",   #Engineering Jenkins non prod AZ 2
  "18.130.108.149/32",  #Engineering Jenkins non prod AZ 3
]
#
# ASG Configuration
az_asg_desired = {
  az1 = "1"
#
  az2 = "0"
#
  az3 = "0"
}
#
az_asg_max = {
  az1 = "2"
#
  az2 = "0"
#
  az3 = "0"
}
#
az_asg_min = {
  az1 = "1"
#
  az2 = "0"
#
  az3 = "0"
}
#
asg_instance_type = "t2.medium"
#
spg_app_name = "spgw"

s3_bucket_config = "tf-eu-west-2-hmpps-delius-test-spgw-s3bucket"
spg_build_inv_dir = "/tmp/ansible/inventories/hmpps/non-prod/test"