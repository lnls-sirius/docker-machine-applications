#!/usr/bin/env bash

# CPU usage estimate (ps aux): 29.9%

# Quadrupoles
/usr/local/bin/sirius-ioc-as-ps.py LA-RaCtrl:CO-PSCtrl-TB1 &> /ioc-logs/sirius-ioc-tb-ps-quads & # 27.7%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py TB ".*" "Q.*" &> /ioc-logs/sirius-ioc-tb-ps-diag-quads & # 2.2%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
