#!/usr/bin/env bash

# CPU usage estimate (ps aux): 4.7%

/usr/local/bin/sirius-ioc-as-ps.py IA-04RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia04 & # 4.7%


# keep entry point running
sleep infinity
