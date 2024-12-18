#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 7.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-08RaCtrl:CO-PSCtrl-SI6 | tee /ioc-logs/sirius-ioc-si-ps-corrlong-sb-ia08.log &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "08SB" LCH | tee /ioc-logs/sirius-ioc-si-ps-diag-corrlong-sb-ia08.log & # 7.6%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
