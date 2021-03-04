#!/usr/bin/env bash

# CPU usage estimate (ps aux): 23.5%%

/usr/local/bin/sirius-ioc-as-ps.py IA-01RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia01 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-02RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia02 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-03RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia03 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-04RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia04 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-05RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia05 & # 4.7%


# keep entry point running
sleep infinity
