#!/usr/bin/env bash


# AS machshift
/usr/local/bin/sirius-ioc-as-ap-machshift.py &> /ioc-logs/sirius-ioc-as-ap-machshift &


# keep entry point running
sleep infinity
