#!/usr/bin/env bash
export PYTHONUNBUFFERED=yes
# CPU usage estimate (ps aux): %

/usr/local/bin/sirius-ioc-si-ap-sofb.py | tee /ioc-logs/sirius-ioc-si-ap-sofb.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
