#!/usr/bin/env bash
#this script requires that the user has appropriate ssh config and bastion-prod access
chmod u+x *.sh
scp *.sh ec2-user@hmpps-delius-psn-test-a:/opt/hmpps/proxy-scripts/
scp *.sh ec2-user@hmpps-delius-psn-test-b:/opt/hmpps/proxy-scripts/

# nginx config scripts for stage
scp ../im-proxy-stage.conf ec2-user@hmpps-delius-psn-test-a:/opt/hmpps/proxy-scripts/im-proxy-stage.conf
scp ../im-proxy-stage.conf ec2-user@hmpps-delius-psn-test-b:/opt/hmpps/proxy-scripts/im-proxy-stage.conf

scp ../spg-proxy-stage-ext.conf ec2-user@hmpps-delius-psn-test-a:/opt/hmpps/proxy-scripts/spg-proxy-stage-ext.conf
scp ../spg-proxy-stage-ext.conf ec2-user@hmpps-delius-psn-test-b:/opt/hmpps/proxy-scripts/spg-proxy-stage-ext.conf

scp ../spg-proxy-stage-int.conf ec2-user@hmpps-delius-psn-test-a:/opt/hmpps/proxy-scripts/spg-proxy-stage-int.conf
scp ../spg-proxy-stage-int.conf ec2-user@hmpps-delius-psn-test-b:/opt/hmpps/proxy-scripts/spg-proxy-stage-int.conf

# LetsEncrypt configuration for *.stage.psn.probation.service.justice.gov.uk
scp ../etc/letsencrypt/renewal/stage.psn.probation.service.justice.gov.uk.conf ec2-user@hmpps-delius-psn-test-a:/etc/letsencrypt/renewal/stage.psn.probation.service.justice.gov.uk.conf
scp ../etc/letsencrypt/renewal/stage.psn.probation.service.justice.gov.uk.conf ec2-user@hmpps-delius-psn-test-b:/etc/letsencrypt/renewal/stage.psn.probation.service.justice.gov.uk.conf

#reload nginx configs & confirm service reloaded configs ok
systemnctl reload nginx
systemnctl status nginx
