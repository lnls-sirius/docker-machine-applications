#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 70.7%

# sirius-ioc-si-ps-dipoles.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSD04:CO-PSCtrl-SI & # 66.6%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI Fam "B1B2-(1|2)" & # 4.1%

# keep entry point running
sleep infinity
