#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-as-ti-control.py -s si & # 5.9%

# keep entry point running
sleep infinity
