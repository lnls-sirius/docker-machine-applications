#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 8.7%

# TB and TS posang
/usr/local/bin/sirius-ioc-tb-ap-posang.py & # 4.4%
/usr/local/bin/sirius-ioc-ts-ap-posang.py & # 4.3%

# keep entry point running
sleep infinity
