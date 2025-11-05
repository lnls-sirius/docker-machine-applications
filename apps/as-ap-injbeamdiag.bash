#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-as-ap-injbeamdiag.py &
# keep entry point running
sleep infinity
