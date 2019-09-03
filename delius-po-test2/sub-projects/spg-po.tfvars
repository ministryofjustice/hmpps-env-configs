SPG_POCONFIGURATION = {

  SPG_PO_ACTIVE_CONNECTIONS = "PFA,PFB,STC,MTC"

  SPG_PO_PFA_DNS_COMMON_NAME = "shard61.poc.meganexus.com"
  SPG_PO_PFA_SIGNING_COMMON_NAME = "shard61.poc.meganexus.com"
  SPG_PO_PFA_CRC_LIST = "C06,C07"
  SPG_PO_PFA_ENDPOINT_URL = "https://shard61.poc.meganexus.comxxx:9001/cxf/CRC-101"


  #uses same cert for signing as tls in IFSR3 env
  SPG_PO_PFB_DNS_COMMON_NAME = "shard62.poc.meganexus.com"
  SPG_PO_PFB_SIGNING_COMMON_NAME = "shard62.poc.meganexus.com"
  SPG_PO_PFB_ENDPOINT_URL = "https://shard62.poc.meganexus.comxxx:9001/cxf/CRC-101"
  SPG_PO_PFB_CRC_LIST = "C04,C05,C20"

  #uses same cert for signing as tls in IFSR3 env
  SPG_PO_STC_DNS_COMMON_NAME = "integration-testing-spg420.seetec.co.uk"
  SPG_PO_STC_SIGNING_COMMON_NAME = "integration-testing-spg420.seetec.co.uk"
  SPG_PO_STC_ENDPOINT_URL = "https://integration-testing-spg420.seetec.co.ukxxx:9001/cxf/ExampleSecurityProxyToCRC"
  SPG_PO_STC_CRC_LIST = "C21"

  SPG_PO_MTC_DNS_COMMON_NAME = "spg-iso-ifsr3.omnia.mtcnovo.net"
  SPG_PO_MTC_SIGNING_COMMON_NAME = "signing.spg-iso-ifsr3.omnia.mtcnovo.net"
  SPG_PO_MTC_ENDPOINT_URL = "https://spg-ifsr3.omnia.mtcnovo.netxxx:9001/CRC/CRCendpoint"
  SPG_PO_MTC_CRC_LIST = "C16,C17"
}