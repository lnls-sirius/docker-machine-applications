#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-as-ti-control.py -s si | tee /ioc-logs/sirius-ioc-si-ti-trig & # 5.9%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
