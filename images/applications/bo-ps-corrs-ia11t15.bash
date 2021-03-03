#!/usr/bin/env bash

# CPU usage estimate (ps aux): 41.3%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py IA-11RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia11 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-13RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia13 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-14RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia14 & # 12.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO "(2[7-9]|3[1-3]).*" "(CH|CV|QS)" &> /ioc-logs/sirius-ioc-bo-ps-corrs-diag-ia11t15 & # 3.8%

# keep entry point running
sleep infinity
