#!/usr/bin/env bash
echo "shows spg iso wsdl as seen by CRC stub hosted in AWS"
curl --key /etc/pki/tls/private/spgw-int-psn.stage.probation.service.justice.gov.uk.key \
     --cert /etc/pki/tls/certs/spgw-int-psn.stage.probation.service.justice.gov.uk.public-certificate.pem \
     --cacert /etc/pki/tls/certs/privateca.probation.service.justice.gov.uk.public-certificate.pem \
     https://spgw-int-psn.stage.probation.service.justice.gov.uk:9001/cxf/InboundSPGProxy/1.2?wsdl -v