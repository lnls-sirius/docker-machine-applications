#!/usr/bin/env bash

# sirius-ioc-si-ps-quadrupoles-qd1.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSA02:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-quadrupoles-qd1 & # 13.8%

# sirius-ioc-si-ps-quadrupoles-qd2.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSA05:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-quadrupoles-qd2 & # 11.6%

# sirius-ioc-si-ps-quadrupoles-qf.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSA02:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-quadrupoles-qf & # 14.3%

# sirius-ioc-si-ps-quadrupoles-q.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSA05:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-quadrupoles-q & # 22.7%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI Fam "Q.*" &> /ioc-logs/sirius-ioc-si-ps-diag-quads & # 5.3%


# keep entry point running
sleep infinity
