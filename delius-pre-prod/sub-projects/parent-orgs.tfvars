// Used to generate ECS Launch Template for SPG environment vars

PO_SPG_CONFIGURATION = {


  SPG_CERTIFICATE_BUCKET = "tf-eu-west-2-hmpps-eng-dev-certificates-private-s3bucket"
  SPG_CERTIFICATE_PATH = "/official-data/hmpps-delius-pre-prod/current/"



  SPG_PUBLISHED_FQDN_PSNPROXY_INT  = "spgw-int-psn.pre-prod.probation.service.justice.gov.uk"
  SPG_PUBLISHED_FQDN_PSNPROXY_EXT  = "spgw-ext-psn.pre-prod.probation.service.justice.gov.uk"
  SPG_PUBLISHED_FQDN_NOPROXY       = "${SPG_ISO_FQDN}"




  PO_ACTIVE_CONNECTIONS = "STC,MTC,POSTUB"
  #PO_XXX_CALLING_VIA_PROXY_URL_REWRITE#  null, "" or "replace_string|replace_with" eg "spgw-ext.pre-prod.probation|spgw-int-psn.probation" (needed so that UD proxy can rewrite urls provided for oAuth signature cert validation)

  #THERE IS NO C00 in ND prod yet, nor an assigned crc for testing
  POSTUB_CRC_SCHEMA_0_9_13 = "C00,C04,C06,C07,C20"

  PO_POSTUB_NAME = "PO STUB"
  PO_POSTUB_CRC_LIST = "C00,C04,C06,C07,C20" # PF only have C05 active in PPL

  PO_POSTUB_CALLING_VIA_PROXY_URL_REWRITE = "spgw-ext.pre-prod.probation,spgw-int-psn.pre-prod.probation"
  PO_POSTUB_TLS_COMMON_NAME = "{{ lookup('env','SPG_CRC_FQDN') }}"
  PO_POSTUB_SIGNING_COMMON_NAME = "signing.{{ lookup('env','SPG_CRC_FQDN') }}"
  PO_POSTUB_ENDPOINT_URL = "https://spgw-int-psn.pre-prod.probation.service.justice.gov.uk:9001/POSTUB/cxf/CRC-100"
  PO_POSTUB_PROXIED_URL = "https://spgw-crc-ext.pre-prod.probation.service.justice.gov.uk:9001/cxf/CRC-100"

  PO_STC_NAME = "SEETEC"
  PO_STC_CRC_LIST = "C21"
  PO_STC_CALLING_VIA_PROXY_URL_REWRITE = "spgw-ext.pre-prod.probation,spgw-ext-psn.pre-prod.probation"
  PO_STC_TLS_COMMON_NAME = "prep2.ksscrc.org.uk"
  PO_STC_SIGNING_COMMON_NAME = "signing.prep2.ksscrc.org.uk"
  PO_STC_ENDPOINT_URL = "https://spgw-int-psn.pre-prod.probation.service.justice.gov.uk:9001/STC/nomsinbound.svc"
  PO_STC_PROXIED_URL = "https://prep2.ksscrc.org.uk:9001/nomsinbound.svc"

  PO_MTC_NAME = "MTC"
  PO_MTC_CRC_LIST = "C16,C17"
  PO_MTC_CALLING_VIA_PROXY_URL_REWRITE = "spgw-ext.pre-prod.probation,spgw-ext-psn.pre-prod.probation"
  PO_MTC_TLS_COMMON_NAME = "spg-psnppl.omnia.mtcnovo.net"
  PO_MTC_SIGNING_COMMON_NAME = "spg-iso-psnppl.omnia.mtcnovo.net"
  PO_MTC_ENDPOINT_URL = "https://spgw-int-psn.pre-prod.probation.service.justice.gov.uk:9001/MTC/CRC/CRCendpoint"
  PO_MTC_PROXIED_URL = "https://spg-psnppl.omnia.mtcnovo.net:9001/CRC/CRCendpoint"
}


//firewall rules for parent_orgs

PO_SPG_FIREWALL_INGRESS_PORT = "9001" #9001 = switched on, 9999 = switched off

PO_SPG_FIREWALL_INGRESS_RULES = {

  DIGITAL_STUDIO_VPN = "81.134.202.29/32"
  DIGITAL_STUDIO_SHEFFIELD = "217.33.148.210/32"

  #POSTUB="no longer derived from vpc x 3 NAT as part of LB terraform as now external facing"

  PSNPROXY_A = "3.10.56.113/32"
  PSNPROXY_B = "35.178.173.171/32"


}

//IPs POs speak to
psn_facing_ips = [
  "51.231.83.120",
  "51.231.83.104"
]

//POs come in from proxy here

internet_facing_ips = [
  "3.10.56.113",
  "35.178.173.171"
]
