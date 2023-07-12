#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-10M1:PS-FCH \
SI-10M1:PS-FCV \
SI-10M2:PS-FCH \
SI-10M2:PS-FCV \
SI-10C2:PS-FCH \
SI-10C2:PS-FCV \
SI-10C3:PS-FCH \
SI-10C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia10.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
