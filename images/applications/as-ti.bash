#!/usr/bin/env bash


# sirius-ioc-as-ti-trig.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s as >& /ioc-logs/sirius-ioc-as-ti-trig &

# sirius-ioc-li-ti-trig.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s li >& /ioc-logs/sirius-ioc-li-ti-trig &

# sirius-ioc-tb-ti-trig.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s tb >& /ioc-logs/sirius-ioc-tb-ti-trig &

# sirius-ioc-bo-ti-trig.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s bo >& /ioc-logs/sirius-ioc-bo-ti-trig &

# sirius-ioc-ts-ti-trig.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s ts >& /ioc-logs/sirius-ioc-ts-ti-trig &

# sirius-ioc-si-ti-trig.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s si >& /ioc-logs/sirius-ioc-si-ti-trig &

# sirius-ioc-bo-ti-trig-bpms.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s bo-bpms >& /ioc-logs/sirius-ioc-bo-ti-trig-bpms &

# sirius-ioc-bo-ti-trig-corrs.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s bo-corrs >& /ioc-logs/sirius-ioc-bo-ti-trig-corrs &

# sirius-ioc-si-ti-trig-bpms.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s si-bpms >& /ioc-logs/sirius-ioc-si-ti-trig-bpms &

# sirius-ioc-si-ti-trig-corrs.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s si-corrs >& /ioc-logs/sirius-ioc-si-ti-trig-corrs &

# sirius-ioc-si-ti-trig-qtrims.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s si-qtrims >& /ioc-logs/sirius-ioc-si-ti-trig-qtrims &

# sirius-ioc-si-ti-trig-skews.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s si-skews >& /ioc-logs/sirius-ioc-si-ti-trig-skews &


# keep entry point running
sleep infinity
