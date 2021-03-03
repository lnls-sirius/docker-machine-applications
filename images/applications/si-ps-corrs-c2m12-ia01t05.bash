#!/usr/bin/env bash

# CPU usage estimate (ps aux): 7.6%

# /usr/local/bin/sirius-ioc-as-ps.py IA-01RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia01 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-02RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia02 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-03RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia03 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-04RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia04 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-05RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia05 &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "0[1-5](C2|M1|M2)" "C(H|V).*" &> /ioc-logs/sirius-ioc-si-ps-diag-corrs-c2m12-ia01t05 & # 7.6%


# keep entry point running
sleep infinity
