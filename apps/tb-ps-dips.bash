#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 10.3%

# Dipole
/usr/local/bin/sirius-ioc-as-ps.py LA-RaPS02:CO-PSCtrl-TB & # 8.1%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py TB Fam B & # 2.2%

# keep entry point running
sleep infinity
