#!/usr/bin/env bash

# CPU usage estimate (ps aux): 43.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-09RaCtrl:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia09 & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(09M2|10M1)" "Q(F|D)" &> /ioc-logs/sirius-ioc-si-ps-diag-trims-m12-ia09 & # 4.3%
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(09M1|09M2)" "QS" &> /ioc-logs/sirius-ioc-si-ps-diag-qs-m12-ia09 & # 4.3%

# keep entry point running
sleep infinity
