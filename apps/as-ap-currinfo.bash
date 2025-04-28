#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 25.2%

/usr/local/bin/sirius-ioc-li-ap-currinfo.py & # 3.7%
# /usr/local/bin/sirius-ioc-tb-ap-currinfo.py & #
/usr/local/bin/sirius-ioc-bo-ap-currinfo.py & # 3.6%
/usr/local/bin/sirius-ioc-ts-ap-currinfo.py & # 3.6%
/usr/local/bin/sirius-ioc-si-ap-currinfo.py & # 4.4%
/usr/local/bin/sirius-ioc-si-ap-currinfo-lifetime.py & # 9.9%

# keep entry point running
sleep infinity
