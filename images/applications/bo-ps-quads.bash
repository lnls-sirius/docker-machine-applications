#!/usr/bin/env bash

# Quadrupoles
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO1 &> /ioc-logs/sirius-ioc-bo-ps-quadrupole-qf &
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO4 &> /ioc-logs/sirius-ioc-bo-ps-quadrupole-qd &

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO ".*" "Q(F|D)" &> /ioc-logs/sirius-ioc-bo-ps-quadrupoles-diag &


# keep entry point running
sleep infinity
