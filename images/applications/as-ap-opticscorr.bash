#!/usr/bin/env bash


# BO opticscorr
/usr/local/bin/sirius-ioc-bo-ap-tunecorr.py &> /ioc-logs/sirius-ioc-bo-ap-tunecorr &
/usr/local/bin/sirius-ioc-bo-ap-chromcorr.py &> /ioc-logs/sirius-ioc-bo-ap-chromcorr &

# SI opticscorr
/usr/local/bin/sirius-ioc-si-ap-tunecorr.py &> /ioc-logs/sirius-ioc-si-ap-tunecorr &
/usr/local/bin/sirius-ioc-si-ap-chromcorr.py &> /ioc-logs/sirius-ioc-si-ap-chromcorr &


# keep entry point running
sleep infinity
