#!/usr/bin/env bash
export PYTHONUNBUFFERED=yes
# CPU usage estimate (ps aux): 70.7%

# sirius-ioc-si-ps-dipoles.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSD04:CO-PSCtrl-SI &> /ioc-logs/sirius-ioc-si-ps-dipoles.log & # 66.6%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI Fam "B1B2-(1|2)" &> /ioc-logs/sirius-ioc-si-ps-diag-dips.log & # 4.1%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
