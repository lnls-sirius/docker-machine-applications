#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 43.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-10RaCtrl:CO-PSCtrl-SI3 & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "10C[1-4]" "Q.*" & # 8.6%

# keep entry point running
sleep infinity
