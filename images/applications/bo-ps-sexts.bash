#!/usr/bin/env bash

# CPU usage estimate (ps aux): 23.5%

# Sextupoles
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO2 &> /ioc-logs/sirius-ioc-bo-ps-sexts-sf & # 9.5%
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO3 &> /ioc-logs/sirius-ioc-bo-ps-sexts-sd & # 9.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO ".*" "S(F|D)" &> /ioc-logs/sirius-ioc-bo-ps-sexts-diag & # 4.5%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
