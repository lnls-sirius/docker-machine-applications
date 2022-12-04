#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux):

/usr/local/bin/sirius-ioc-si-id-epu50.py \
    --pv-prefix SI-10SB:ID-EPU50: \
    --drive-io-port 5050 \
    --drive-msg-port 5052 \
    --beaglebone-addr 10.128.110.160 \
    --autosave-dir /ioc-logs/autosave \
    --request-file /ioc-logs/source/autosave_epu.req \
| tee /ioc-logs/sirius-ioc-si-id-epu50.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
