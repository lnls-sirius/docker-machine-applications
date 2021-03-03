#!/usr/bin/env bash


# Correctors
/usr/local/bin/sirius-ioc-as-ps.py IA-01RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia01 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-02RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia02 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-04RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia04 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-05RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia05 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-07RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia07 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-08RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia08 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-10RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia10 & # 12.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO "(0[1-9]|1[0-9]|2[0-5]).*" "(CH|CV|QS)" &> /ioc-logs/sirius-ioc-bo-ps-correctors-diag-ia01t10 & # 7.6%


# keep entry point running
sleep infinity
