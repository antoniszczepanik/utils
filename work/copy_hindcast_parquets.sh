#!/usr/bin/env bash

aws s3 sync s3://greensteam-data-prod/unification/download_depth_data/ s3://greensteam-data-dev/antoni.szczepanik/unification/download_depth_data/ --exclude "*" --include "*JDNPedro*"
aws s3 sync s3://greensteam-data-prod/unification/download_hindcast_data/ s3://greensteam-data-dev/antoni.szczepanik/unification/download_hindcast_data/ --exclude "*" --include "*JDNPedro*"
aws s3 cp s3://greensteam-data-prod/ais/JDNPedroAlvarezCabral.parquet s3://greensteam-data-dev/antoni.szczepanik/ais/JDNPedroAlvarezCabral.parquet

