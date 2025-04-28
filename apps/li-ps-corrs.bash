#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 32.2%

# CHs
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-1 & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-2 & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-3 & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-4 & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-5 & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-6 & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-7 & # 2.3%

# CVs
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-1 & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-2 & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-3 & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-4 & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-5 & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-6 & # 2.3%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-7 & # 2.3%

# keep entry point running
sleep infinity
