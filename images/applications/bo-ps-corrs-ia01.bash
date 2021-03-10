#!/usr/bin/env bash

# CPU usage estimate (ps aux): 14.4%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py IA-01RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia01 & # 12.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO "0(1|2)(U|D)" "(CH|CV|QS)" &> /ioc-logs/sirius-ioc-bo-ps-corrs-diag-ia01 & # 1.9%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
