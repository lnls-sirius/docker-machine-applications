#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 7.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-20RaCtrl:CO-PSCtrl-SI4 &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "20C(1|3|4)" "C(H|V).*" & # 7.6%

# keep entry point running
sleep infinity
