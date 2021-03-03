#!/usr/bin/env bash

# Dipole
/usr/local/bin/sirius-ioc-as-ps.py LA-RaPS02:CO-PSCtrl-TB &> /ioc-logs/sirius-ioc-tb-ps-dipoles & # 8.1%
sleep 2 # before starting other IOCs

# Quadrupoles
/usr/local/bin/sirius-ioc-as-ps.py LA-RaCtrl:CO-PSCtrl-TB1 &> /ioc-logs/sirius-ioc-tb-ps-quadrupoles & # 27.7%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py LA-RaCtrl:CO-PSCtrl-TB2 &> /ioc-logs/sirius-ioc-tb-ps-correctors & # 27.7%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py TB ".*" ".*" &> /ioc-logs/sirius-ioc-tb-ps-diag & # 6.6%


# keep entry point running
sleep infinity
