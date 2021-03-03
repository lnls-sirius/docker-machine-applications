#!/usr/bin/env bash


/usr/local/bin/sirius-ioc-as-ps.py IA-11RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia11 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-12RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia12 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-13RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia13 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-14RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia14 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-15RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia15 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-16RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia16 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-17RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia17 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-18RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia18 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-19RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia19 & # 4.7%
/usr/local/bin/sirius-ioc-as-ps.py IA-20RaCtrl:CO-DCLinkCtrl &> /ioc-logs/sirius-ioc-as-ps-dclink-ia20 & # 4.7%


# keep entry point running
sleep infinity
