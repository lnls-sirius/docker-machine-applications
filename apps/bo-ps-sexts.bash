#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 23.5%

# Sextupoles
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO2 | tee /ioc-logs/sirius-ioc-bo-ps-sexts-sf.log & # 9.5%
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO3 | tee /ioc-logs/sirius-ioc-bo-ps-sexts-sd.log & # 9.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO ".*" "S(F|D)" | tee /ioc-logs/sirius-ioc-bo-ps-sexts-diag.log & # 4.5%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
