#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 23.4%

# Quadrupoles
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO1 & # 11.1%
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO4 & # 8.1%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO ".*" "Q(F|D)" & # 4.2%

# keep entry point running
sleep infinity
