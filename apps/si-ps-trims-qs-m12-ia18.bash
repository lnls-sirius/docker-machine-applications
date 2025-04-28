#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 43.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-18RaCtrl:CO-PSCtrl-SI1 & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(18M2|19M1)" "Q(F|D)" & # 4.3%
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(18M1|18M2)" "QS" & # 4.3%
# keep entry point running
sleep infinity
