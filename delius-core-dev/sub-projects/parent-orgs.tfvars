// Used to generate ECS Launch Template for SPG environment vars

PO_SPG_CONFIGURATION = {


  PO_ACTIVE_CONNECTIONS = "POSTUB"
  SPG_CERTIFICATE_BUCKET = "tf-eu-west-2-hmpps-eng-dev-certificates-private-s3bucket"
  SPG_CERTIFICATE_PATH = "/unclassified-data/hmpps-delius-dev/current/"

  #THERE IS NO C00 in ND prod yet, nor an assigned crc for testing
  PO_POSTUB_NAME = "PO STUB"
  PO_POSTUB_TLS_COMMON_NAME = "{{ lookup('env','SPG_CRC_FQDN') }}"
  PO_POSTUB_SIGNING_COMMON_NAME = "signing.{{ lookup('env','SPG_CRC_FQDN') }}"
  PO_POSTUB_CRC_LIST = "C00,C01,C02,C03,C04,C05,C06,C07,C08,C09,C10,C11,C12,C13,C14,C15,C16,C17,C18,C19,C20,C21"
  PO_POSTUB_ENDPOINT_URL = "https://spgw-crc-ext.dev.probation.service.justice.gov.uk:9001/cxf/CRC-100"
  PO_POSTUB_PROXIED_URL = "n/a"
  CRC_SCHEMA_0_9_13 = "C00,C02,C03,C04,C05,C06,C07,C08,C09,C10,C11,C12,C13,C15,C16,C17,C18,C19,C20,C21"
  CRC_SCHEMA_0_9_14 = "C01,C14"
}



//firewall rules for parent_orgs

PO_SPG_FIREWALL_INGRESS_PORT = "9999" #9001 = switched on, 9999 = switched off

PO_SPG_FIREWALL_INGRESS_RULES = {

  #POSTUB="derived from vpc x 3 NAT"





}