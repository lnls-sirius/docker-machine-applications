#!/usr/bin/env bash
export PYTHONUNBUFFERED=yes
# CPU usage estimate (ps aux): 47.0%

# Dipoles
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSE05:CO-PSCtrl-BO1 &> /ioc-logs/sirius-ioc-bo-ps-dips-1.log & # 21.5%
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSF05:CO-PSCtrl-BO1 &> /ioc-logs/sirius-ioc-bo-ps-dips-2.log & # 21.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO ".*" "B-(1|2)" &> /ioc-logs/sirius-ioc-bo-ps-dips-diag.log & # 4.0%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
