#!/usr/bin/env bash

# CPU usage estimate (ps aux): 183.6%

/usr/local/bin/sirius-ioc-as-ps.py IA-16RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia16 & # 35.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-17RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia17 & # 35.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-18RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia18 & # 35.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-19RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia19 & # 35.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-20RaCtrl:CO-PSCtrl-SI3 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-c1234-ia20 & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(1[6-9]|20)C[1-4]" "Q.*" &> /ioc-logs/sirius-ioc-si-ps-diag-trims-c1234-ia16t20 & # 8.6%


# keep entry point running
sleep infinity
