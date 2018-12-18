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

alfresco_app_name = "alfresco"

spg_app_name = "spg"


## Delius Core
weblogic_domain_ports = {
  ndelius_admin       = "7001"
  ndelius_managed     = "7001"
  interface_admin     = "7001"
  interface_managed   = "7001" #TODO: check port for api calls
  spg_admin           = "7001"
  spg_jms_broker      = "61616"
  spg_jms_broker_ssl  = "61617"
}

ldap_ports = {
  ldap      = "10389"
  ldap_tls  = "10636"
}

#SPG Partner Gateway
#Note we will be moving the ActiveMQ Broker away from servicemix and its own dedicated servers/service (AmazonMQ)

spg_partnergateway_domain_ports = {
  mutual_tls        = "9001"  # from POs unless TLS is terminated by NGINX
  internal_soap     = "8989"  # used between spg.iso and spg.mpx when they were separate modules. deprecated.
  http              = "8181"  # used from tls terminating loadbalancer, and devops ssh tunnelling
  jms_broker        = "61616" # used by SPG, ND and Alfresco consumers to push/pull JMS messages to spg.servicemix.ActiveMQ Broker
  jms_broker_ssl    = "61617" # SSL version of the above

  amq_web_console   = "8161"  # unsecured default port for activemq web console - not implemented
  amq_web_console_ssl = "8443"  # secured default port for activemq web console - not implemented
  https             = "443"   # not yet implemented, would be used for devops non tunnelled console admin (ie hawtio)
}


#TODO: allow JMX ports for weblogic domains from bastion or admin

# public / user access
user_access_cidr_blocks = [
  "81.134.202.29/32",   #Moj VPN
  "217.33.148.210/32",  #Digital studio
  "35.176.14.16/32",    #Engineering Jenkins non prod AZ 1
  "35.177.83.160/32",   #Engineering Jenkins non prod AZ 2
  "18.130.108.149/32",  #Engineering Jenkins non prod AZ 3
  "3.8.97.195/32",      #Engineering Jenkins Windows Slave   
  "18.130.186.182/32",  #TEST  test-test-windows-injector-0
  "35.178.200.180/32",  #TEST  test-test-windows-injector-1
  "35.176.195.86/32",   #TEST  test-test-windows-loadrunner
  "51.148.144.179/32",  #Brett's Office IP
]

# jenkins access
jenkins_access_cidr_blocks = [
  "35.176.14.16/32",    #Engineering Jenkins non prod AZ 1
  "35.177.83.160/32",   #Engineering Jenkins non prod AZ 2
  "18.130.108.149/32",  #Engineering Jenkins non prod AZ 3
]


#SPG has activeMQ running incomming
#database talks to activemq on spg weblogic domain
#spg talks to spg-weblogic-domain over activemq
#  # engineering
# dependencies_bucket_arn = "arn:aws:s3:::tf-eu-west-2-hmpps-eng-dev-artefacts-s3bucket"

# dev
dependencies_bucket_arn = "arn:aws:s3:::tf-eu-west-2-hmpps-eng-dev-delius-core-dependencies-s3bucket"
