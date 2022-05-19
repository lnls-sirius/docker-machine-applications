#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI ".*" "FC.*" | tee /ioc-logs/sirius-ioc-si-ps-diag-fastcorrs.log & #

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
