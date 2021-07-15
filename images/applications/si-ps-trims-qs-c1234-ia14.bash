#!/usr/bin/env bash

# CPU usage estimate (ps aux): 35.0%

/usr/local/bin/sirius-ioc-as-ps.py IA-14RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia14.log & # 35.0%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
