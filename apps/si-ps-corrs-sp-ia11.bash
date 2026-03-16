#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 7.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-11RaCtrl:CO-PSCtrl-SI5 &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "11SP" "(CH|CV).*" & # 7.6%

# keep entry point running
sleep infinity
