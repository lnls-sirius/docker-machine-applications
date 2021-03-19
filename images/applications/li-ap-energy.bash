#!/usr/bin/env bash

# CPU usage estimate (ps aux): 4.3%

# li-ap-energy
/usr/local/bin/sirius-ioc-li-ap-energy.py &> /ioc-logs/sirius-ioc-li-ap-energy.log & # 4.3%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
