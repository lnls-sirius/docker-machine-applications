#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 14.4%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py IA-05RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia05.log & # 12.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO "1(1|3)U" "(CH|CV)" &> /ioc-logs/sirius-ioc-bo-ps-corrs-diag-ia05.log & # 1.9%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
