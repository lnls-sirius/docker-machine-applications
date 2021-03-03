#!/usr/bin/env bash

# CPU usage estimate (ps aux): 23.5%

# Sextupoles
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO2 &> /ioc-logs/sirius-ioc-bo-ps-sextupole-sf & # 9.5%
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO3 &> /ioc-logs/sirius-ioc-bo-ps-sextupole-sd & # 9.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO ".*" "S(F|D)" &> /ioc-logs/sirius-ioc-bo-ps-sextupoles-diag & # 4.5%


# keep entry point running
sleep infinity
