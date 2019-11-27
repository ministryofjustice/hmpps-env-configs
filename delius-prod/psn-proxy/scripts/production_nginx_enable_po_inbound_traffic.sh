#!/usr/bin/env bash
mv /etc/nginx/conf.d/spg-proxy-production-ext.disabled /etc/nginx/conf.d/spg-proxy-production-ext.conf
systemctl restart nginx