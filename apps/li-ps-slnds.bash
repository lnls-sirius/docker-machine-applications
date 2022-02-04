#!/usr/bin/env bash
export PYTHONUNBUFFERED=yes
# CPU usage estimate (ps aux): 39.9%

# Solenoids
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-1  &> /ioc-logs/sirius-ioc-li-ps-solenoid-1.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-2  &> /ioc-logs/sirius-ioc-li-ps-solenoid-2.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-3  &> /ioc-logs/sirius-ioc-li-ps-solenoid-3.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-4  &> /ioc-logs/sirius-ioc-li-ps-solenoid-4.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-5  &> /ioc-logs/sirius-ioc-li-ps-solenoid-5.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-6  &> /ioc-logs/sirius-ioc-li-ps-solenoid-6.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-7  &> /ioc-logs/sirius-ioc-li-ps-solenoid-7.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-8  &> /ioc-logs/sirius-ioc-li-ps-solenoid-8.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-9  &> /ioc-logs/sirius-ioc-li-ps-solenoid-9.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-10 &> /ioc-logs/sirius-ioc-li-ps-solenoid-10.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-11 &> /ioc-logs/sirius-ioc-li-ps-solenoid-11.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-12 &> /ioc-logs/sirius-ioc-li-ps-solenoid-12.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-13 &> /ioc-logs/sirius-ioc-li-ps-solenoid-13.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-14 &> /ioc-logs/sirius-ioc-li-ps-solenoid-14.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-15 &> /ioc-logs/sirius-ioc-li-ps-solenoid-15.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-16 &> /ioc-logs/sirius-ioc-li-ps-solenoid-16.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-17 &> /ioc-logs/sirius-ioc-li-ps-solenoid-17.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-18 &> /ioc-logs/sirius-ioc-li-ps-solenoid-18.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-19 &> /ioc-logs/sirius-ioc-li-ps-solenoid-19.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-20 &> /ioc-logs/sirius-ioc-li-ps-solenoid-20.log & # 1.9%
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-21 &> /ioc-logs/sirius-ioc-li-ps-solenoid-21.log & # 1.9%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
