#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-01M1:PS-FCH \
SI-01M1:PS-FCV \
SI-01M2:PS-FCH \
SI-01M2:PS-FCV \
SI-01C2:PS-FCH \
SI-01C2:PS-FCV \
SI-01C3:PS-FCH \
SI-01C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia01.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
