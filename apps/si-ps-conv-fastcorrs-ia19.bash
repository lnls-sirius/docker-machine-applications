#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-19M1:PS-FCH \
SI-19M1:PS-FCV \
SI-19M2:PS-FCH \
SI-19M2:PS-FCV \
SI-19C2:PS-FCH \
SI-19C2:PS-FCV \
SI-19C3:PS-FCH \
SI-19C3:PS-FCV &

# keep entry point running
sleep infinity
