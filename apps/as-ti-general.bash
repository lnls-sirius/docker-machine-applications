#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-as-ti-control.py -s as | tee /ioc-logs/sirius-ioc-as-ti-trig & # 3.7%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
