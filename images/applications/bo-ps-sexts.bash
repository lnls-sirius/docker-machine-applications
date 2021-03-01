#!/usr/bin/env bash

# Sextupoles
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO2 &> /ioc-logs/sirius-ioc-bo-ps-sextupole-sf &
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSC03:CO-PSCtrl-BO3 &> /ioc-logs/sirius-ioc-bo-ps-sextupole-sd &

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO ".*" "S(F|D)" &> /ioc-logs/sirius-ioc-bo-ps-sextupoles-diag &


# keep entry point running
sleep infinity
