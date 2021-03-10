#!/usr/bin/env bash

# CPU usage estimate (ps aux): 17.8%

# TB and TS DClinks
/usr/local/bin/sirius-ioc-as-ps.py LA-RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-tbts & # 4.8%

# Dipole DCLink
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSE05:CO-PSCtrl-BO2 &> /ioc-logs/sirius-ioc-bo-ps-dips-1-dclink & # 6.5%
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSF05:CO-PSCtrl-BO2 &> /ioc-logs/sirius-ioc-bo-ps-dips-2-dclink & # 6.5%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
