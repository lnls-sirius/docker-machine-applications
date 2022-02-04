#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 25.2%

/usr/local/bin/sirius-ioc-li-ap-currinfo.py &> /ioc-logs/sirius-ioc-li-ap-currinfo.log & # 3.7%
# /usr/local/bin/sirius-ioc-tb-ap-currinfo.py &> /ioc-logs/sirius-ioc-tb-ap-currinfo.log & #
/usr/local/bin/sirius-ioc-bo-ap-currinfo.py &> /ioc-logs/sirius-ioc-bo-ap-currinfo.log & # 3.6%
/usr/local/bin/sirius-ioc-ts-ap-currinfo.py &> /ioc-logs/sirius-ioc-ts-ap-currinfo.log & # 3.6%
/usr/local/bin/sirius-ioc-si-ap-currinfo.py &> /ioc-logs/sirius-ioc-si-ap-currinfo.log & # 4.4%
/usr/local/bin/sirius-ioc-si-ap-currinfo-lifetime.py &> /ioc-logs/sirius-ioc-si-ap-currinfo-lifetime.log & # 9.9%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
