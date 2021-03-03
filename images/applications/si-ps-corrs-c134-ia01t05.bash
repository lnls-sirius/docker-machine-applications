#!/usr/bin/env bash

# /usr/local/bin/sirius-ioc-as-ps.py IA-01RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia01 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-02RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia02 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-03RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia03 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-04RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia04 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-05RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia05 &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "0[1-5]C(1|3|4)" "C(H|V).*" &> /ioc-logs/sirius-ioc-si-ps-diag-corrs-c134-ia01t05 & # 7.6%


# keep entry point running
sleep infinity
