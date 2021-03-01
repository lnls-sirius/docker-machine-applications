#!/usr/bin/env bash


# Spectrometer
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Spect &> /ioc-logs/sirius-ioc-li-ps-spect &

# Quads
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-QD1  &> /ioc-logs/sirius-ioc-li-ps-qd1 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-QD2  &> /ioc-logs/sirius-ioc-li-ps-qd2 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-QF1 &> /ioc-logs/sirius-ioc-li-ps-qf1 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-QF2 &> /ioc-logs/sirius-ioc-li-ps-qf2 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-QF3  &> /ioc-logs/sirius-ioc-li-ps-qf3 &

# Lens
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Lens-1  &> /ioc-logs/sirius-ioc-li-ps-lens1 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Lens-2  &> /ioc-logs/sirius-ioc-li-ps-lens2 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Lens-3  &> /ioc-logs/sirius-ioc-li-ps-lens3 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Lens-4  &> /ioc-logs/sirius-ioc-li-ps-lens4 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-LensRev &> /ioc-logs/sirius-ioc-li-ps-lensrev &


# keep entry point running
sleep infinity