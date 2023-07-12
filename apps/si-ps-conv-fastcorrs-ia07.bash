#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-07M1:PS-FCH \
SI-07M1:PS-FCV \
SI-07M2:PS-FCH \
SI-07M2:PS-FCV \
SI-07C2:PS-FCH \
SI-07C2:PS-FCV \
SI-07C3:PS-FCH \
SI-07C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia07.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
