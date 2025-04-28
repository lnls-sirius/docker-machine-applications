#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-20M1:PS-FCH \
SI-20M1:PS-FCV \
SI-20M2:PS-FCH \
SI-20M2:PS-FCV \
SI-20C2:PS-FCH \
SI-20C2:PS-FCV \
SI-20C3:PS-FCH \
SI-20C3:PS-FCV &

# keep entry point running
sleep infinity
