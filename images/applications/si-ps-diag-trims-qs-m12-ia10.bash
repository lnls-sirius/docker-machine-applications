#!/usr/bin/env bash

# CPU usage estimate (ps aux): 8.6%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(10M2|11M1)" "Q(F|D)" &> /ioc-logs/sirius-ioc-si-ps-diag-trims-m12-ia10.log & # 4.3%
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(10M1|10M2)" "QS" &> /ioc-logs/sirius-ioc-si-ps-diag-qs-m12-ia10.log & # 4.3%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
