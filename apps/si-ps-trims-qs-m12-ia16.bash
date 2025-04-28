#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 43.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-16RaCtrl:CO-PSCtrl-SI1 & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(16M2|17M1)" "Q(F|D)" & # 4.3%
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(16M1|16M2)" "QS" & # 4.3%
# keep entry point running
sleep infinity
