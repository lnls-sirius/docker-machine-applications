#!/usr/bin/env bash

# CPU usage estimate (ps aux): 20.1%

# BO opticscorr
/usr/local/bin/sirius-ioc-bo-ap-tunecorr.py &> /ioc-logs/sirius-ioc-bo-ap-tunecorr & # 3.5%
/usr/local/bin/sirius-ioc-bo-ap-chromcorr.py &> /ioc-logs/sirius-ioc-bo-ap-chromcorr & # 3.9%

# SI opticscorr
/usr/local/bin/sirius-ioc-si-ap-tunecorr.py &> /ioc-logs/sirius-ioc-si-ap-tunecorr & # 4.0%
/usr/local/bin/sirius-ioc-si-ap-chromcorr.py &> /ioc-logs/sirius-ioc-si-ap-chromcorr & # 8.7%


# keep entry point running
sleep infinity
