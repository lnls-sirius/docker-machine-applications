#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-09M1:PS-FCH \
SI-09M1:PS-FCV \
SI-09M2:PS-FCH \
SI-09M2:PS-FCV \
SI-09C2:PS-FCH \
SI-09C2:PS-FCV \
SI-09C3:PS-FCH \
SI-09C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia09.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
