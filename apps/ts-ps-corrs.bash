#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 42.3%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py LA-RaCtrl:CO-PSCtrl-TS | tee /ioc-logs/sirius-ioc-ts-ps-corrs.log & # 40.2%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py TS ".*" "C.*" | tee /ioc-logs/sirius-ioc-ts-ps-diag-corrs.log & # 2.1%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
