#!/usr/bin/env bash

# CPU usage estimate (ps aux): 8.1%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py LI ".*" ".*" &> /ioc-logs/sirius-ioc-li-ps-diag & # 8.1%


# keep entry point running
sleep infinity
