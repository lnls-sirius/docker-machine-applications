#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-as-ti-control.py -s ts | tee /ioc-logs/sirius-ioc-ts-ti-trig & # 4.5%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
