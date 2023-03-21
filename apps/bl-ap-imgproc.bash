#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux):

/usr/local/bin/sirius-ioc-bl-ap-imgproc-caxdvf2.py --devname CAX:B:BASLER01 \
| tee /ioc-logs/sirius-ioc-bl-ap-imgproc-caxdvf2.log &

# /usr/local/bin/sirius-ioc-bl-ap-imgproc-caxdvf1.py --devname CAX:A:BASLER01 \
# | tee /ioc-logs/sirius-ioc-bl-ap-imgproc-caxdvf1.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
