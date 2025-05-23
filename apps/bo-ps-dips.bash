#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 47.0%

# Dipoles
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSE05:CO-PSCtrl-BO1 & # 21.5%
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSF05:CO-PSCtrl-BO1 & # 21.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO ".*" "B-(1|2)" & # 4.0%

# keep entry point running
sleep infinity
