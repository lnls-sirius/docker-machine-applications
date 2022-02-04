#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 25.1%

# sirius-ioc-si-ps-quads-qd1.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSA02:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-quads-qd1.log & # 13.8%

# sirius-ioc-si-ps-quads-qd2.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSA05:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-quads-qd2.log & # 11.6%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI Fam "QD.*" &> /ioc-logs/sirius-ioc-si-ps-diag-quads-qd.log & # 2.7%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
