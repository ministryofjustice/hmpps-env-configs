#!/usr/bin/env bash
echo "shows spg iso wsdl as seen by CRC stub"
curl --key /etc/pki/tls/private/spgw-int-psn.pre-prod.probation.service.justice.gov.uk.key \
     --cert /etc/pki/tls/certs/spgw-int-psn.pre-prod.probation.service.justice.gov.uk.public-certificate.pem \
     --cacert /etc/pki/tls/certs/privateca.pre-prod.probation.service.justice.gov.uk.public-certificate.pem \
     https://spgw-int-psn.pre-prod.probation.service.justice.gov.uk:9001/cxf/InboundSPGProxy/1.2?wsdl -v