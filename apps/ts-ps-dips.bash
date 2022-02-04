#!/usr/bin/env bash
export PYTHONUNBUFFERED=yes
# CPU usage estimate (ps aux): 12.1%

# Dipole
/usr/local/bin/sirius-ioc-as-ps.py LA-RaPS02:CO-PSCtrl-TS1 &> /ioc-logs/sirius-ioc-ts-ps-dips.log & # 10.0%
sleep 2 # before starting other IOCs

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py TS Fam B &> /ioc-logs/sirius-ioc-ts-ps-diag-dips.log & # 2.1%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
