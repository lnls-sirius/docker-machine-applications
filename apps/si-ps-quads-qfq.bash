#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 39.7%

# sirius-ioc-si-ps-quads-qf.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSA02:CO-PSCtrl-SI1 & # 14.3%

# sirius-ioc-si-ps-quads-q.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSA05:CO-PSCtrl-SI2 & # 22.7%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI Fam "Q(F|[1-4]).*" & # 2.7%

# keep entry point running
sleep infinity
