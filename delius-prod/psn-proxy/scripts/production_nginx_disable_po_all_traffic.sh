#!/usr/bin/env bash
mv /etc/nginx/conf.d/spg-proxy-production-ext.conf /etc/nginx/conf.d/spg-proxy-production-ext.disabled
mv /etc/nginx/conf.d/spg-proxy-production-int.conf /etc/nginx/conf.d/spg-proxy-production-int.disabled

systemctl restart nginx