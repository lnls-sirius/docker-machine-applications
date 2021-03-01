#!/usr/bin/env bash


# Correctors
/usr/local/bin/sirius-ioc-as-ps.py IA-01RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia01 &
/usr/local/bin/sirius-ioc-as-ps.py IA-02RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia02 &
/usr/local/bin/sirius-ioc-as-ps.py IA-04RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia04 &
/usr/local/bin/sirius-ioc-as-ps.py IA-05RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia05 &
/usr/local/bin/sirius-ioc-as-ps.py IA-07RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia07 &
/usr/local/bin/sirius-ioc-as-ps.py IA-08RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia08 &
/usr/local/bin/sirius-ioc-as-ps.py IA-10RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia10 &

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO "(0[1-9]|10).*" "(CH|CV|QS)" &> /ioc-logs/sirius-ioc-bo-ps-correctors-diag-ia01t10 &


# keep entry point running
sleep infinity
