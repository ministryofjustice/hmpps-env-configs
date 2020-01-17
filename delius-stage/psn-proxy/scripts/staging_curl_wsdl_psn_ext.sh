#!/usr/bin/env bash
echo "shows spg iso wsdl as seen by POs hosted in UKCLOUD"
echo "NOTE for some reason this doesn't work (--resolve is experimental), regardless of whether int-psn or ext-psn keys are used"
echo "however the ext proxies verify a certificate depth of 2 whilst the int ones don't(!)"
curl    --key /etc/pki/tls/private/spgw-int-psn.stage.probation.service.justice.gov.uk.key \
        --cert /etc/pki/tls/certs/spgw-int-psn.stage.probation.service.justice.gov.uk.public-certificate.pem \
        --cacert /etc/pki/tls/certs/privateca.probation.service.justice.gov.uk.public-certificate.pem \
        --resolve spgw-ext-psn.stage.probation.service.justice.gov.uk:9001:spgw-ext-psn.stage.probation.service.justice.gov.uk \
        https://spgw-ext-psn.stage.probation.service.justice.gov.uk:9001/cxf/InboundSPGProxy/1.2?wsdl -v