#!/usr/bin/env bash

# CPU usage estimate (ps aux): %

# NOTE: Temporary commented while IOC still runs in lnlsfac-srv1
#
# /usr/local/bin/sirius-ioc-si-ap-sofb.py &> /ioc-logs/sirius-ioc-si-ap-sofb.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
