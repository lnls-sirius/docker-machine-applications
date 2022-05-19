#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 29.9%

# Quadrupoles
/usr/local/bin/sirius-ioc-as-ps.py LA-RaCtrl:CO-PSCtrl-TB1 | tee /ioc-logs/sirius-ioc-tb-ps-quads.log & # 27.7%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py TB ".*" "Q.*" | tee /ioc-logs/sirius-ioc-tb-ps-diag-quads.log & # 2.2%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
