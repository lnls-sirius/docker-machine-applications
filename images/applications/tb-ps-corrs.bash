#!/usr/bin/env bash

# CPU usage estimate (ps aux): 29.9%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py LA-RaCtrl:CO-PSCtrl-TB2 &> /ioc-logs/sirius-ioc-tb-ps-corrs & # 27.7%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py TB ".*" "C.*" &> /ioc-logs/sirius-ioc-tb-ps-diag & # 2.2%


# keep entry point running
sleep infinity
