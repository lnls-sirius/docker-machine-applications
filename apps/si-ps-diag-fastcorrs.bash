#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI ".*" "FC.*" & #

# keep entry point running
sleep infinity
