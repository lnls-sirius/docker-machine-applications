#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 10.6%

# sirius-ioc-bo-ti-trig-bpms.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s bo-bpms & # 5.2%

# sirius-ioc-bo-ti-trig-corrs.service
/usr/local/bin/sirius-ioc-as-ti-control.py -s bo-corrs & # 5.4%

# keep entry point running
sleep infinity
