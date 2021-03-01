#!/usr/bin/env bash

# NOTE: Temporary commented while IOCs still run in lnlsfac-srv1
#
# /usr/local/bin/sirius-ioc-as-ps.py IA-01RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia01 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-02RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia02 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-03RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia03 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-04RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia04 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-05RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia05 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-06RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia06 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-07RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia07 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-08RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia08 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-09RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia09 &
# /usr/local/bin/sirius-ioc-as-ps.py IA-10RaCtrl:CO-PSCtrl-SI4 &> /ioc-logs/sirius-ioc-si-ps-correctors-c134-ia10 &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(0[1-9]|10)C(1|3|4)" "C(H|V).*" &> /ioc-logs/sirius-ioc-si-ps-diag-corrs-c134-ia01t10 &


# keep entry point running
sleep infinity