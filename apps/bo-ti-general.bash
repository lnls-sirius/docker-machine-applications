#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-as-ti-control.py -s bo | tee /ioc-logs/sirius-ioc-bo-ti-trig & # 4.5%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
