#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-08M1:PS-FCH \
SI-08M1:PS-FCV \
SI-08M2:PS-FCH \
SI-08M2:PS-FCV \
SI-08C2:PS-FCH \
SI-08C2:PS-FCV \
SI-08C3:PS-FCH \
SI-08C3:PS-FCV &

# keep entry point running
sleep infinity
