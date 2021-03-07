#!/usr/bin/env bash

# CPU usage estimate (ps aux): 14.4%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py IA-20RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia20 & # 12.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO "4(7|9)(U|D)" "(CH|CV)" &> /ioc-logs/sirius-ioc-bo-ps-corrs-diag-ia20 & # 1.9%


# keep entry point running
sleep infinity
