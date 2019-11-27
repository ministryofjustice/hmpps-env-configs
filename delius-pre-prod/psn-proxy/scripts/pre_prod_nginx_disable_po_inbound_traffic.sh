#!/usr/bin/env bash
mv /etc/nginx/conf.d/spg-proxy-preprod-ext.conf /etc/nginx/conf.d/spg-proxy-preprod-ext.disabled
systemctl restart nginx