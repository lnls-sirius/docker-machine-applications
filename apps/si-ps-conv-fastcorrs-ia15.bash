#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-15M1:PS-FCH \
SI-15M1:PS-FCV \
SI-15M2:PS-FCH \
SI-15M2:PS-FCV \
SI-15C2:PS-FCH \
SI-15C2:PS-FCV \
SI-15C3:PS-FCH \
SI-15C3:PS-FCV &

# keep entry point running
sleep infinity
