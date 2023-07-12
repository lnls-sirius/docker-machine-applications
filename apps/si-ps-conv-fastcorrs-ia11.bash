#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-11M1:PS-FCH \
SI-11M1:PS-FCV \
SI-11M2:PS-FCH \
SI-11M2:PS-FCV \
SI-11C2:PS-FCH \
SI-11C2:PS-FCV \
SI-11C3:PS-FCH \
SI-11C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia11.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
