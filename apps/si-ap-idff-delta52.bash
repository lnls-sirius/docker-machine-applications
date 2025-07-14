#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-si-ap-idff.py SI-10SB:ID-DELTA52 & # 4.4%

# keep entry point running
sleep infinity
