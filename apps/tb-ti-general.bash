#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-as-ti-control.py -s tb | tee /ioc-logs/sirius-ioc-tb-ti-trig & # 4.0%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
