#!/usr/bin/env bash
mv /etc/nginx/conf.d/spg-proxy-stage-ext.disabled /etc/nginx/conf.d/spg-proxy-stage-ext.conf
mv /etc/nginx/conf.d/spg-proxy-stage-int.disabled /etc/nginx/conf.d/spg-proxy-stage-int.conf

systemctl restart nginx