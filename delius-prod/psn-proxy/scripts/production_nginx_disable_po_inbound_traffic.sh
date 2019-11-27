#!/usr/bin/env bash
mv /etc/nginx/conf.d/spg-proxy-production-ext.conf /etc/nginx/conf.d/spg-proxy-production-ext.disabled
systemctl restart nginx