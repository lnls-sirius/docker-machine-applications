#!/usr/bin/env bash

# CPU usage estimate (ps aux): 23.4%

# Quadrupoles
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO1 &> /ioc-logs/sirius-ioc-bo-ps-quads-qf & # 11.1%
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO4 &> /ioc-logs/sirius-ioc-bo-ps-quads-qd & # 8.1%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO ".*" "Q(F|D)" &> /ioc-logs/sirius-ioc-bo-ps-quads-diag & # 4.2%


# keep entry point running
sleep infinity
