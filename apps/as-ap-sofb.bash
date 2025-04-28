#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 17.9%

/usr/local/bin/sirius-ioc-tb-ap-sofb.py & # 5.8%
/usr/local/bin/sirius-ioc-bo-ap-sofb.py & # 6.4%
/usr/local/bin/sirius-ioc-ts-ap-sofb.py & # 5.7%
# keep entry point running
sleep infinity
