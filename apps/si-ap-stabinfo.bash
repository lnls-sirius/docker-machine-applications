#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-si-ap-stabinfo.py | tee /ioc-logs/sirius-ioc-si-ap-stabinfo.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
