#!/usr/bin/env bash

# CPU usage estimate (ps aux):  # 12.5%

# Lens
/usr/local/bin/sirius-ioc-as-ps.py IT-Ra:CO-PSCtrl &> /ioc-logs/sirius-ioc-it-ps-lens.log & # 12.5%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
