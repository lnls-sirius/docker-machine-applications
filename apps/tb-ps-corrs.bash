#!/usr/bin/env bash

# CPU usage estimate (ps aux): 29.9%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py LA-RaCtrl:CO-PSCtrl-TB2 &> /ioc-logs/sirius-ioc-tb-ps-corrs.log & # 27.7%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py TB ".*" "C.*" &> /ioc-logs/sirius-ioc-tb-ps-diag-corrs.log & # 2.2%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
