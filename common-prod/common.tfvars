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
eng_remote_state_bucket_name = "tf-eu-west-2-hmpps-eng-prod-remote-state"

bastion_remote_state_bucket_name = "tf-eu-west-2-hmpps-bastion-prod-remote-state"

eng_role_arn = "arn:aws:iam::077643444046:role/terraform"

bastion_role_arn = "arn:aws:iam::077643444046:role/terraform"

alfresco_app_name = "alfresco"

spg_app_name = "spg"


## Delius Core
weblogic_domain_ports = {
  weblogic_port       = "7001"
  weblogic_tls_port   = "7002"
  activemq_port       = "61617"
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
  mutual_tls          = "9001"  # from POs unless TLS is terminated by NGINX
  internal_soap       = "8989"  # used between spg.iso and spg.mpx when they were separate modules. deprecated.
  http                = "8181"  # used from tls terminating loadbalancer, and devops ssh tunnelling
  jms_broker          = "61616" # used by SPG, ND and Alfresco consumers to push/pull JMS messages to spg.servicemix.ActiveMQ Broker
  jms_broker_ssl      = "61617" # SSL version of the above

  amq_web_console     = "8161"  # unsecured default port for activemq web console - not implemented
  amq_web_console_ssl = "8443"  # secured default port for activemq web console - not implemented
  https               = "443"   # not yet implemented, would be used for devops non tunnelled console admin (ie hawtio)
}


#TODO: allow JMX ports for weblogic domains from bastion or admin

# public / user access
user_access_cidr_blocks = [
  "81.134.202.29/32",   #Moj VPN
  "217.33.148.210/32",  #Digital studio
  "35.176.14.16/32",    #Engineering Jenkins non prod AZ 1
  "35.177.83.160/32",   #Engineering Jenkins non prod AZ 2
  "18.130.108.149/32",  #Engineering Jenkins non prod AZ 3
  "18.130.105.155/32",  #Engineering Jenkins prod AZ 1
  "18.130.54.20/32",    #Engineering Jenkins prod AZ 2
  "18.130.87.166/32" ,  #Engineering Jenkins prod AZ 3
  "51.148.144.179/32",  #Brett's Office IP
  "194.75.210.208/28",  #BCL
  "213.48.246.99/32",   #BCL
]

# jenkins access
jenkins_access_cidr_blocks = [
  "35.176.14.16/32",    #Engineering Jenkins non prod AZ 1
  "35.177.83.160/32",   #Engineering Jenkins non prod AZ 2
  "18.130.108.149/32",  #Engineering Jenkins non prod AZ 3
  "18.130.105.155/32",  #Engineering Jenkins prod AZ 1
  "18.130.54.20/32",    #Engineering Jenkins prod AZ 2
  "18.130.87.166/32" ,  #Engineering Jenkins prod AZ 3

]


#SPG has activeMQ running incomming
#database talks to activemq on spg weblogic domain
#spg talks to spg-weblogic-domain over activemq
#  # engineering
# dependencies_bucket_arn = "arn:aws:s3:::tf-eu-west-2-hmpps-eng-dev-artefacts-s3bucket"

# dev
dependencies_bucket_arn = "arn:aws:s3:::tf-eu-west-2-hmpps-eng-prod-delius-core-dependencies-s3bucket"

## These are the reference maps for the database sizes
## copy block into the appropriate env config file and rename

database_size_small = {
  database_size  = "small"
  instance_type  = "t3.large"
  disk_iops      = 1000
  disks_quantity = 2  # Do not decrease this
  disk_size      = 100 # Do not decrease this
  # total_storage  = 200 # This should equal disks_quantity x disk_size
}

database_size_medium = {
  database_size  = "medium"
  instance_type  = "r5.xlarge"
  disk_iops      = 1000
  disks_quantity = 2  # Do not decrease this
  disk_size      = 500 # Do not decrease this
  # total_storage  = 1000 # This should equal disks_quantity x disk_size
}

database_size_large = {
  database_size  = "large"
  instance_type  = "r5.2xlarge"
  disk_iops      = 1000
  disks_quantity = 8  # Do not decrease this
  disk_size      = 1000 # Do not decrease this
  # total_storage  = 8000 # This should equal disks_quantity x disk_size
}

database_size_x_large = {
  database_size  = "x_large"
  instance_type  = "r5.4xlarge"
  disk_iops      = 1000
  disks_quantity = 16  # Do not decrease this
  disk_size      = 1000 # Do not decrease this
  # total_storage  = 16000 # This should equal disks_quantity x disk_size
}
