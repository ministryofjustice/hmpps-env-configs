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


#SPG Partner Gateway
#Note we will be moving the ActiveMQ Broker away from servicemix and its own dedicated servers/service (AmazonMQ)

spg_partnergateway_domain_ports = {
  mutual_tls        = "9001"  # from POs unless TLS is terminated by NGINX
  internal_soap     = "8989"  # used between spg.iso and spg.mpx when they were separate modules. deprecated.
  http              = "8181"  # used from tls terminating loadbalancer, and devops ssh tunnelling
  jms_broker        = "61616" # used by SPG, ND and Alfresco consumers to push/pull JMS messages to spg.servicemix.ActiveMQ Broker
  jms_broker_ssl    = "61616" # SSL version of the above

  amq_web_console   = "8161"  # unsecured default port for activemq web console - not implemented
  amq_web_console_ssl = "8443"  # secured default port for activemq web console - not implemented
  https             = "443"   # not yet implemented, would be used for devops non tunnelled console admin (ie hawtio)
}


#TODO: allow JMX ports for weblogic domains from bastion or admin


#SPG has activeMQ running incomming
#database talks to activemq on spg weblogic domain
#spg talks to spg-weblogic-domain over activemq
#  # engineering
# dependencies_bucket_arn = "arn:aws:s3:::tf-eu-west-2-hmpps-eng-dev-artefacts-s3bucket"

# dev
dependencies_bucket_arn = "arn:aws:s3:::tf-eu-west-2-hmpps-eng-dev-delius-core-dependencies-s3bucket"
