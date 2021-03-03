#!/usr/bin/env bash


# Correctors
/usr/local/bin/sirius-ioc-as-ps.py IA-11RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia11 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-13RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia13 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-14RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia14 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-16RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia16 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-17RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia17 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-20RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia20 & # 12.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO "(2[7-9]|3[0-9]|4[0-9]).*" "(CH|CV|QS)" &> /ioc-logs/sirius-ioc-bo-ps-correctors-diag-ia11t20 & # 7.6%

# keep entry point running
sleep infinity
