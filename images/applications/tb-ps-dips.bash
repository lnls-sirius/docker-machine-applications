#!/usr/bin/env bash

# CPU usage estimate (ps aux): 10.3%

# Dipole
/usr/local/bin/sirius-ioc-as-ps.py LA-RaPS02:CO-PSCtrl-TB &> /ioc-logs/sirius-ioc-tb-ps-dips & # 8.1%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py TB Fam B &> /ioc-logs/sirius-ioc-tb-ps-diag & # 2.2%


# keep entry point running
sleep infinity
