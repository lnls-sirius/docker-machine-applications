#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 4.3%

# li-ap-energy
/usr/local/bin/sirius-ioc-li-ap-energy.py & # 4.3%

# keep entry point running
sleep infinity
