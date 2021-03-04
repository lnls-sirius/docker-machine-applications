#!/usr/bin/env bash

# CPU usage estimate (ps aux): 43.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-17RaCtrl:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia17 & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(17M2|18M1)" "Q(F|D)" &> /ioc-logs/sirius-ioc-si-ps-diag-trims-m12-ia17 & # 4.3%
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(17M1|17M2)" "QS" &> /ioc-logs/sirius-ioc-si-ps-diag-qs-m12-ia17 & # 4.3%

# keep entry point running
sleep infinity