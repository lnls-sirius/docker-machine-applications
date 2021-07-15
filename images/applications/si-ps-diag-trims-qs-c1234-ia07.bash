#!/usr/bin/env bash

# CPU usage estimate (ps aux): 8.6%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "07C[1-4]" "Q.*" &> /ioc-logs/sirius-ioc-si-ps-diag-trims-qs-c1234-ia07.log & # 8.6%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
