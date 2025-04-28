#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 26.4%

# Spectrometer
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Spect & # 2.4%

# Quads
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-QD1  & # 2.4%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-QD2  & # 2.4%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-QF1 & # 2.4%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-QF2 & # 2.4%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-QF3  & # 2.4%

# Lens
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Lens-1  & # 2.4%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Lens-2  & # 2.4%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Lens-3  & # 2.4%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Lens-4  & # 2.4%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-LensRev & # 2.4%

# keep entry point running
sleep infinity
