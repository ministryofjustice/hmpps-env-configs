// Used to generate ECS Launch Template for SPG environment vars

PO_SPG_CONFIGURATION = {

  #current using proxy address as pattern spg-iso-prod-p01:8181, will become more like egress-prod.psn.probation.service.justice.gov.uk/mtc/


  PO_ACTIVE_CONNECTIONS = "PF,STC,MTC,POSTUB"
  SPG_CERTIFICATE_BUCKET = "tf-eu-west-2-hmpps-eng-dev-certificates-private-s3bucket"
  SPG_CERTIFICATE_PATH = "/official-data/hmpps-delius-pre-prod/current/"

  #THERE IS NO C00 in ND prod yet, nor an assigned crc for testing
  PO_POSTUB_NAME = "PO STUB"
  PO_POSTUB_TLS_COMMON_NAME = "{{ lookup('env','SPG_CRC_FQDN') }}"
  PO_POSTUB_SIGNING_COMMON_NAME = "signing.{{ lookup('env','SPG_CRC_FQDN') }}"
  PO_POSTUB_CRC_LIST = "C00"
  PO_POSTUB_ENDPOINT_URL = "https://preprod-proxy-stub:9001/cxf/CRC-101"
  PO_POSTUB_PROXY_URL = "https://spgw-crc-ext.pre-prod.probation.service.justice.gov.uk:9001/cxf/CRC-101"

  POSTUB_CRC_SCHEMA_0_9_13 = "C00"


  PO_PF_NAME = "PURPLE FUTURES"
  PO_PF_CRC_LIST = "C04,C05,C06,C07,C20"
  PO_PF_TLS_COMMON_NAME = "shard-api-pre.interservefls.gse.gov.uk"
  PO_PF_SIGNING_COMMON_NAME = "signing-shard-api-pre.interservefls.gse.gov.uk"
  PO_PF_ENDPOINT_URL = "https://preprod-proxy-pf:9001/cxf/CRC-101"
  PO_PF_PROXY_URL = "https://shard-api-pre.interservefls.gse.gov.uk:9001/cxf/CRC-101"


  PO_STC_NAME = "SEETEC"
  PO_STC_CRC_LIST = "C21"
  PO_STC_TLS_COMMON_NAME = "prep2.ksscrc.org.uk"
  PO_STC_SIGNING_COMMON_NAME = "signing.prep2.ksscrc.org.uk"
  PO_STC_ENDPOINT_URL = "https://preprod-proxy-stc:8181/nomsinbound.svc"
  PO_STC_PROXY_URL = "https://prep2.ksscrc.org.uk:9001/nomsinbound.svc"

  PO_MTC_NAME = "MTC"
  PO_MTC_CRC_LIST = "C16,C17"
  PO_MTC_TLS_COMMON_NAME = "spg-psnppl.omnia.mtcnovo.net"
  PO_MTC_SIGNING_COMMON_NAME = "spg-iso-psnppl.omnia.mtcnovo.net"
  PO_MTC_ENDPOINT_URL = "https://preprod-proxy-mtc:9001/CRC/CRCendpoint"
  PO_MTC_PROXY_URL = "https://spg-psnppl.omnia.mtcnovo.net:9001/CRC/CRCendpoint"
}


//firewall rules for parent_orgs

PO_SPG_FIREWALL_INGRESS_PORT = "9999" #9001 = switched on, 9999 = switched off

PO_SPG_FIREWALL_INGRESS_RULES = {

  DIGITAL_STUDIO_VPN = "81.134.202.29/32"
  DIGITAL_STUDIO_SHEFFIELD = "217.33.148.210/32"

  #POSTUB="derived from vpc x 3 NAT"

  #PSNPROXY = "Need subnets from lazzurs"



}