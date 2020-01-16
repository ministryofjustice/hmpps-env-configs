#!/usr/bin/env bash
mv /etc/nginx/conf.d/spg-proxy-staging-ext.disabled /etc/nginx/conf.d/spg-proxy-staging-ext.conf
mv /etc/nginx/conf.d/spg-proxy-staging-int.disabled /etc/nginx/conf.d/spg-proxy-staging-int.conf

systemctl restart nginx