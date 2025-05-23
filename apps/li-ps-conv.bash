#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 14.5%

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
LI-01:PS-CH-7 & # 14.5%
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

# keep entry point running
sleep infinity
