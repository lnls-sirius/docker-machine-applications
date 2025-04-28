#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux):  # 12.5%

# Lens
/usr/local/bin/sirius-ioc-as-ps.py IT-Ra:CO-PSCtrl & # 12.5%

# keep entry point running
sleep infinity
