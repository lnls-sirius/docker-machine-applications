#!/usr/bin/env bash
export PYTHONUNBUFFERED=yes
# CPU usage estimate (ps aux): 8.1%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py LI ".*" ".*" &> /ioc-logs/sirius-ioc-li-ps-diag.log & # 8.1%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
