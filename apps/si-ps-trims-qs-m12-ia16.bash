#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 43.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-16RaCtrl:CO-PSCtrl-SI1 | tee /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia16.log & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(16M2|17M1)" "Q(F|D)" | tee /ioc-logs/sirius-ioc-si-ps-diag-trims-m12-ia16.log & # 4.3%
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(16M1|16M2)" "QS" | tee /ioc-logs/sirius-ioc-si-ps-diag-qs-m12-ia16.log & # 4.3%
# run cron for log rotation
cron &

# keep entry point running
sleep infinity
