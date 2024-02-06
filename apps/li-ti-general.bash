#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-as-ti-control.py -s li | tee /ioc-logs/sirius-ioc-li-ti-trig & # 4.2%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
