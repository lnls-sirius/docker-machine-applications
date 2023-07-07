#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-05M1:PS-FCH \
SI-05M1:PS-FCV \
SI-05M2:PS-FCH \
SI-05M2:PS-FCV \
SI-05C2:PS-FCH \
SI-05C2:PS-FCV \
SI-05C3:PS-FCH \
SI-05C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia05.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
