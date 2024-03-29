#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 26.4%

# Spectrometer
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Spect | tee /ioc-logs/sirius-ioc-li-ps-spect.log & # 2.4%

# Quads
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-QD1  | tee /ioc-logs/sirius-ioc-li-ps-qd1.log & # 2.4%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-QD2  | tee /ioc-logs/sirius-ioc-li-ps-qd2.log & # 2.4%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-QF1 | tee /ioc-logs/sirius-ioc-li-ps-qf1.log & # 2.4%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-QF2 | tee /ioc-logs/sirius-ioc-li-ps-qf2.log & # 2.4%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-QF3  | tee /ioc-logs/sirius-ioc-li-ps-qf3.log & # 2.4%

# Lens
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Lens-1  | tee /ioc-logs/sirius-ioc-li-ps-lens1.log & # 2.4%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Lens-2  | tee /ioc-logs/sirius-ioc-li-ps-lens2.log & # 2.4%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Lens-3  | tee /ioc-logs/sirius-ioc-li-ps-lens3.log & # 2.4%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Lens-4  | tee /ioc-logs/sirius-ioc-li-ps-lens4.log & # 2.4%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-LensRev | tee /ioc-logs/sirius-ioc-li-ps-lensrev.log & # 2.4%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
