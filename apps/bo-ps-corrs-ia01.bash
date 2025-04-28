#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 14.4%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py IA-01RaCtrl:CO-PSCtrl-BO & # 12.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO "0(1|2)(U|D)" "(CH|CV|QS)" & # 1.9%

# keep entry point running
sleep infinity
