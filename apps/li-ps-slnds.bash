#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 39.9%

# Solenoids
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-1  & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-2  & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-3  & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-4  & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-5  & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-6  & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-7  & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-8  & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-9  & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-10 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-11 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-12 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-13 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-14 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-15 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-16 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-17 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-18 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-19 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-20 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-21 & # 1.9%

# keep entry point running
sleep infinity
