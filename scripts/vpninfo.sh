#!/usr/bin/env bash

PUBLIC_IP=$(curl -s ifconfig.me)
LOCATION=$(geoiplookup $PUBLIC_IP | cut -b 24-)
echo "Public IP: $PUBLIC_IP ($LOCATION)"
