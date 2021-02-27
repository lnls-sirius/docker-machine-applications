#!/usr/bin/env bash


/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Spect &> /ioc-logs/sirius-ioc-li-ps-spect &

# CHs
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-1 &> /ioc-logs/sirius-ioc-li-ps-ch1 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-2 &> /ioc-logs/sirius-ioc-li-ps-ch2 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-3 &> /ioc-logs/sirius-ioc-li-ps-ch3 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-4 &> /ioc-logs/sirius-ioc-li-ps-ch4 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-5 &> /ioc-logs/sirius-ioc-li-ps-ch5 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-6 &> /ioc-logs/sirius-ioc-li-ps-ch6 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CH-7 &> /ioc-logs/sirius-ioc-li-ps-ch7 &

# CVs
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-1 &> /ioc-logs/sirius-ioc-li-ps-cv1 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-2 &> /ioc-logs/sirius-ioc-li-ps-cv2 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-3 &> /ioc-logs/sirius-ioc-li-ps-cv3 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-4 &> /ioc-logs/sirius-ioc-li-ps-cv4 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-5 &> /ioc-logs/sirius-ioc-li-ps-cv5 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-6 &> /ioc-logs/sirius-ioc-li-ps-cv6 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-CV-7 &> /ioc-logs/sirius-ioc-li-ps-cv7 &

# Lens
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Lens-1  &> /ioc-logs/sirius-ioc-li-ps-lens1 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Lens-2  &> /ioc-logs/sirius-ioc-li-ps-lens2 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Lens-3  &> /ioc-logs/sirius-ioc-li-ps-lens3 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Lens-4  &> /ioc-logs/sirius-ioc-li-ps-lens4 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-LensRev &> /ioc-logs/sirius-ioc-li-ps-lensrev &

# Quads
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-QD1  &> /ioc-logs/sirius-ioc-li-ps-qd1 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-QD2  &> /ioc-logs/sirius-ioc-li-ps-qd2 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-QF1 &> /ioc-logs/sirius-ioc-li-ps-qf1 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-QF2 &> /ioc-logs/sirius-ioc-li-ps-qf2 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-QF3  &> /ioc-logs/sirius-ioc-li-ps-qf3 &

# Solenoids
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-1  &> /ioc-logs/sirius-ioc-li-ps-solenoid-1 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-2  &> /ioc-logs/sirius-ioc-li-ps-solenoid-2 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-3  &> /ioc-logs/sirius-ioc-li-ps-solenoid-3 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-4  &> /ioc-logs/sirius-ioc-li-ps-solenoid-4 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-5  &> /ioc-logs/sirius-ioc-li-ps-solenoid-5 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-6  &> /ioc-logs/sirius-ioc-li-ps-solenoid-6 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-7  &> /ioc-logs/sirius-ioc-li-ps-solenoid-7 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-8  &> /ioc-logs/sirius-ioc-li-ps-solenoid-8 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-9  &> /ioc-logs/sirius-ioc-li-ps-solenoid-9 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-10 &> /ioc-logs/sirius-ioc-li-ps-solenoid-10 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-11 &> /ioc-logs/sirius-ioc-li-ps-solenoid-11 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-12 &> /ioc-logs/sirius-ioc-li-ps-solenoid-12 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-01:PS-Slnd-13 &> /ioc-logs/sirius-ioc-li-ps-solenoid-13 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-14 &> /ioc-logs/sirius-ioc-li-ps-solenoid-14 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-15 &> /ioc-logs/sirius-ioc-li-ps-solenoid-15 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-16 &> /ioc-logs/sirius-ioc-li-ps-solenoid-16 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-17 &> /ioc-logs/sirius-ioc-li-ps-solenoid-17 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-18 &> /ioc-logs/sirius-ioc-li-ps-solenoid-18 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-19 &> /ioc-logs/sirius-ioc-li-ps-solenoid-19 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-20 &> /ioc-logs/sirius-ioc-li-ps-solenoid-20 &
/usr/local/bin/sirius-ioc-li-ps.py -n LI-Fam:PS-Slnd-21 &> /ioc-logs/sirius-ioc-li-ps-solenoid-21 &

# Conv
/usr/local/bin/sirius-ioc-li-ps-conv.py \
LI-01:PS-Spect \
LI-Fam:PS-QF1 \
LI-Fam:PS-QF2 \
LI-01:PS-QF3 \
LI-01:PS-QD1 \
LI-01:PS-QD2 \
LI-01:PS-CV-1 \
LI-01:PS-CH-1 \
LI-01:PS-CV-2 \
LI-01:PS-CH-2 \
LI-01:PS-CV-3 \
LI-01:PS-CH-3 \
LI-01:PS-CV-4 \
LI-01:PS-CH-4 \
LI-01:PS-CV-5 \
LI-01:PS-CH-5 \
LI-01:PS-CV-6 \
LI-01:PS-CH-6 \
LI-01:PS-CV-7 \
LI-01:PS-CH-7 &> /ioc-logs/sirius-ioc-li-ps-conv &
# LI-01:PS-LensRev \
# LI-01:PS-Lens-1 \
# LI-01:PS-Lens-2 \
# LI-01:PS-Lens-3 \
# LI-01:PS-Lens-4 \
# LI-01:PS-Slnd-1 \
# LI-01:PS-Slnd-2 \
# LI-01:PS-Slnd-3 \
# LI-01:PS-Slnd-4 \
# LI-01:PS-Slnd-5 \
# LI-01:PS-Slnd-6 \
# LI-01:PS-Slnd-7 \
# LI-01:PS-Slnd-8 \
# LI-01:PS-Slnd-9 \
# LI-01:PS-Slnd-10 \
# LI-01:PS-Slnd-11 \
# LI-01:PS-Slnd-12 \
# LI-01:PS-Slnd-13 \
# LI-Fam:PS-Slnd-14 \
# LI-Fam:PS-Slnd-15 \
# LI-Fam:PS-Slnd-16 \
# LI-Fam:PS-Slnd-17 \
# LI-Fam:PS-Slnd-18 \
# LI-Fam:PS-Slnd-19 \
# LI-Fam:PS-Slnd-20 \
# LI-Fam:PS-Slnd-21 \

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py LI ".*" ".*" &> /ioc-logs/sirius-ioc-li-ps-diag &


# keep entry point running
sleep infinity