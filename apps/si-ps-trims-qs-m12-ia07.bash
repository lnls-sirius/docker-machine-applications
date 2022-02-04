#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 43.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-07RaCtrl:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia07.log & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(07M2|08M1)" "Q(F|D)" &> /ioc-logs/sirius-ioc-si-ps-diag-trims-m12-ia07.log & # 4.3%
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(07M1|07M2)" "QS" &> /ioc-logs/sirius-ioc-si-ps-diag-qs-m12-ia07.log & # 4.3%
# run cron for log rotation
cron &

# keep entry point running
sleep infinity
