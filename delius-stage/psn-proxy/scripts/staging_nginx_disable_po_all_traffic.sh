#!/usr/bin/env bash
mv /etc/nginx/conf.d/spg-proxy-staging-ext.conf /etc/nginx/conf.d/spg-proxy-staging-ext.disabled
mv /etc/nginx/conf.d/spg-proxy-staging-int.conf /etc/nginx/conf.d/spg-proxy-staging-int.disabled

systemctl restart nginx