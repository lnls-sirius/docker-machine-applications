#!/usr/bin/env bash


# sirius-ioc-si-ti-trig-qtrims.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s si-qtrims >& /ioc-logs/sirius-ioc-si-ti-trig-qtrims & # 7.1%

# sirius-ioc-si-ti-trig-skews.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s si-skews >& /ioc-logs/sirius-ioc-si-ti-trig-skews & # 6.3%


# keep entry point running
sleep infinity
