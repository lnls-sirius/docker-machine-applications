#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 25.1%

# sirius-ioc-si-ps-quads-qd1.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSA02:CO-PSCtrl-SI2 & # 13.8%

# sirius-ioc-si-ps-quads-qd2.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSA05:CO-PSCtrl-SI1 & # 11.6%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI Fam "QD.*" & # 2.7%

# keep entry point running
sleep infinity
