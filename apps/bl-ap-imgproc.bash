#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux):

/usr/local/bin/sirius-ioc-bl-ap-imgproc.py --devname CAX:B:BASLER01 \
| tee /ioc-logs/sirius-ioc-bl-ap-imgproc.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
