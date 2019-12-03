#!/usr/bin/env bash
#this script requires that the user has appropriate ssh config and bastion-prod access
chmod u+x *.sh
scp *.sh ec2-user@hmpps-delius-psn-test-a:/opt/hmpps/proxy-scripts/
scp *.sh ec2-user@hmpps-delius-psn-test-b:/opt/hmpps/proxy-scripts/