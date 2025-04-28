#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 29.9%

# Quadrupoles
/usr/local/bin/sirius-ioc-as-ps.py LA-RaCtrl:CO-PSCtrl-TB1 & # 27.7%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py TB ".*" "Q.*" & # 2.2%

# keep entry point running
sleep infinity
