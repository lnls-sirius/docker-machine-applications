#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 8.7%

/usr/local/bin/sirius-ioc-si-di-fpmosc.py &
# keep entry point running
sleep infinity
