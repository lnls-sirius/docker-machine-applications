#!/usr/bin/env bash

# CPU usage estimate (ps aux): 7.6%

# /usr/local/bin/sirius-ioc-as-ps.py IA-11RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-corrs-c134-ia11 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-12RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-corrs-c134-ia12 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-13RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-corrs-c134-ia13 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-14RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-corrs-c134-ia14 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-15RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-corrs-c134-ia15 &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "1[1-5]C(1|3|4)" "C(H|V).*" &> /ioc-logs/sirius-ioc-si-ps-diag-corrs-c134-ia11t15 & # 7.6%


# keep entry point running
sleep infinity
