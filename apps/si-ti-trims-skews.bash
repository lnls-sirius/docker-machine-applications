#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 13.4%

# sirius-ioc-si-ti-trig-qtrims.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s si-qtrims & # 7.1%

# sirius-ioc-si-ti-trig-skews.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s si-skews & # 6.3%

# keep entry point running
sleep infinity
