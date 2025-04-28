#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 20.1%

# BO opticscorr
/usr/local/bin/sirius-ioc-bo-ap-tunecorr.py & # 3.5%
/usr/local/bin/sirius-ioc-bo-ap-chromcorr.py & # 3.9%

# SI opticscorr
/usr/local/bin/sirius-ioc-si-ap-tunecorr.py & # 4.0%
/usr/local/bin/sirius-ioc-si-ap-chromcorr.py & # 8.7%

# keep entry point running
sleep infinity
