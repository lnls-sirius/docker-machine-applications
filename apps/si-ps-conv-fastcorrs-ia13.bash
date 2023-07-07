#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-13M1:PS-FCH \
SI-13M1:PS-FCV \
SI-13M2:PS-FCH \
SI-13M2:PS-FCV \
SI-13C2:PS-FCH \
SI-13C2:PS-FCV \
SI-13C3:PS-FCH \
SI-13C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia13.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
