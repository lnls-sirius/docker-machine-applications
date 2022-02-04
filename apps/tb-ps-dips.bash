#!/usr/bin/env bash
export PYTHONUNBUFFERED=yes
# CPU usage estimate (ps aux): 10.3%

# Dipole
/usr/local/bin/sirius-ioc-as-ps.py LA-RaPS02:CO-PSCtrl-TB &> /ioc-logs/sirius-ioc-tb-ps-dips.log & # 8.1%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py TB Fam B &> /ioc-logs/sirius-ioc-tb-ps-diag-dips.log & # 2.2%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
