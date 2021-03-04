#!/usr/bin/env bash

# CPU usage estimate (ps aux): 14.4%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py IA-05RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia05 & # 12.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO "1(1|3)U" "(CH|CV)" &> /ioc-logs/sirius-ioc-bo-ps-corrs-diag-ia05 & # 1.9%


# keep entry point running
sleep infinity
