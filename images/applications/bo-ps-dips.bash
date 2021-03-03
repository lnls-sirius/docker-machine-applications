#!/usr/bin/env bash

# Dipoles
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSE05:CO-PSCtrl-BO1 &> /ioc-logs/sirius-ioc-bo-ps-dipole-1 & # 21.5%
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSF05:CO-PSCtrl-BO1 &> /ioc-logs/sirius-ioc-bo-ps-dipole-2 & # 21.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO ".*" "B-(1|2)" &> /ioc-logs/sirius-ioc-bo-ps-dipoles-diag & # 4.0%


# keep entry point running
sleep infinity
