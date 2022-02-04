#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 17.9%

/usr/local/bin/sirius-ioc-tb-ap-sofb.py &> /ioc-logs/sirius-ioc-tb-ap-sofb.log & # 5.8%
/usr/local/bin/sirius-ioc-bo-ap-sofb.py &> /ioc-logs/sirius-ioc-bo-ap-sofb.log & # 6.4%
/usr/local/bin/sirius-ioc-ts-ap-sofb.py &> /ioc-logs/sirius-ioc-ts-ap-sofb.log & # 5.7%
# run cron for log rotation
cron &

# keep entry point running
sleep infinity
