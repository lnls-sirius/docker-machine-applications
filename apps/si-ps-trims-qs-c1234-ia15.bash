#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 43.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-15RaCtrl:CO-PSCtrl-SI3 & # 25.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "15C[1-4]" "Q.*" & # 8.6%

# keep entry point running
sleep infinity
