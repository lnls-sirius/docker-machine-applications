#!/usr/bin/env bash


# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py LI ".*" ".*" &> /ioc-logs/sirius-ioc-li-ps-diag & # 8.1%


# keep entry point running
sleep infinity
