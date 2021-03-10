#!/usr/bin/env bash

# CPU usage estimate (ps aux): 25.7%

# sirius-ioc-as-pu-conv.service
/usr/local/bin/sirius-ioc-as-pu-conv.py \
TB-04:PU-InjSept \
BO-01D:PU-InjKckr \
BO-48D:PU-EjeKckr \
TS-01:PU-EjeSeptF \
TS-01:PU-EjeSeptG \
TS-04:PU-InjSeptG-1 \
TS-04:PU-InjSeptG-2 \
TS-04:PU-InjSeptF \
SI-01SA:PU-InjDpKckr \
SI-01SA:PU-InjNLKckr \
SI-01SA:PU-PingH \
SI-19C4:PU-PingV &> /ioc-logs/sirius-ioc-as-pu-conv & # 25.7%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
