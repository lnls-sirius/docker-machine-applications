#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): %

/usr/local/bin/sirius-ioc-si-ap-sofb.py &
# keep entry point running
sleep infinity
