#!/usr/bin/env bash
export PYTHONUNBUFFERED=yes
# CPU usage estimate (ps aux): 32.2%

# CHs
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-1 &> /ioc-logs/sirius-ioc-li-ps-ch1.log & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-2 &> /ioc-logs/sirius-ioc-li-ps-ch2.log & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-3 &> /ioc-logs/sirius-ioc-li-ps-ch3.log & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-4 &> /ioc-logs/sirius-ioc-li-ps-ch4.log & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-5 &> /ioc-logs/sirius-ioc-li-ps-ch5.log & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-6 &> /ioc-logs/sirius-ioc-li-ps-ch6.log & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-7 &> /ioc-logs/sirius-ioc-li-ps-ch7.log & # 2.3%

# CVs
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-1 &> /ioc-logs/sirius-ioc-li-ps-cv1.log & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-2 &> /ioc-logs/sirius-ioc-li-ps-cv2.log & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-3 &> /ioc-logs/sirius-ioc-li-ps-cv3.log & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-4 &> /ioc-logs/sirius-ioc-li-ps-cv4.log & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-5 &> /ioc-logs/sirius-ioc-li-ps-cv5.log & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-6 &> /ioc-logs/sirius-ioc-li-ps-cv6.log & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-7 &> /ioc-logs/sirius-ioc-li-ps-cv7.log & # 2.3%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
