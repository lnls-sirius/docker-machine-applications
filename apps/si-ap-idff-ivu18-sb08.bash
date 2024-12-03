#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-si-ap-idff.py SI-08SB:ID-IVU18 | tee /ioc-logs/sirius-ioc-si-ap-idff-ivu18-sb08.log & # 4.4%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
