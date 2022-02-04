#!/usr/bin/env bash
export PYTHONUNBUFFERED=yes
# CPU usage estimate (ps aux): 26.8%

# sirius-ioc-as-ti-trig.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s as >& /ioc-logs/sirius-ioc-as-ti-trig & # 3.7%

# sirius-ioc-li-ti-trig.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s li >& /ioc-logs/sirius-ioc-li-ti-trig & # 4.2%

# sirius-ioc-tb-ti-trig.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s tb >& /ioc-logs/sirius-ioc-tb-ti-trig & # 4.0%

# sirius-ioc-bo-ti-trig.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s bo >& /ioc-logs/sirius-ioc-bo-ti-trig & # 4.5%

# sirius-ioc-ts-ti-trig.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s ts >& /ioc-logs/sirius-ioc-ts-ti-trig & # 4.5%

# sirius-ioc-si-ti-trig.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s si >& /ioc-logs/sirius-ioc-si-ti-trig & # 5.9%


# run cron for log rotation
cron &

# keep entry point running
sleep infinity
