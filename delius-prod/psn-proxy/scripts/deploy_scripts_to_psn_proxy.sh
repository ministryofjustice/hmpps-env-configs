#!/usr/bin/env bash
#this script requires that the user has appropriate ssh config and bastion-prod access
chmod u+x *.sh

# nginx config & scripts for stage (nginx master parent config, and ca-certs in delius-prod dir)
#
# assumes this kind of ssh config in your hosts file

##### psn nginx SPG / PO / IM proxies
#Host hmpps-delius-psn-test-a psn-test-a
#Hostname 3.10.56.113
#User ec2-user
#IdentityFile ~/.ssh/hmpps-bastion-prod.key
# ProxyCommand ssh -o StrictHostKeyChecking=no -W %h:%p bastion-prod
#
#Host hmpps-delius-psn-test-b psn-test-b
#Hostname 35.178.173.171
#User ec2-user
#IdentityFile ~/.ssh/hmpps-bastion-prod.key
#ProxyCommand ssh -o StrictHostKeyChecking=no -W %h:%p bastion-prod



scp -r ../../psn-proxy/  ec2-user@hmpps-delius-psn-test-a:/opt/hmpps/
scp -r ../../psn-proxy/  ec2-user@hmpps-delius-psn-test-b:/opt/hmpps/

echo "log onto each server and as root, copy the config directory into /etc/nginx/"

echo "/etc/letsencypt used for the im proxies is deprecated, but is in service in stage and prod. The certs are already expired"

echo "reload nginx configs & confirm service is operational with..."

echo "systemnctl reload nginx && systemnctl status nginx"
