#!/usr/bin/env bash

# CPU usage estimate (ps aux): 43.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-03RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia03 & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "03C[1-4]" "Q.*" &> /ioc-logs/sirius-ioc-si-ps-diag-trims-qs-c1234-ia03 & # 8.6%


# keep entry point running
sleep infinity
