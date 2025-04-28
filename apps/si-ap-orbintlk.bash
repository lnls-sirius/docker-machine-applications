#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-si-ap-orbintlk.py &

# keep entry point running
sleep infinity
