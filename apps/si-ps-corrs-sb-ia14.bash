#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 43.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-14RaCtrl:CO-PSCtrl-WIG | tee /ioc-logs/sirius-ioc-si-ps-corrs-sb-ia14.log & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "14SB" "C(H|V)" | tee /ioc-logs/sirius-ioc-si-ps-diag-corrs-sb-ia14.log & # 4.3%
# run cron for log rotation
cron &

# keep entry point running
sleep infinity
