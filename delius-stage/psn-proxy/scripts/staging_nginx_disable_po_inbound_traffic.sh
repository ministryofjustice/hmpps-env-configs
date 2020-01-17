#!/usr/bin/env bash
mv /etc/nginx/conf.d/spg-proxy-stage-ext.conf /etc/nginx/conf.d/spg-proxy-stage-ext.disabled
systemctl restart nginx