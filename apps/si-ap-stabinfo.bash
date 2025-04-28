#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-si-ap-stabinfo.py &

# keep entry point running
sleep infinity
