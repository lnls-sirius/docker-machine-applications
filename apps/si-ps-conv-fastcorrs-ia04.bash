#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-04M1:PS-FCH \
SI-04M1:PS-FCV \
SI-04M2:PS-FCH \
SI-04M2:PS-FCV \
SI-04C2:PS-FCH \
SI-04C2:PS-FCV \
SI-04C3:PS-FCH \
SI-04C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia04.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
