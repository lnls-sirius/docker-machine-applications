#!/usr/bin/env bash

# CPU usage estimate (ps aux): 7.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-14RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-corrs-c134-ia14 &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "14C(1|3|4)" "C(H|V).*" &> /ioc-logs/sirius-ioc-si-ps-diag-corrs-c134-ia14 & # 7.6%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
