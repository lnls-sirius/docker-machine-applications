#!/usr/bin/env bash

# CPU usage estimate (ps aux): 39.7%

# sirius-ioc-si-ps-quads-qf.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSA02:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-quads-qf & # 14.3%

# sirius-ioc-si-ps-quads-q.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSA05:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-quads-q & # 22.7%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI Fam "Q(F|[1-4]).*" &> /ioc-logs/sirius-ioc-si-ps-diag-quads-qfq & # 2.7%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
