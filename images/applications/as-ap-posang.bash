#!/usr/bin/env bash

# CPU usage estimate (ps aux): 8.7%

# TB and TS posang
/usr/local/bin/sirius-ioc-tb-ap-posang.py &> /ioc-logs/sirius-ioc-tb-ap-posang & # 4.4%
/usr/local/bin/sirius-ioc-ts-ap-posang.py &> /ioc-logs/sirius-ioc-ts-ap-posang & # 4.3%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
