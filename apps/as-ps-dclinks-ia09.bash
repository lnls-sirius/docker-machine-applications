#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 4.7%

/usr/local/bin/sirius-ioc-as-ps.py IA-09RaCtrl:CO-DCLinkCtrl & # 4.7%

# keep entry point running
sleep infinity
