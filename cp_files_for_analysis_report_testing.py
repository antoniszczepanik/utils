#!/usr/bin/env python3

import argparse
import os

parser = argparse.ArgumentParser()
parser.add_argument('-vessel_slug', '-vs', help='Enter vessel name eg Balsa')
parser.add_argument('-customer_slug', '-cs', help='Enter customer slug eg klaveness')
parser.add_argument('-dry_run', '-dr', default=False, help='If True adds --dryrun flag')
parser.add_argument('-user', '-u')
args = parser.parse_args()

vessel_slug = args.vessel_slug
customer_slug = args.customer_slug
dryrun = args.dry_run
user = args.user

cmd_1 = f'aws s3 sync s3://greensteam-data-prod/customer_data/ s3://greensteam-data-dev/{user}/customer_data/ --exclude="*" --include="*{vessel_slug}.parquet"'
cmd_2 = f'aws s3 cp s3://greensteam-data-prod/final/{vessel_slug}.parquet s3://greensteam-data-dev/{user}/final/'
cmd_3 = f'aws s3 sync s3://greensteam-prod/data-import/{customer_slug}/advanced/ s3://greensteam-dev/data-import/{customer_slug}/advanced/'

if dryrun:
    os.system(cmd_1 + ' --dryrun')
    os.system(cmd_2 + ' --dryrun')
    os.system(cmd_3 + ' --dryrun')
else:
    os.system(cmd_1)
    os.system(cmd_2)
    os.system(cmd_3)
