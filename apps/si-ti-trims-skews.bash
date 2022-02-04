#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 13.4%

# sirius-ioc-si-ti-trig-qtrims.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s si-qtrims >& /ioc-logs/sirius-ioc-si-ti-trig-qtrims & # 7.1%

# sirius-ioc-si-ti-trig-skews.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s si-skews >& /ioc-logs/sirius-ioc-si-ti-trig-skews & # 6.3%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
