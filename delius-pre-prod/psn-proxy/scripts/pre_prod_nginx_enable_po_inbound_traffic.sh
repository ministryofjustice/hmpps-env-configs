#!/usr/bin/env bash
mv /etc/nginx/conf.d/spg-proxy-preprod-ext.disabled /etc/nginx/conf.d/spg-proxy-preprod-ext.conf
systemctl restart nginx