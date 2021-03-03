#!/usr/bin/env bash

# CPU usage estimate (ps aux): 43.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-11RaCtrl:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia11 & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(11M2|12M1)" "Q(F|D)" &> /ioc-logs/sirius-ioc-si-ps-diag-trims-m12-ia11 & # 4.3%
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(11M1|11M2)" "QS" &> /ioc-logs/sirius-ioc-si-ps-diag-qs-m12-ia11 & # 4.3%

# keep entry point running
sleep infinity
