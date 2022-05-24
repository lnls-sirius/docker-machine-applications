#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 14.4%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py IA-13RaCtrl:CO-PSCtrl-BO | tee /ioc-logs/sirius-ioc-bo-ps-corrs-ia13.log & # 12.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO "3(1|3)U" "(CH|CV)" | tee /ioc-logs/sirius-ioc-bo-ps-corrs-diag-ia13.log & # 1.9%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
