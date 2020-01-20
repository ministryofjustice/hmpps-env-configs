#!/usr/bin/env bash
mv /etc/nginx/conf.d/spg-proxy-stage-ext.disabled /etc/nginx/conf.d/spg-proxy-stage-ext.conf
systemctl restart nginx