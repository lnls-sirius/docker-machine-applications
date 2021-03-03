#!/usr/bin/env bash

# CPU usage estimate (ps aux): 17.9%

/usr/local/bin/sirius-ioc-tb-ap-sofb.py &> /ioc-logs/sirius-ioc-tb-ap-sofb & # 5.8%
/usr/local/bin/sirius-ioc-bo-ap-sofb.py &> /ioc-logs/sirius-ioc-bo-ap-sofb & # 6.4%
/usr/local/bin/sirius-ioc-ts-ap-sofb.py &> /ioc-logs/sirius-ioc-ts-ap-sofb & # 5.7%

# keep entry point running
sleep infinity
