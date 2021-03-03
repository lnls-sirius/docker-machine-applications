#!/usr/bin/env bash

# CPU usage estimate (ps aux): 41.3%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py IA-16RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia16 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-17RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia17 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-20RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia20 & # 12.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO "(39|4[0-9]).*" "(CH|CV|QS)" &> /ioc-logs/sirius-ioc-bo-ps-corrs-diag-ia16t20 & # 3.8%

# keep entry point running
sleep infinity
