#!/usr/bin/env bash
export PYTHONUNBUFFERED=yes
# CPU usage estimate (ps aux): 4.2%

# AS machshift
/usr/local/bin/sirius-ioc-as-ap-machshift.py &> /ioc-logs/sirius-ioc-as-ap-machshift.log & # 4.2%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
