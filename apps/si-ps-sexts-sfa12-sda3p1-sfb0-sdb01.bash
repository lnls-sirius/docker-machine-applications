#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 27.9%

# sirius-ioc-si-ps-sexts-sfa12-sda3p1.service
# SI-Fam:PS-SFA1
# SI-Fam:PS-SDA3
# SI-Fam:PS-SDP1
# SI-Fam:PS-SFA2
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSB06:CO-PSCtrl-SI2 & # 14.4%

# sirius-ioc-si-ps-sexts-sfb0-sdb01.service
# SI-Fam:PS-SDB1
# SI-Fam:PS-SFB0
# SI-Fam:PS-SDB0
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSB02:CO-PSCtrl-SI1 & # 11.6%


# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI Fam "S(FA1|DA3|DP1|FA2|DB1|FB0|DB0)" & # 1.9%

# keep entry point running
sleep infinity
