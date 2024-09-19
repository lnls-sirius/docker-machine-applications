#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 7.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-08RaCtrl:CO-PSCtrl-SI5 | tee /ioc-logs/sirius-ioc-si-ps-corrs-sb-ia08.log &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "08SB" "(CH|CV).*" | tee /ioc-logs/sirius-ioc-si-ps-diag-corrs-sb-ia08.log & # 7.6%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
