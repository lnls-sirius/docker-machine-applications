#!/usr/bin/env bash
export PYTHONUNBUFFERED=yes
# CPU usage estimate (ps aux): 23.4%

# Quadrupoles
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO1 &> /ioc-logs/sirius-ioc-bo-ps-quads-qf.log & # 11.1%
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO4 &> /ioc-logs/sirius-ioc-bo-ps-quads-qd.log & # 8.1%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO ".*" "Q(F|D)" &> /ioc-logs/sirius-ioc-bo-ps-quads-diag.log & # 4.2%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
