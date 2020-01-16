#!/usr/bin/env bash
mv /etc/nginx/conf.d/spg-proxy-staging-ext.conf /etc/nginx/conf.d/spg-proxy-staging-ext.disabled
systemctl restart nginx