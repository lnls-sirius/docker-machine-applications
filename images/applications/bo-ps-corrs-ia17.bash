#!/usr/bin/env bash

# CPU usage estimate (ps aux): 14.4%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py IA-17RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia17 & # 12.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO "4(3|5)U" "(CH|CV)" &> /ioc-logs/sirius-ioc-bo-ps-corrs-diag-ia17 & # 1.9%


# keep entry point running
sleep infinity
