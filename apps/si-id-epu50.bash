#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux):

/usr/local/bin/sirius-ioc-si-id-epu50.py \
| tee /ioc-logs/sirius-ioc-si-id-epu50.log & 

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
