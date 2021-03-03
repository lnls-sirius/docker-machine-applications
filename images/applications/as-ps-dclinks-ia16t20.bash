#!/usr/bin/env bash

# CPU usage estimate (ps aux): 23.5%

/usr/local/bin/sirius-ioc-as-ps.py IA-16RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia16 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-17RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia17 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-18RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia18 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-19RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia19 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-20RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia20 & # 4.7%


# keep entry point running
sleep infinity
