#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-17M1:PS-FCH \
SI-17M1:PS-FCV \
SI-17M2:PS-FCH \
SI-17M2:PS-FCV \
SI-17C2:PS-FCH \
SI-17C2:PS-FCV \
SI-17C3:PS-FCH \
SI-17C3:PS-FCV &

# keep entry point running
sleep infinity
