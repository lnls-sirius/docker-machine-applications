#!/usr/bin/env bash

# CPU usage estimate (ps aux): 53.8%

# Correctors
/usr/local/bin/sirius-ioc-as-ps.py IA-01RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia01 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-02RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia02 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-04RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia04 & # 12.5%
/usr/local/bin/sirius-ioc-as-ps.py IA-05RaCtrl:CO-PSCtrl-BO &> /ioc-logs/sirius-ioc-bo-ps-corrs-ia05 & # 12.5%

# Diagnostics
/usr/local/bin/sirius-ioc-as-ps-diag.py BO "(0[1-9]|1[0-3]).*" "(CH|CV|QS)" &> /ioc-logs/sirius-ioc-bo-ps-corrs-diag-ia01t05 & # 3.8%


# keep entry point running
sleep infinity
