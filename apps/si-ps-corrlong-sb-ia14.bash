#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 7.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-14RaCtrl:CO-PSCtrl-SI6 &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "14SB" LCH & # 7.6%

# keep entry point running
sleep infinity
