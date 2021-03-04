#!/usr/bin/env bash

# CPU usage estimate (ps aux): 7.6%

# /usr/local/bin/sirius-ioc-as-ps.py IA-17RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-corrs-c2m12-ia17 &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "17(C2|M1|M2)" "C(H|V).*" &> /ioc-logs/sirius-ioc-si-ps-diag-corrs-c2m12-ia17 & # 7.6%


# keep entry point running
sleep infinity
