PO_SPG_CONFIGURATION = {

  PO_ACTIVE_CONNECTIONS = "PFA,PFB,STC,MTC,POSTUB"
  SPG_CERTIFICATE_BUCKET = "tf-eu-west-2-hmpps-eng-dev-certificates-private-s3bucket"
  SPG_CERTIFICATE_PATH = "/unclassified-data/hmpps-delius-po-test1/current/"

  PO_POSTUB_NAME = "PO STUB"
  PO_POSTUB_TLS_COMMON_NAME = "{{ lookup('env','SPG_CRC_FQDN') }}"
  PO_POSTUB_SIGNING_COMMON_NAME = "signing.{{ lookup('env','SPG_CRC_FQDN') }}"
  PO_POSTUB_CRC_LIST = "C00,C01,C15,C22,C23"
  PO_POSTUB_ENDPOINT_URL = "https://{{ lookup('env','SPG_CRC_FQDN') }}:9001/cxf/CRC-100"

  POSTUB_CRC_SCHEMA_0_9_10 = "C01"
  POSTUB_CRC_SCHEMA_0_9_13 = "C00,C15,C22,C23"

#original ifsr1 endpoints
//  PO_PFA_IFSR1_NAME = "PURPLE FUTURES A"
//  PO_PFA_IFSR1_TLS_COMMON_NAME = "shard.evp.meganexus.com"
//  PO_PFA_IFSR1_SIGNING_COMMON_NAME = "shard.evp.meganexus.com"
//  PO_PFA_IFSR1_CRC_LIST = "C06,C07"
//  PO_PFA_IFSR1_ENDPOINT_URL = "https://shard.evp.meganexus.com:9001/cxf/CRC-100"
//
//
//  PO_PFB_IFSR1_NAME = "PURPLE FUTURES B"
//  PO_PFB_IFSR1_TLS_COMMON_NAME = "shard2.evp.meganexus.com"
//  PO_PFB_IFSR1_SIGNING_COMMON_NAME = "shard2.evp.meganexus.com"
//  PO_PFB_IFSR1_ENDPOINT_URL = "https://shard2.evp.meganexus.com:9001/cxf/CRC-100"
//  PO_PFB_IFSR1_CRC_LIST = "C04,C05,C20"


  PO_PFA_NAME = "PURPLE FUTURES A"
  PO_PFA_TLS_COMMON_NAME = "shard61.poc.meganexus.com"
  PO_PFA_SIGNING_COMMON_NAME = "shard61.poc.meganexus.com"
  PO_PFA_CRC_LIST = "C06,C07"
  PO_PFA_ENDPOINT_URL = "https://shard61.poc.meganexus.com:9001/cxf/CRC-100"


  #uses same cert for signing as tls in IFSR3 env
  PO_PFB_NAME = "PURPLE FUTURES B"
  PO_PFB_TLS_COMMON_NAME = "shard62.poc.meganexus.com"
  PO_PFB_SIGNING_COMMON_NAME = "shard62.poc.meganexus.com"
  PO_PFB_ENDPOINT_URL = "https://shard62.poc.meganexus.com:9001/cxf/CRC-101"
  PO_PFB_CRC_LIST = "C04,C05,C20"

  #uses same cert for signing as tls in IFSR3 env
  PO_STC_NAME = "SEETEC"

#

  PO_STC_TLS_COMMON_NAME = "integration-testing-spg420.seetec.co.uk"
  PO_STC_SIGNING_COMMON_NAME = "integration-testing-spg420.seetec.co.uk"
  PO_STC_ENDPOINT_URL = "https://integration-testing-spg420.seetec.co.uk:9001/NOMSInbound.svc"
  PO_STC_CRC_LIST = "C21"

  PO_MTC_NAME = "MTC"
  PO_MTC_TLS_COMMON_NAME = "spg-ifsr3.omnia.mtcnovo.net"
  PO_MTC_SIGNING_COMMON_NAME = "spg-iso-ifsr3.omnia.mtcnovo.net"
  PO_MTC_ENDPOINT_URL = "https://spg-ifsr3.omnia.mtcnovo.net:9001/CRC/CRCendpoint"
  PO_MTC_CRC_LIST = "C16,C17"

  # The list of CRCs who should NOT receive MetaDtaaUpdate messages (includes PF and MTC)
  SPG_DISABLED_META_LIST = "C03,C04,C05,C06,C07,C15,C16,C17,C19,C20"

}


PO_SPG_FIREWALL_INGRESS_PORT = "9001" #9001 = switched on, 9999 = switched off

PO_SPG_FIREWALL_INGRESS_RULES = {

  DIGITAL_STUDIO_VPN = "81.134.202.29/32"
  DIGITAL_STUDIO_SHEFFIELD = "217.33.148.210/32"

  #POSTUB="derived from vpc x 3 NAT"
  #PSNPROXY = "N/A for this environment"

  #IFSR1 ips retained for reference
# PURPLE_FUTURES_IFSR1_A_ENV = "51.179.210.37/32"
# PURPLE_FUTURES_IFSR1_B_ENV = "51.179.210.36/32"
# PURPLE_FUTURES_IFSR1_OTHER_ENV ="51.179.210.35/32"

#  PURPLE_FUTURES_A_ENV_NGINX = "83.151.209.178/32" no longer used
  PURPLE_FUTURES_A_ENV_APP_SERVER = "51.141.234.180/32"
  PURPLE_FUTURES_B_ENV_APP_SERVER = "52.151.72.196/32"


//  PURPLE_FUTURES_B_ENV_NGINX = "83.151.209.179/32" removed 25/11/2019 by request of perry sutherland https://mojdt.slack.com/archives/GNPCZF3J5/p1574691479052800


  SEETEC="195.152.51.64/27"

  MTC_1="52.56.81.199/32"
  MTC_2="52.56.196.202/32"
}