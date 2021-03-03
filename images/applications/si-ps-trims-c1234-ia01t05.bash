#!/usr/bin/env bash

/usr/local/bin/sirius-ioc-as-ps.py IA-01RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia01 & # 35.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-02RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia02 & # 35.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-03RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia03 & # 35.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-04RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia04 & # 35.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-05RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia05 & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "0[1-5]C[1-4]" "Q.*" &> /ioc-logs/sirius-ioc-si-ps-diag-trims-c1234-ia01t05 & # 8.6%


# keep entry point running
sleep infinity
