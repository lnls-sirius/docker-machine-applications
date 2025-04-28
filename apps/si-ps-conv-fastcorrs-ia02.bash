#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-02M1:PS-FCH \
SI-02M1:PS-FCV \
SI-02M2:PS-FCH \
SI-02M2:PS-FCV \
SI-02C2:PS-FCH \
SI-02C2:PS-FCV \
SI-02C3:PS-FCH \
SI-02C3:PS-FCV &

# keep entry point running
sleep infinity
