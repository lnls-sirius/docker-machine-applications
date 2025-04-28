#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 4.2%

# AS machshift
/usr/local/bin/sirius-ioc-as-ap-machshift.py & # 4.2%

# keep entry point running
sleep infinity
