PO_SPG_CONFIGURATION = {

  PO_ACTIVE_CONNECTIONS = "PFA,PFB,STC,MTC,POSTUB"

  SPG_CERTIFICATE_PATH = "/unclassified-data/hmpps-delius-po-test1/current/"

  PO_POSTUB_NAME = "PO STUB"
  PO_POSTUB_TLS_COMMON_NAME = "{{ lookup('env','SPG_CRC_FQDN') }}"
  PO_POSTUB_SIGNING_COMMON_NAME = "signing.{{ lookup('env','SPG_CRC_FQDN') }}"
  PO_POSTUB_CRC_LIST = "C00,C01,C15,C22,C23"
  PO_POSTUB_ENDPOINT_URL = "https://{{ lookup('env','SPG_CRC_FQDN') }}:9001/cxf/CRC-100"

  POSTUB_CRC_SCHEMA_0_9_10 = "C01"
  POSTUB_CRC_SCHEMA_0_9_13 = "C00,C15,C22,C23"


  PO_PFA_NAME = "PURPLE FUTURES A"
  PO_PFA_TLS_COMMON_NAME = "shard.evp.meganexus.com"
  PO_PFA_SIGNING_COMMON_NAME = "shard.evp.meganexus.com"
  PO_PFA_CRC_LIST = "C06,C07"
  PO_PFA_ENDPOINT_URL = "https://shard.evp.meganexus.comxxx:9001/cxf/CRC-100"


  #uses same cert for signing as tls in IFSR3 env
  PO_PFB_NAME = "PURPLE FUTURES B"
  PO_PFB_TLS_COMMON_NAME = "shard2.evp.meganexus.com"
  PO_PFB_SIGNING_COMMON_NAME = "shard2.evp.meganexus.com"
  PO_PFB_ENDPOINT_URL = "https://shard2.evp.meganexus.comxxx:9001/cxf/CRC-100"
  PO_PFB_CRC_LIST = "C04,C05,C20"

}


PO_SPG_FIREWALL_INGRESS_PORT = "9999" #9001 = switched on, 9999 = switched off

PO_SPG_FIREWALL_INGRESS_RULES = {

  DIGITAL_STUDIO_VPN = "81.134.202.29/32"
  DIGITAL_STUDIO_SHEFFIELD = "217.33.148.210/32"

  #POSTUB="derived from vpc x 3 NAT"
  #PSNPROXY = "N/A for this environment"

  PURPLE_FUTURES_A_ENV = "51.179.210.37/32"
  PURPLE_FUTURES_B_ENV = "51.179.210.36/32"
  PURPLE_FUTURES_OTHER_ENV ="51.179.210.35/32"


}
