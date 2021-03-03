#!/usr/bin/env bash

/usr/local/bin/sirius-ioc-as-ps.py IA-11RaCtrl:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia11 & # 35.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-12RaCtrl:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia12 & # 35.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-13RaCtrl:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia13 & # 35.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-14RaCtrl:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia14 & # 35.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-15RaCtrl:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia15 & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "1[1-5]M(1|2)" "Q.*" &> /ioc-logs/sirius-ioc-si-ps-diag-trims-m12-ia11t15 & # 8.6%

# keep entry point running
sleep infinity
