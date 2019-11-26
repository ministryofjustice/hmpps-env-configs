#!/usr/bin/env bash
echo "shows spg iso wsdl as seen by POs hosted in UKCLOUD"
echo "NOTE for some reason this doesn't work (--resolve is experimental), regardless of whether int-psn or ext-psn keys are used"
echo "however the ext proxies verify a certificate depth of 2 whilst the int ones don't(!)"
curl --key /etc/pki/tls/private/spgw-ext-psn.pre-prod.probation.service.justice.gov.uk.key \
     --cert /etc/pki/tls/certs/spgw-ext-psn.pre-prod.probation.service.justice.gov.uk.public-certificate.pem \
     --cacert /etc/pki/tls/certs/privateca.pre-prod.probation.service.justice.gov.uk.public-certificate.pem \
     https://spgw-ext-psn.pre-prod.probation.service.justice.gov.uk:9001/cxf/InboundSPGProxy/1.2?wsdl -v