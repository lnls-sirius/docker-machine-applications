#!/usr/bin/env bash


# TB and TS DClinks
/usr/local/bin/sirius-ioc-as-ps.py LA-RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-tbts &

# Dipole DCLink
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSE05:CO-PSCtrl-BO2 &> /ioc-logs/sirius-ioc-bo-ps-dipole-1-dclink &
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSF05:CO-PSCtrl-BO2 &> /ioc-logs/sirius-ioc-bo-ps-dipole-2-dclink &


# keep entry point running
sleep infinity
