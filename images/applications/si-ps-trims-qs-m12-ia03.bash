#!/usr/bin/env bash

# CPU usage estimate (ps aux): 35.0%

/usr/local/bin/sirius-ioc-as-ps.py IA-03RaCtrl:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia03.log & # 35.0%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
