#!/usr/bin/env bash
#this script requires that the user has appropriate ssh config and bastion-prod access
chmod u+x *.sh

# nginx config scripts for stage (untested)
scp - r ../../  ec2-user@hmpps-delius-psn-test-a:/opt/hmpps/

echo "log onto server and as root, copy the config directory into /etc/nginx/"

echo "reload nginx configs & confirm service is operational with..."

echo "systemnctl reload nginx && systemnctl status nginx"
