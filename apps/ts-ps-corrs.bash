#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 42.3%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py LA-RaCtrl:CO-PSCtrl-TS & # 40.2%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py TS ".*" "C.*" & # 2.1%

# keep entry point running
sleep infinity
