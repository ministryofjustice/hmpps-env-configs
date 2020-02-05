#!/usr/bin/env bash
#this script requires that the user has appropriate ssh config and bastion-prod access
chmod u+x *.sh
scp *.sh ec2-user@hmpps-delius-psn-test-a:/opt/hmpps/proxy-scripts/
scp *.sh ec2-user@hmpps-delius-psn-test-b:/opt/hmpps/proxy-scripts/

scp ../etc/letsencrypt/renewal/stage.psn.probation.service.justice.gov.uk.conf ec2-user@hmpps-delius-psn-test-a:/etc/letsencrypt/renewal/stage.psn.probation.service.justice.gov.uk.conf
scp ../etc/letsencrypt/renewal/stage.psn.probation.service.justice.gov.uk.conf ec2-user@hmpps-delius-psn-test-b:/etc/letsencrypt/renewal/stage.psn.probation.service.justice.gov.uk.conf
