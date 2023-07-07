#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-18M1:PS-FCH \
SI-18M1:PS-FCV \
SI-18M2:PS-FCH \
SI-18M2:PS-FCV \
SI-18C2:PS-FCH \
SI-18C2:PS-FCV \
SI-18C3:PS-FCH \
SI-18C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia18.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
