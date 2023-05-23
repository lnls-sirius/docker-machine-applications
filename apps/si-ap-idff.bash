#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

/usr/local/bin/sirius-ioc-si-ap-idff.py SI-10SB:ID-EPU50 | tee /ioc-logs/sirius-ioc-si-ap-idff-epu50.log & # 4.4%

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
