#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 43.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-14RaCtrl:CO-PSCtrl-SI1 & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(14M2|15M1)" "Q(F|D)" & # 4.3%
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(14M1|14M2)" "QS" & # 4.3%
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "14SB" "C(H|V)" & # 4.3%
# keep entry point running
sleep infinity
