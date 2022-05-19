#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 7.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-14RaCtrl:CO-PSCtrl-SI2 | tee /ioc-logs/sirius-ioc-si-ps-corrs-c2m12-ia14.log &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "14(C2|M1|M2)" "C(H|V).*" | tee /ioc-logs/sirius-ioc-si-ps-diag-corrs-c2m12-ia14.log & # 7.6%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
