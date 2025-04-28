#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 8.1%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py LI ".*" ".*" & # 8.1%

# keep entry point running
sleep infinity
