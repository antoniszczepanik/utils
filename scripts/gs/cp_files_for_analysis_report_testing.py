#!/usr/bin/env python3

import argparse
import os

parser = argparse.ArgumentParser()
parser.add_argument('-vessel_slug', '-vs', help='Enter vessel name eg Balsa')
parser.add_argument('-customer_slug', '-cs', help='Enter customer slug eg klaveness')
parser.add_argument('-user', '-u')
parser.add_argument('-force', '-f', action='store_true', help='If the flag exists forcs changes (not a dryrun)')
parser.add_argument('-minio', '-m', action='store_true', help='If true copies data to local "data" folder.')
args = parser.parse_args()

vessel_slug = args.vessel_slug
customer_slug = args.customer_slug
force = args.force
user = args.user
minio = args.minio

print('minio set to:', minio)

s3_cmd_1 = f'aws s3 sync s3://greensteam-data-prod/customer_data/ s3://greensteam-data-dev/{user}/customer_data/ --exclude="*" --include="*{vessel_slug}*"'
s3_cmd_2 = f'aws s3 sync s3://greensteam-data-prod/final/ s3://greensteam-data-dev/{user}/final/ --exclude="*" --include="*{vessel_slug}*"'
s3_cmd_3 = f'aws s3 sync s3://greensteam-prod/data-import/{customer_slug}/advanced/ s3://greensteam-dev/data-import/{customer_slug}/advanced/'
s3_cmd_4 = f'aws s3 sync s3://greensteam-data-prod/fouling_analysis/ s3://greensteam-data-dev/{user}/fouling_analysis/ --exclude="*" --include="*{vessel_slug}*"'
s3_cmd_5 = f'aws s3 sync s3://greensteam-data-prod/unification/ s3://greensteam-data-dev/{user}/unification/ --exclude="*" --include="*{vessel_slug}*"'
s3_cmd_6 = f'aws s3 sync s3://greensteam-models-prod/fouling_analysis/{vessel_slug}/ s3://greensteam-models-dev/{user}/fouling_analysis/{vessel_slug}/'

minio_cmd_1 = f'aws s3 sync s3://greensteam-data-prod/customer_data/ ~/data/greensteam-data/customer_data/ --exclude="*" --include="*{vessel_slug}*"'
minio_cmd_2 = f'aws s3 sync s3://greensteam-data-prod/final/ ~/data/greensteam-data/final/ --exclude="*" --include="*{vessel_slug}*"'
minio_cmd_3 = f'aws s3 sync s3://greensteam-prod/data-import/{customer_slug}/advanced/ ~/data/greensteam/data-import/{customer_slug}/advanced/'
minio_cmd_4 = f'aws s3 sync s3://greensteam-data-prod/fouling_analysis/ ~/data/greensteam-data/fouling_analysis/ --exclude="*" --include="*{vessel_slug}*"'
minio_cmd_5 = f'aws s3 sync s3://greensteam-data-prod/unification/ ~/data/greensteam-data/unification/ --exclude="*" --include="*{vessel_slug}*"'
minio_cmd_6 = f'aws s3 sync s3://greensteam-models-prod/fouling_analysis/{vessel_slug}/ ~/data/greensteam-models/fouling_analysis/{vessel_slug}/'

if minio:
    cmds = [minio_cmd_1, minio_cmd_2, minio_cmd_3, minio_cmd_4, minio_cmd_5, minio_cmd_6]
else:
    cmds = [s3_cmd_1, s3_cmd_2, s3_cmd_3, s3_cmd_4, s3_cmd_5, s3_cmd_6]

for cmd in cmds:
    if force:
        os.system(cmd)
    else:
        os.system(cmd + ' --dryrun')
