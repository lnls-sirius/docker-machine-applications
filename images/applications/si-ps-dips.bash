#!/usr/bin/env bash

# sirius-ioc-si-ps-dipoles.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSD04:CO-PSCtrl-SI &> /ioc-logs/sirius-ioc-si-ps-dipoles &

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI Fam "B1B2-(1|2)" &> /ioc-logs/sirius-ioc-si-ps-diag-dips  &


# keep entry point running
sleep infinity
