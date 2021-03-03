#!/usr/bin/env bash

# CPU usage estimate (ps aux): 28.5%

# sirius-ioc-si-ps-sexts-sfb12-sdb3.service
# SI-Fam:PS-SDB3
# SI-Fam:PS-SFB1
# SI-Fam:PS-SFB2
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSB09:CO-PSCtrl-SI1 &> /ioc-logs/sirius-ioc-si-ps-sfb12-sdb3 & # 12.0%

# sirius-ioc-si-ps-sexts-sfp12-sdp23.service
# SI-Fam:PS-SFP2
# SI-Fam:PS-SFP1
# SI-Fam:PS-SDP3
# SI-Fam:PS-SDP2
/usr/local/bin/sirius-ioc-as-ps.py PA-RaPSB09:CO-PSCtrl-SI2 &> /ioc-logs/sirius-ioc-si-ps-sfp12-sdp23 & # 14.6%

# Diag
/usr/local/bin/sirius-ioc-as-ps-diag.py SI Fam "S(DB3|FB1|FB2|FP2|FP1|DP3|DP2)" &> /ioc-logs/sirius-ioc-si-ps-diag-sexts-sfb12-sdb3-sfp12-sdp23 & # 1.9%


# keep entry point running
sleep infinity
