#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-si-ap-idff.py SI-08SB:ID-IVU18 & # 4.4%

# keep entry point running
sleep infinity
