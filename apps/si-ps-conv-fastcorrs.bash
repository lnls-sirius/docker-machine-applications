#!/usr/bin/env bash

export PYTHONUNBUFFERED=yes

# Diag
/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-01M1:PS-FCH \
SI-01M1:PS-FCV \
SI-01M2:PS-FCH \
SI-01M2:PS-FCV \
SI-01C2:PS-FCH \
SI-01C2:PS-FCV \
SI-01C3:PS-FCH \
SI-01C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia01.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-02M1:PS-FCH \
SI-02M1:PS-FCV \
SI-02M2:PS-FCH \
SI-02M2:PS-FCV \
SI-02C2:PS-FCH \
SI-02C2:PS-FCV \
SI-02C3:PS-FCH \
SI-02C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia02.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-03M1:PS-FCH \
SI-03M1:PS-FCV \
SI-03M2:PS-FCH \
SI-03M2:PS-FCV \
SI-03C2:PS-FCH \
SI-03C2:PS-FCV \
SI-03C3:PS-FCH \
SI-03C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia03.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-04M1:PS-FCH \
SI-04M1:PS-FCV \
SI-04M2:PS-FCH \
SI-04M2:PS-FCV \
SI-04C2:PS-FCH \
SI-04C2:PS-FCV \
SI-04C3:PS-FCH \
SI-04C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia04.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-05M1:PS-FCH \
SI-05M1:PS-FCV \
SI-05M2:PS-FCH \
SI-05M2:PS-FCV \
SI-05C2:PS-FCH \
SI-05C2:PS-FCV \
SI-05C3:PS-FCH \
SI-05C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia05.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-06M1:PS-FCH \
SI-06M1:PS-FCV \
SI-06M2:PS-FCH \
SI-06M2:PS-FCV \
SI-06C2:PS-FCH \
SI-06C2:PS-FCV \
SI-06C3:PS-FCH \
SI-06C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia06.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-07M1:PS-FCH \
SI-07M1:PS-FCV \
SI-07M2:PS-FCH \
SI-07M2:PS-FCV \
SI-07C2:PS-FCH \
SI-07C2:PS-FCV \
SI-07C3:PS-FCH \
SI-07C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia07.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-08M1:PS-FCH \
SI-08M1:PS-FCV \
SI-08M2:PS-FCH \
SI-08M2:PS-FCV \
SI-08C2:PS-FCH \
SI-08C2:PS-FCV \
SI-08C3:PS-FCH \
SI-08C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia08.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-09M1:PS-FCH \
SI-09M1:PS-FCV \
SI-09M2:PS-FCH \
SI-09M2:PS-FCV \
SI-09C2:PS-FCH \
SI-09C2:PS-FCV \
SI-09C3:PS-FCH \
SI-09C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia09.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-10M1:PS-FCH \
SI-10M1:PS-FCV \
SI-10M2:PS-FCH \
SI-10M2:PS-FCV \
SI-10C2:PS-FCH \
SI-10C2:PS-FCV \
SI-10C3:PS-FCH \
SI-10C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia10.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-11M1:PS-FCH \
SI-11M1:PS-FCV \
SI-11M2:PS-FCH \
SI-11M2:PS-FCV \
SI-11C2:PS-FCH \
SI-11C2:PS-FCV \
SI-11C3:PS-FCH \
SI-11C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia11.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-12M1:PS-FCH \
SI-12M1:PS-FCV \
SI-12M2:PS-FCH \
SI-12M2:PS-FCV \
SI-12C2:PS-FCH \
SI-12C2:PS-FCV \
SI-12C3:PS-FCH \
SI-12C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia12.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-13M1:PS-FCH \
SI-13M1:PS-FCV \
SI-13M2:PS-FCH \
SI-13M2:PS-FCV \
SI-13C2:PS-FCH \
SI-13C2:PS-FCV \
SI-13C3:PS-FCH \
SI-13C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia13.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-14M1:PS-FCH \
SI-14M1:PS-FCV \
SI-14M2:PS-FCH \
SI-14M2:PS-FCV \
SI-14C2:PS-FCH \
SI-14C2:PS-FCV \
SI-14C3:PS-FCH \
SI-14C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia14.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-15M1:PS-FCH \
SI-15M1:PS-FCV \
SI-15M2:PS-FCH \
SI-15M2:PS-FCV \
SI-15C2:PS-FCH \
SI-15C2:PS-FCV \
SI-15C3:PS-FCH \
SI-15C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia15.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-16M1:PS-FCH \
SI-16M1:PS-FCV \
SI-16M2:PS-FCH \
SI-16M2:PS-FCV \
SI-16C2:PS-FCH \
SI-16C2:PS-FCV \
SI-16C3:PS-FCH \
SI-16C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia16.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-17M1:PS-FCH \
SI-17M1:PS-FCV \
SI-17M2:PS-FCH \
SI-17M2:PS-FCV \
SI-17C2:PS-FCH \
SI-17C2:PS-FCV \
SI-17C3:PS-FCH \
SI-17C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia17.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-18M1:PS-FCH \
SI-18M1:PS-FCV \
SI-18M2:PS-FCH \
SI-18M2:PS-FCV \
SI-18C2:PS-FCH \
SI-18C2:PS-FCV \
SI-18C3:PS-FCH \
SI-18C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia18.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-19M1:PS-FCH \
SI-19M1:PS-FCV \
SI-19M2:PS-FCH \
SI-19M2:PS-FCV \
SI-19C2:PS-FCH \
SI-19C2:PS-FCV \
SI-19C3:PS-FCH \
SI-19C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia19.log &

/usr/local/bin/sirius-ioc-si-ps-conv-fastcorrs.py \
SI-20M1:PS-FCH \
SI-20M1:PS-FCV \
SI-20M2:PS-FCH \
SI-20M2:PS-FCV \
SI-20C2:PS-FCH \
SI-20C2:PS-FCV \
SI-20C3:PS-FCH \
SI-20C3:PS-FCV | tee /ioc-logs/sirius-ioc-si-ps-conv-fastcorrs-ia20.log &

# run cron for log rotation
cron &

# keep entry point running
sleep infinity
