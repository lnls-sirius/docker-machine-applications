#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): %

/usr/local/bin/sirius-ioc-si-rf-monitor.py &
# keep entry point running
sleep infinity
