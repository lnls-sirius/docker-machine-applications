#!/usr/bin/env bash
export PYTHONUNBUFFERED=yes
# CPU usage estimate (ps aux): 43.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-16RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia16.log & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "16C[1-4]" "Q.*" &> /ioc-logs/sirius-ioc-si-ps-diag-trims-qs-c1234-ia16.log & # 8.6%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
