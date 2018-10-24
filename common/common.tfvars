region = "eu-west-2"

availability_zone = {
  az1 = "eu-west-2a"
  az2 = "eu-west-2b"
  az3 = "eu-west-2c"
}

route53_domain_private = "probation.hmpps.dsd.io"

# ENVIRONMENT REMOTE STATES
eng_remote_state_bucket_name = "tf-eu-west-2-hmpps-eng-dev-remote-state"

bastion_remote_state_bucket_name = "tf-eu-west-2-hmpps-bastion-dev-remote-state"

eng_role_arn = "arn:aws:iam::895523100917:role/terraform"

bastion_role_arn = "arn:aws:iam::895523100917:role/terraform"

alfresco_app_name = "alfresco"

spg_app_name = "spg"


## Delius Core
weblogic_domain_ports = {
  # oid_admin         = "7005" #user admin
  oid_admin         = "10389" #user admin
  oid_admin_tls     = "10636" #user admin
  oid_managed       = "7001" #not used
  oid_ldap          = "3060" #app talking to oid
  ndelius_admin     = "7001"
  ndelius_managed   = "9704"
  interface_admin   = "7001"
  interface_managed = "8080" #TODO: check port for api calls
  spg_admin         = "7001"
  spg_managed       = "8080" #TODO: check port for api calls
}

#TODO: allow JMX ports for weblogic domains from bastion or admin


#SPG has activeMQ running incomming
#database talks to activemq on spg weblogic domain
#spg talks to spg-weblogic-domain over activemq
#  # engineering
# dependencies_bucket_arn = "arn:aws:s3:::tf-eu-west-2-hmpps-eng-dev-artefacts-s3bucket"

# dev
dependencies_bucket_arn = "arn:aws:s3:::tf-eu-west-2-hmpps-eng-dev-delius-core-dependencies-s3bucket"
