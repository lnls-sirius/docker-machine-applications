#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-14M1:PS-FCH \
SI-14M1:PS-FCV \
SI-14M2:PS-FCH \
SI-14M2:PS-FCV \
SI-14C2:PS-FCH \
SI-14C2:PS-FCV \
SI-14C3:PS-FCH \
SI-14C3:PS-FCV &

# keep entry point running
sleep infinity
