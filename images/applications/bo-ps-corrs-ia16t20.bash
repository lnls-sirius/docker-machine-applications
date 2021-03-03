#!/usr/bin/env bash

# CPU usage estimate (ps aux): 41.3%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py IA-16RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia16 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-17RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia17 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-20RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-correctors-ia20 & # 12.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO "(39|4[0-9]).*" "(CH|CV|QS)" &> /ioc-logs/sirius-ioc-bo-ps-correctors-diag-ia16t20 & # 3.8%

# keep entry point running
sleep infinity
