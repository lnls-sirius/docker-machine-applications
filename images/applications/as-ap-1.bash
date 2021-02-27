#!/usr/bin/env bash


# li-ap-energy
/usr/local/bin/sirius-ioc-li-ap-energy.py &> /ioc-logs/sirius-ioc-li-ap-energy &

# as-ap-currinfo
/usr/local/bin/sirius-ioc-li-ap-currinfo.py &> /ioc-logs/sirius-ioc-li-ap-currinfo &
# /usr/local/bin/sirius-ioc-tb-ap-currinfo.py &> /ioc-logs/sirius-ioc-tb-ap-currinfo &
/usr/local/bin/sirius-ioc-bo-ap-currinfo.py &> /ioc-logs/sirius-ioc-bo-ap-currinfo &
/usr/local/bin/sirius-ioc-ts-ap-currinfo.py &> /ioc-logs/sirius-ioc-ts-ap-currinfo &
/usr/local/bin/sirius-ioc-si-ap-currinfo.py &> /ioc-logs/sirius-ioc-si-ap-currinfo &
/usr/local/bin/sirius-ioc-si-ap-currinfo-lifetime.py &> /ioc-logs/sirius-ioc-si-ap-currinfo-lifetime &


# keep entry point running
sleep infinity
