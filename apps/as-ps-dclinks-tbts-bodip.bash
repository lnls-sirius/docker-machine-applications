#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 17.8%

# TB and TS DClinks
/usr/local/bin/sirius-ioc-as-ps.py LA-RaCtrl:CO-DCLinkCtrl & # 4.8%

# Dipole DCLink
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSE05:CO-PSCtrl-BO2 & # 6.5%
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSF05:CO-PSCtrl-BO2 & # 6.5%

# keep entry point running
sleep infinity
