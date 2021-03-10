#!/usr/bin/env bash

# CPU usage estimate (ps aux): 43.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-02RaCtrl:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia02 & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(02M2|03M1)" "Q(F|D)" &> /ioc-logs/sirius-ioc-si-ps-diag-trims-m12-ia02 & # 4.3%
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(02M1|02M2)" "QS" &> /ioc-logs/sirius-ioc-si-ps-diag-qs-m12-ia02 & # 4.3%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
