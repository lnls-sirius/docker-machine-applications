#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux):

/usr/local/bin/sirius-ioc-bl-ap-imgproc-caxdvf2.py &

# /usr/local/bin/sirius-ioc-bl-ap-imgproc-caxdvf1.py &

# keep entry point running
sleep infinity
