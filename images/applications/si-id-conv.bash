#!/usr/bin/env bash

# CPU usage estimate (ps aux): 8.8%

# sirius-ioc-si-id-conv.service
/usr/local/bin/sirius-ioc-si-id-conv.py \
SI-06SB:ID-APU22 \
SI-07SP:ID-APU22 \
SI-08SB:ID-APU22 \
SI-09SA:ID-APU22 \
SI-11SP:ID-APU58 &> /ioc-logs/sirius-ioc-si-id-conv & # 8.8%


# keep entry point running
sleep infinity
