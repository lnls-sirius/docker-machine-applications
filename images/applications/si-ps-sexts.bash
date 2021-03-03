#!/usr/bin/env bash

# sirius-ioc-si-ps-sextupoles-sda12b2.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSB06:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-sda12b2  & # 11.9%

# sirius-ioc-si-ps-sextupoles-sfa0p0-sda0p0.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSB02:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-sfa0p0-sda0p0  & # 14.2%

# sirius-ioc-si-ps-sextupoles-sfa12-sda3p1.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSB06:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-sfa12-sda3p1  & # 14.4%

# sirius-ioc-si-ps-sextupoles-sfb0-sdb01.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSB02:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-sfb0-sdb01  & # 11.6%

# sirius-ioc-si-ps-sextupoles-sfb12-sdb3.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSB09:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-sfb12-sdb3  & # 12.0%

# sirius-ioc-si-ps-sextupoles-sfp12-sdp23.service
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSB09:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-sfp12-sdp23  & # 14.6%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI Fam "S.*" &> /ioc-logs/sirius-ioc-si-ps-diag-sexts  & # 5.8%


# keep entry point running
sleep infinity
