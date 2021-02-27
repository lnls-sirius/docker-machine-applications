#!/usr/bin/env bash

/usr/local/bin/sirius-ioc-tb-ap-sofb.py &> /ioc-logs/sirius-ioc-tb-ap-sofb &
/usr/local/bin/sirius-ioc-bo-ap-sofb.py &> /ioc-logs/sirius-ioc-bo-ap-sofb &
/usr/local/bin/sirius-ioc-ts-ap-sofb.py &> /ioc-logs/sirius-ioc-ts-ap-sofb &

# keep entry point running
sleep infinity
