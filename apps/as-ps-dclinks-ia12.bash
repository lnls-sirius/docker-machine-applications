#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 4.7%

/usr/local/bin/sirius-ioc-as-ps.py IA-12RaCtrl:CO-DCLinkCtrl | tee /ioc-logs/sirius-ioc-as-ps-dclink-ia12.log & # 4.7%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
