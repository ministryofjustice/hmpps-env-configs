#!/usr/bin/env bash
mv /etc/nginx/conf.d/spg-proxy-production-ext.disabled /etc/nginx/conf.d/spg-proxy-production-ext.conf
mv /etc/nginx/conf.d/spg-proxy-production-int.disabled /etc/nginx/conf.d/spg-proxy-production-int.conf

systemctl restart nginx