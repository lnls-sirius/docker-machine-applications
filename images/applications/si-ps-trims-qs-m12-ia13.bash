#!/usr/bin/env bash

# CPU usage estimate (ps aux): 43.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-13RaCtrl:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia13 & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(13M2|14M1)" "Q(F|D)" &> /ioc-logs/sirius-ioc-si-ps-diag-trims-m12-ia13 & # 4.3%
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(13M1|13M2)" "QS" &> /ioc-logs/sirius-ioc-si-ps-diag-qs-m12-ia13 & # 4.3%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
