#!/usr/bin/env bash


# li-ap-energy
/usr/local/bin/sirius-ioc-li-ap-energy.py &> /ioc-logs/sirius-ioc-li-ap-energy &


# keep entry point running
sleep infinity
