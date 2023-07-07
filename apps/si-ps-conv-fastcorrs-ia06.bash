#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-06M1:PS-FCH \
SI-06M1:PS-FCV \
SI-06M2:PS-FCH \
SI-06M2:PS-FCV \
SI-06C2:PS-FCH \
SI-06C2:PS-FCV \
SI-06C3:PS-FCH \
SI-06C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia06.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
