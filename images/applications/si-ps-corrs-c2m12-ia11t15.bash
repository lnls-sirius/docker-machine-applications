#!/usr/bin/env bash

# /usr/local/bin/sirius-ioc-as-ps.py IA-11RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia11 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-12RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia12 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-13RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia13 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-14RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia14 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-15RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia15 &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "1[1-5](C2|M1|M2)" "C(H|V).*" &> /ioc-logs/sirius-ioc-si-ps-diag-corrs-c2m12-ia11t15 & # 7.6%


# keep entry point running
sleep infinity
