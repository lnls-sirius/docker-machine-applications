#!/usr/bin/env bash


# TB and TS posang
/usr/local/bin/sirius-ioc-tb-ap-posang.py &> /ioc-logs/sirius-ioc-tb-ap-posang &
/usr/local/bin/sirius-ioc-ts-ap-posang.py &> /ioc-logs/sirius-ioc-ts-ap-posang &


# keep entry point running
sleep infinity
