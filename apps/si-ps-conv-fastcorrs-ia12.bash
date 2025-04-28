#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-12M1:PS-FCH \
SI-12M1:PS-FCV \
SI-12M2:PS-FCH \
SI-12M2:PS-FCV \
SI-12C2:PS-FCH \
SI-12C2:PS-FCV \
SI-12C3:PS-FCH \
SI-12C3:PS-FCV &

# keep entry point running
sleep infinity
