#!/usr/bin/env bash

/usr/local/bin/sirius-ioc-as-ps.py IA-11RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia11 &
/usr/local/bin/sirius-ioc-as-ps.py IA-12RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia12 &
/usr/local/bin/sirius-ioc-as-ps.py IA-13RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia13 &
/usr/local/bin/sirius-ioc-as-ps.py IA-14RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia14 &
/usr/local/bin/sirius-ioc-as-ps.py IA-15RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia15 &
/usr/local/bin/sirius-ioc-as-ps.py IA-16RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia16 &
/usr/local/bin/sirius-ioc-as-ps.py IA-17RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia17 &
/usr/local/bin/sirius-ioc-as-ps.py IA-18RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia18 &
/usr/local/bin/sirius-ioc-as-ps.py IA-19RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia19 &
/usr/local/bin/sirius-ioc-as-ps.py IA-20RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia20 &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(1[1-9]|20)C(1|3|4)" "C(H|V).*" &> /ioc-logs/sirius-ioc-si-ps-diag-corrs-c134-ia11t20 &


# keep entry point running
sleep infinity
