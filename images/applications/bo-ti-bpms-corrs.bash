#!/usr/bin/env bash


# sirius-ioc-bo-ti-trig-bpms.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s bo-bpms >& /ioc-logs/sirius-ioc-bo-ti-trig-bpms &

# sirius-ioc-bo-ti-trig-corrs.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s bo-corrs >& /ioc-logs/sirius-ioc-bo-ti-trig-corrs &


# keep entry point running
sleep infinity
