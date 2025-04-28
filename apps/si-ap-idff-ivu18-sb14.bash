#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-si-ap-idff.py SI-14SB:ID-IVU18 & # 4.4%

# keep entry point running
sleep infinity
