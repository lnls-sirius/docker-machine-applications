#!/usr/bin/env bash

# CPU usage estimate (ps aux): 3.7%

# manaca
/usr/local/bin/sirius-ioc-si-ap-manaca.py &> /ioc-logs/sirius-ioc-si-ap-manaca.log & # 3.7%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
