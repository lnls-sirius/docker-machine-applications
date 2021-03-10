#!/usr/bin/env bash

# CPU usage estimate (ps aux): 4.7%

/usr/local/bin/sirius-ioc-as-ps.py IA-11RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia11 & # 4.7%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
