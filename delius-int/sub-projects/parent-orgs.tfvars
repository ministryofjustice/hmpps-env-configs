PO_SPG_CONFIGURATION = {

  PO_ACTIVE_CONNECTIONS  = "STC,MTC,POSTUB"
  SPG_CERTIFICATE_BUCKET = "tf-eu-west-2-hmpps-eng-dev-certificates-private-s3bucket"
  SPG_CERTIFICATE_PATH   = "/unclassified-data/hmpps-delius-int/current/"

  PO_POSTUB_NAME                = "PO STUB"
  PO_POSTUB_TLS_COMMON_NAME     = "{{ lookup('env','SPG_CRC_FQDN') }}"
  PO_POSTUB_SIGNING_COMMON_NAME = "signing.{{ lookup('env','SPG_CRC_FQDN') }}"
  PO_POSTUB_CRC_LIST            = "C00,C01,C15,C22,C23"
  PO_POSTUB_ENDPOINT_URL        = "https://{{ lookup('env','SPG_CRC_FQDN') }}:9001/cxf/CRC-100"

  CRC_SCHEMA_0_9_13 = "C16,C17"
  CRC_SCHEMA_0_9_14 = "C00,C01,C02,C03,C04,C05,C06,C07,C08,C09,C10,C11,C12,C13,C14,C15,C18,C19,C20,C21"

  #uses same cert for signing as tls in IFSR3 env
  PO_STC_NAME                = "SEETEC"
  PO_STC_TLS_COMMON_NAME     = "integration-testing-spg420.seetec.co.uk"
  PO_STC_SIGNING_COMMON_NAME = "integration-testing-spg420.seetec.co.uk"
  PO_STC_ENDPOINT_URL        = "https://integration-testing-spg420.seetec.co.uk:9001/cxf/ExampleSecurityProxyToCRC"
  PO_STC_CRC_LIST            = "C21"

  PO_MTC_NAME                = "MTC"
  PO_MTC_TLS_COMMON_NAME     = "spg-ifsr3.omnia.mtcnovo.net"
  PO_MTC_SIGNING_COMMON_NAME = "spg-iso-ifsr3.omnia.mtcnovo.net"
  PO_MTC_ENDPOINT_URL        = "https://spg-ifsr3.omnia.mtcnovo.net:9001/CRC/CRCendpoint"
  PO_MTC_CRC_LIST            = "C16,C17"

  # The list of CRCs who should NOT receive MetaDataUpdate messages (includes PF and MTC)
  SPG_DISABLED_META_LIST = "C03,C04,C05,C06,C07,C15,C16,C17,C19,C20"

}


PO_SPG_FIREWALL_INGRESS_PORT = "9001" #9001 = switched on, 9999 = switched off

PO_SPG_FIREWALL_INGRESS_RULES = {

  #POSTUB="derived from vpc x 3 NAT"
  #PSNPROXY = "N/A for this environment"

  SEETEC = "195.152.51.64/27"

  MTC_1 = "52.56.81.199/32"
  MTC_2 = "52.56.196.202/32"
}
