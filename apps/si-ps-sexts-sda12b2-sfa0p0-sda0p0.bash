#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# CPU usage estimate (ps aux): 28.0%

# sirius-ioc-si-ps-sexts-sda12b2.service
# SI-Fam:PS-SDB2
# SI-Fam:PS-SDA2
# SI-Fam:PS-SDA1
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSB06:CO-PSCtrl-SI1 & # 11.9%

# sirius-ioc-si-ps-sexts-sfa0p0-sda0p0.service
# SI-Fam:PS-SFP0
# SI-Fam:PS-SFA0
# SI-Fam:PS-SDP0
# SI-Fam:PS-SDA0
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSB02:CO-PSCtrl-SI2 & # 14.2%


# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI Fam "S(DB2|DA2|DA1|FP0|FA0|DP0|DA0)" & # 1.9%

# keep entry point running
sleep infinity
