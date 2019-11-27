#!/usr/bin/env bash
mv /etc/nginx/conf.d/spg-proxy-preprod-ext.conf /etc/nginx/conf.d/spg-proxy-preprod-ext.disabled
mv /etc/nginx/conf.d/spg-proxy-preprod-int.conf /etc/nginx/conf.d/spg-proxy-preprod-int.disabled

systemctl restart nginx