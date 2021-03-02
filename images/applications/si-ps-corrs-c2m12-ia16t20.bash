#!/usr/bin/env bash

/usr/local/bin/sirius-ioc-as-ps.py IA-16RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia16 &
/usr/local/bin/sirius-ioc-as-ps.py IA-17RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia17 &
/usr/local/bin/sirius-ioc-as-ps.py IA-18RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia18 &
/usr/local/bin/sirius-ioc-as-ps.py IA-19RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia19 &
/usr/local/bin/sirius-ioc-as-ps.py IA-20RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia20 &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(1[6-9]|20)(C2|M1|M2)" "C(H|V).*" &> /ioc-logs/sirius-ioc-si-ps-diag-corrs-c2m12-ia16t20 &


# keep entry point running
sleep infinity