#!/usr/bin/env bash
mv /etc/nginx/conf.d/spg-proxy-stage-ext.conf /etc/nginx/conf.d/spg-proxy-stage-ext.disabled
mv /etc/nginx/conf.d/spg-proxy-stage-int.conf /etc/nginx/conf.d/spg-proxy-stage-int.disabled

systemctl restart nginx