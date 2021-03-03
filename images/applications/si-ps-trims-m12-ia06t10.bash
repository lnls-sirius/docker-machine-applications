#!/usr/bin/env bash

/usr/local/bin/sirius-ioc-as-ps.py IA-06RaCtrl:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia06 & # 35.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-07RaCtrl:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia07 & # 35.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-08RaCtrl:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia08 & # 35.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-09RaCtrl:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia09 & # 35.0%
/usr/local/bin/sirius-ioc-as-ps.py IA-10RaCtrl:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-trims-qs-m12-ia10 & # 35.0%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI "(0[6-9]|10)M(1|2)" "Q.*" &> /ioc-logs/sirius-ioc-si-ps-diag-trims-m12-ia06t10 & # 8.6%

# keep entry point running
sleep infinity
