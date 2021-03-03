#!/usr/bin/env bash

# CPU usage estimate (ps aux): 41.3%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py IA-07RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia07 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-08RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia08 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-10RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia10 & # 12.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO "(1[5-9]|2[0-5]).*" "(CH|CV|QS)" &> /ioc-logs/sirius-ioc-bo-ps-corrs-diag-ia06t10 & # 3.8%


# keep entry point running
sleep infinity
