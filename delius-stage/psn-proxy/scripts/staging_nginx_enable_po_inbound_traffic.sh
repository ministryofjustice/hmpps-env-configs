#!/usr/bin/env bash
mv /etc/nginx/conf.d/spg-proxy-staging-ext.disabled /etc/nginx/conf.d/spg-proxy-staging-ext.conf
systemctl restart nginx