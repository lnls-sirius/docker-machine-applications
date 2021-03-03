#!/usr/bin/env bash

# CPU usage estimate (ps aux): 23.5%

/usr/local/bin/sirius-ioc-as-ps.py IA-06RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia06 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-07RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia07 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-08RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia08 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-09RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia09 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-10RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia10 & # 4.7%


# keep entry point running
sleep infinity
