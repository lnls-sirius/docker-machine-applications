#!/usr/bin/env bash


/usr/local/bin/sirius-ioc-li-ap-currinfo.py &> /ioc-logs/sirius-ioc-li-ap-currinfo & # 3.7%
# /usr/local/bin/sirius-ioc-tb-ap-currinfo.py &> /ioc-logs/sirius-ioc-tb-ap-currinfo & #
/usr/local/bin/sirius-ioc-bo-ap-currinfo.py &> /ioc-logs/sirius-ioc-bo-ap-currinfo & # 3.6%
/usr/local/bin/sirius-ioc-ts-ap-currinfo.py &> /ioc-logs/sirius-ioc-ts-ap-currinfo & # 3.6%
/usr/local/bin/sirius-ioc-si-ap-currinfo.py &> /ioc-logs/sirius-ioc-si-ap-currinfo & # 4.4%
/usr/local/bin/sirius-ioc-si-ap-currinfo-lifetime.py &> /ioc-logs/sirius-ioc-si-ap-currinfo-lifetime & #9.9%


# keep entry point running
sleep infinity
