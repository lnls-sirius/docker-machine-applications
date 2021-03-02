#!/usr/bin/env bash


# sirius-ioc-si-id-conv.service
/usr/local/bin/sirius-ioc-si-id-conv.py \
SI-06SB:ID-APU22 \
SI-07SP:ID-APU22 \
SI-08SB:ID-APU22 \
SI-09SA:ID-APU22 \
SI-11SP:ID-APU58 &> /ioc-logs/sirius-ioc-si-id-conv &


# keep entry point running
sleep infinity
