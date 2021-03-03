#!/usr/bin/env bash

# CPU usage estimate (ps aux): 47.0%

/usr/local/bin/sirius-ioc-as-ps.py IA-11RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia11 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-12RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia12 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-13RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia13 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-14RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia14 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-15RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia15 & # 4.7%


# keep entry point running
sleep infinity
