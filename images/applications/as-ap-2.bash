#!/usr/bin/env bash


# BO opticscorr
/usr/local/bin/sirius-ioc-bo-ap-tunecorr.py &> /ioc-logs/sirius-ioc-bo-ap-tunecorr &
/usr/local/bin/sirius-ioc-bo-ap-chromcorr.py &> /ioc-logs/sirius-ioc-bo-ap-chromcorr &

# SI opticscorr
/usr/local/bin/sirius-ioc-si-ap-tunecorr.py &> /ioc-logs/sirius-iocsio-ap-tunecorr &
/usr/local/bin/sirius-ioc-si-ap-chromcorr.py &> /ioc-logs/sirius-ioc-si-ap-chromcorr &

# TB and TS posang
/usr/local/bin/sirius-ioc-tb-ap-posang.py &> /ioc-logs/sirius-ioc-tb-ap-posang &
/usr/local/bin/sirius-ioc-ts-ap-posang.py &> /ioc-logs/sirius-ioc-ts-ap-posang &

# AS machshift
/usr/local/bin/sirius-ioc-as-ap-machshift.py &> /ioc-logs/sirius-ioc-as-ap-machshift &


# keep entry point running
sleep infinity
