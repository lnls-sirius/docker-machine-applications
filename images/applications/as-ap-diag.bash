#!/usr/bin/env bash

# CPU usage estimate (ps aux): 19.3%

# sirius-ioc-as-pu-diag.service
/usr/local/bin/sirius-ioc-as-pu-diag.py &> /ioc-logs/sirius-ioc-as-pu-diag & # 8.2%

# sirius-ioc-as-rf-diag.service
/usr/local/bin/sirius-ioc-as-rf-diag.py &> /ioc-logs/sirius-ioc-as-rf-diag & # 4.9%

# sirius-ioc-li-ap-diag.service
/usr/local/bin/sirius-ioc-li-ap-diag.py &> /ioc-logs/sirius-ioc-li-ap-diag & # 6.2%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
