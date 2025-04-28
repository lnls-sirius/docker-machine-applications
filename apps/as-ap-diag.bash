#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 19.3%

# sirius-ioc-as-pu-diag.service
/usr/local/bin/sirius-ioc-as-pu-diag.py & # 8.2%

# sirius-ioc-as-rf-diag.service
/usr/local/bin/sirius-ioc-as-rf-diag.py & # 4.9%

# sirius-ioc-li-ap-diag.service
/usr/local/bin/sirius-ioc-li-ap-diag.py & # 6.2%

# keep entry point running
sleep infinity
