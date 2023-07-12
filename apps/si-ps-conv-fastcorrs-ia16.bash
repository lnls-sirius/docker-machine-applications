#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-16M1:PS-FCH \
SI-16M1:PS-FCV \
SI-16M2:PS-FCH \
SI-16M2:PS-FCV \
SI-16C2:PS-FCH \
SI-16C2:PS-FCV \
SI-16C3:PS-FCH \
SI-16C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia16.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
