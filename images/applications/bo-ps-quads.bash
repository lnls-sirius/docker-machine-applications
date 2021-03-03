#!/usr/bin/env bash

# Quadrupoles
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO1 &> /ioc-logs/sirius-ioc-bo-ps-quadrupole-qf & # 11.1%
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO4 &> /ioc-logs/sirius-ioc-bo-ps-quadrupole-qd & # 8.1%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO ".*" "Q(F|D)" &> /ioc-logs/sirius-ioc-bo-ps-quadrupoles-diag & # 4.2%


# keep entry point running
sleep infinity
