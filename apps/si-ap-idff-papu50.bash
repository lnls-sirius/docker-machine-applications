#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-si-ap-idff.py SI-17SA:ID-PAPU50 | tee /ioc-logs/sirius-ioc-si-ap-idff-papu50.log & # 4.4%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
