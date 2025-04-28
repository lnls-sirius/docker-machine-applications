#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 29.6%

# Quadrupoles
/usr/local/bin/sirius-ioc-as-ps.py LA-RaPS02:CO-PSCtrl-TS2 & # 13.6%
/usr/local/bin/sirius-ioc-as-ps.py LA-RaPS04:CO-PSCtrl-TS & # 13.9%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py TS ".*" "Q.*" & # 2.1%

# keep entry point running
sleep infinity
