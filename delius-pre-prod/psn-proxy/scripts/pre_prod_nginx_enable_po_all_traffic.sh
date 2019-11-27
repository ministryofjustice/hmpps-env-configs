#!/usr/bin/env bash
mv /etc/nginx/conf.d/spg-proxy-preprod-ext.disabled /etc/nginx/conf.d/spg-proxy-preprod-ext.conf
mv /etc/nginx/conf.d/spg-proxy-preprod-int.disabled /etc/nginx/conf.d/spg-proxy-preprod-int.conf

systemctl restart nginx