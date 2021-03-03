#!/usr/bin/env bash

/usr/local/bin/sirius-ioc-as-ps.py IA-11RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia11 & # 25.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-12RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia12 & # 25.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-13RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia13 & # 25.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-14RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia14 & # 25.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-15RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia15 & # 25.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "1[1-5]C[1-4]" "Q.*" &> /ioc-logs/sirius-ioc-si-ps-diag-trims-c1234-ia11t15 & # 8.6%


# keep entry point running
sleep infinity
