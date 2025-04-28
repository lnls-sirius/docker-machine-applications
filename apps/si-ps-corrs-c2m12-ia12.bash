#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 7.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-12RaCtrl:CO-PSCtrl-SI2 &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "12(C2|M1|M2)" "C(H|V).*" & # 7.6%

# keep entry point running
sleep infinity
