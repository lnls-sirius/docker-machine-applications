#!/usr/bin/env bash

/usr/local/bin/sirius-ioc-as-ps.py IA-06RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia06 &
/usr/local/bin/sirius-ioc-as-ps.py IA-07RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia07 &
/usr/local/bin/sirius-ioc-as-ps.py IA-08RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia08 &
/usr/local/bin/sirius-ioc-as-ps.py IA-09RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia09 &
/usr/local/bin/sirius-ioc-as-ps.py IA-10RaCtrl:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-correctors-c2m12-ia10 &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(0[1-9]|10)(C2|M1|M2)" "C(H|V).*" &> /ioc-logs/sirius-ioc-si-ps-diag-corrs-c2m12-ia01t10 &


# keep entry point running
sleep infinity
