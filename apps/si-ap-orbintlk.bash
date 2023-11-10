#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-si-ap-orbintlk.py | tee /ioc-logs/sirius-ioc-si-ap-orbintlk.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
