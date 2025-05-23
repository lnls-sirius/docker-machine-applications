#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-03M1:PS-FCH \
SI-03M1:PS-FCV \
SI-03M2:PS-FCH \
SI-03M2:PS-FCV \
SI-03C2:PS-FCH \
SI-03C2:PS-FCV \
SI-03C3:PS-FCH \
SI-03C3:PS-FCV &

# keep entry point running
sleep infinity
