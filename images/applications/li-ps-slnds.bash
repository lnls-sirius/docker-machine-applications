#!/usr/bin/env bash


# Solenoids
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-1  &> /ioc-logs/sirius-ioc-li-ps-solenoid-1 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-2  &> /ioc-logs/sirius-ioc-li-ps-solenoid-2 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-3  &> /ioc-logs/sirius-ioc-li-ps-solenoid-3 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-4  &> /ioc-logs/sirius-ioc-li-ps-solenoid-4 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-5  &> /ioc-logs/sirius-ioc-li-ps-solenoid-5 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-6  &> /ioc-logs/sirius-ioc-li-ps-solenoid-6 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-7  &> /ioc-logs/sirius-ioc-li-ps-solenoid-7 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-8  &> /ioc-logs/sirius-ioc-li-ps-solenoid-8 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-9  &> /ioc-logs/sirius-ioc-li-ps-solenoid-9 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-10 &> /ioc-logs/sirius-ioc-li-ps-solenoid-10 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-11 &> /ioc-logs/sirius-ioc-li-ps-solenoid-11 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-12 &> /ioc-logs/sirius-ioc-li-ps-solenoid-12 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-13 &> /ioc-logs/sirius-ioc-li-ps-solenoid-13 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-14 &> /ioc-logs/sirius-ioc-li-ps-solenoid-14 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-15 &> /ioc-logs/sirius-ioc-li-ps-solenoid-15 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-16 &> /ioc-logs/sirius-ioc-li-ps-solenoid-16 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-17 &> /ioc-logs/sirius-ioc-li-ps-solenoid-17 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-18 &> /ioc-logs/sirius-ioc-li-ps-solenoid-18 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-19 &> /ioc-logs/sirius-ioc-li-ps-solenoid-19 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-20 &> /ioc-logs/sirius-ioc-li-ps-solenoid-20 & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-21 &> /ioc-logs/sirius-ioc-li-ps-solenoid-21 & # 1.9%


# keep entry point running
sleep infinity
