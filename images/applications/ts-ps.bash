#!/usr/bin/env bash

# Dipole
/usr/local/bin/sirius-ioc-as-ps.py LA-RaPS02:CO-PSCtrl-TS1 &> /ioc-logs/sirius-ioc-ts-ps-dipoles & # 10.0%
sleep 2 # before starting other IOCs

# Quadrupoles
/usr/local/bin/sirius-ioc-as-ps.py LA-RaPS02:CO-PSCtrl-TS2 &> /ioc-logs/sirius-ioc-ts-ps-quadrupoles-12 & # 13.6%
/usr/local/bin/sirius-ioc-as-ps.py LA-RaPS04:CO-PSCtrl-TS &> /ioc-logs/sirius-ioc-ts-ps-quadrupoles-34 & # 13.9%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py LA-RaCtrl:CO-PSCtrl-TS &> /ioc-logs/env-sirius-ioc-ts-ps-correctors & # 40.2%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py TS ".*" ".*" &> /ioc-logs/sirius-ioc-ts-ps-diag & # 6.3%


# keep entry point running
sleep infinity
