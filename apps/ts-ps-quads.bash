#!/usr/bin/env bash
export PYTHONUNBUFFERED=yes
# CPU usage estimate (ps aux): 29.6%

# Quadrupoles
/usr/local/bin/sirius-ioc-as-ps.py LA-RaPS02:CO-PSCtrl-TS2 &> /ioc-logs/sirius-ioc-ts-ps-quads-12.log & # 13.6%
/usr/local/bin/sirius-ioc-as-ps.py LA-RaPS04:CO-PSCtrl-TS &> /ioc-logs/sirius-ioc-ts-ps-quads-34.log & # 13.9%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py TS ".*" "Q.*" &> /ioc-logs/sirius-ioc-ts-ps-diag-quads.log & # 2.1%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
