#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 13.1%

# sirius-ioc-si-ti-trig-bpms.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s si-bpms >& /ioc-logs/sirius-ioc-si-ti-trig-bpms & # 5.5%

# sirius-ioc-si-ti-trig-corrs.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s si-corrs >& /ioc-logs/sirius-ioc-si-ti-trig-corrs & # 7.6%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
