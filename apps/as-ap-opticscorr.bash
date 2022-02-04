#!/usr/bin/env bash
export PYTHONUNBUFFERED=yes
# CPU usage estimate (ps aux): 20.1%

# BO opticscorr
/usr/local/bin/sirius-ioc-bo-ap-tunecorr.py &> /ioc-logs/sirius-ioc-bo-ap-tunecorr.log & # 3.5%
/usr/local/bin/sirius-ioc-bo-ap-chromcorr.py &> /ioc-logs/sirius-ioc-bo-ap-chromcorr.log & # 3.9%

# SI opticscorr
/usr/local/bin/sirius-ioc-si-ap-tunecorr.py &> /ioc-logs/sirius-ioc-si-ap-tunecorr.log & # 4.0%
/usr/local/bin/sirius-ioc-si-ap-chromcorr.py &> /ioc-logs/sirius-ioc-si-ap-chromcorr.log & # 8.7%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
