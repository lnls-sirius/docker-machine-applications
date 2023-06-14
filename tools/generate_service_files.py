#!/usr/bin/env python-sirius

import os
import yaml
from siriuspy import util
from siriuspy.namesys import SiriusPVName as _PVName
from siriuspy.search import PSSearch, HLTimeSearch, IDSearch
from siriuspy.currinfo.csdev import get_currinfo_database
from siriuspy.diagsys.rfdiag.csdev import Const as RFDiagConst
from siriuspy.diagsys.lidiag.csdev import Const as LIDiagConst


class ServiceConfig:
    """Services configuration."""

    SERVICES_CSCONSTS = {
        'csconsts': 'IA-16RaBbB-CO-IOCSrv'
        }

    SERVICES = {
        'as-ap-currinfo': 'IA-14RaDiag03-CO-IOCSrv',
        'as-ap-machshift': 'IA-16RaBbB-CO-IOCSrv',
        'as-ap-diag': 'IA-20RaDiag02-CO-IOCSrv-1',
        'as-ap-opticscorr': 'CA-RaTim-CO-IOCSrv',
        'as-ap-posang': 'IA-16RaBbB-CO-IOCSrv',
        'as-ap-sofb': 'IA-20RaDiag02-CO-IOCSrv-1',
        'as-ap-injctrl': 'IA-20RaDiag02-CO-IOCSrv-2',
        'as-ps-dclinks-tbts-bodip': 'IA-16RaBbB-CO-IOCSrv',
        'as-ps-dclinks-ia01': 'CA-RaTim-CO-IOCSrv',
        'as-ps-dclinks-ia02': 'CA-RaTim-CO-IOCSrv',
        'as-ps-dclinks-ia03': 'IA-18RaDiag04-CO-IOCSrv',
        'as-ps-dclinks-ia04': 'CA-RaTim-CO-IOCSrv',
        'as-ps-dclinks-ia05': 'IA-20RaDiag02-CO-IOCSrv-2',
        'as-ps-dclinks-ia06': 'CA-RaTim-CO-IOCSrv',
        'as-ps-dclinks-ia07': 'IA-20RaDiag02-CO-IOCSrv-1',
        'as-ps-dclinks-ia08': 'IA-18RaDiag04-CO-IOCSrv',
        'as-ps-dclinks-ia09': 'IA-20RaDiag02-CO-IOCSrv-1',
        'as-ps-dclinks-ia10': 'IA-16RaBbB-CO-IOCSrv',
        'as-ps-dclinks-ia11': 'IA-16RaBbB-CO-IOCSrv',
        'as-ps-dclinks-ia12': 'CA-RaTim-CO-IOCSrv',
        'as-ps-dclinks-ia13': 'IA-18RaDiag04-CO-IOCSrv',
        'as-ps-dclinks-ia14': 'IA-18RaDiag04-CO-IOCSrv',
        'as-ps-dclinks-ia15': 'IA-18RaDiag04-CO-IOCSrv',
        'as-ps-dclinks-ia16': 'IA-20RaDiag02-CO-IOCSrv-2',
        'as-ps-dclinks-ia17': 'IA-20RaDiag02-CO-IOCSrv-2',
        'as-ps-dclinks-ia18': 'CA-RaTim-CO-IOCSrv',
        'as-ps-dclinks-ia19': 'IA-18RaDiag04-CO-IOCSrv',
        'as-ps-dclinks-ia20': 'IA-20RaDiag02-CO-IOCSrv-1',
        'as-pu-conv': 'IA-14RaDiag03-CO-IOCSrv',
        'as-ti-general': 'IA-20RaDiag02-CO-IOCSrv-2',
        'bo-ti-bpms-corrs': 'CA-RaTim-CO-IOCSrv',
        'si-ti-bpms-corrs': 'IA-20RaDiag02-CO-IOCSrv-2',
        'si-ti-trims-skews': 'IA-18RaDiag04-CO-IOCSrv',
        'li-ap-energy': 'IA-14RaDiag03-CO-IOCSrv',
        'li-ps-spect-quads-lens': 'IA-16RaBbB-CO-IOCSrv',
        'li-ps-corrs': 'IA-16RaBbB-CO-IOCSrv',
        'li-ps-slnds': 'IA-14RaDiag03-CO-IOCSrv',
        'li-ps-conv': 'IA-14RaDiag03-CO-IOCSrv',
        'li-ps-diag': 'IA-16RaBbB-CO-IOCSrv',
        'tb-ps-dips': 'IA-18RaDiag04-CO-IOCSrv',
        'tb-ps-quads': 'IA-18RaDiag04-CO-IOCSrv',
        'tb-ps-corrs': 'IA-18RaDiag04-CO-IOCSrv',
        'bo-ps-dips': 'IA-20RaDiag02-CO-IOCSrv-1',
        'bo-ps-quads': 'IA-20RaDiag02-CO-IOCSrv-2',
        'bo-ps-sexts': 'IA-18RaDiag04-CO-IOCSrv',
        'bo-ps-corrs-ia01': 'IA-20RaDiag02-CO-IOCSrv-1',
        'bo-ps-corrs-ia02': 'IA-18RaDiag04-CO-IOCSrv',
        'bo-ps-corrs-ia04': 'CA-RaTim-CO-IOCSrv',
        'bo-ps-corrs-ia05': 'CA-RaTim-CO-IOCSrv',
        'bo-ps-corrs-ia07': 'IA-20RaDiag02-CO-IOCSrv-1',
        'bo-ps-corrs-ia08': 'IA-16RaBbB-CO-IOCSrv',
        'bo-ps-corrs-ia10': 'IA-20RaDiag02-CO-IOCSrv-2',
        'bo-ps-corrs-ia11': 'IA-20RaDiag02-CO-IOCSrv-1',
        'bo-ps-corrs-ia13': 'IA-20RaDiag02-CO-IOCSrv-1',
        'bo-ps-corrs-ia14': 'IA-20RaDiag02-CO-IOCSrv-1',
        'bo-ps-corrs-ia16': 'IA-20RaDiag02-CO-IOCSrv-2',
        'bo-ps-corrs-ia17': 'IA-20RaDiag02-CO-IOCSrv-2',
        'bo-ps-corrs-ia20': 'CA-RaTim-CO-IOCSrv',
        'ts-ps-dips': 'IA-20RaDiag02-CO-IOCSrv-1',
        'ts-ps-quads': 'IA-20RaDiag02-CO-IOCSrv-2',
        'ts-ps-corrs': 'IA-20RaDiag02-CO-IOCSrv-2',
        'si-ap-fofb': 'IA-18RaDiag04-CO-IOCSrv',
        'si-ap-stabinfo': 'IA-20RaDiag02-CO-IOCSrv-2',
        'si-id-conv': 'IA-18RaDiag04-CO-IOCSrv',
        'si-id-epu50': 'IA-18RaDiag04-CO-IOCSrv',
        'si-ap-sofb': 'IA-20RaDiag01-CO-IOCSrv-2',
        'si-ps-dips': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-quads-qfq': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-quads-qd': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-sexts-sda12b2-sfa0p0-sda0p0': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-sexts-sfa12-sda3p1-sfb0-sdb01': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-sexts-sfb12-sdb3-sfp12-sdp23': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-corrs-c2m12-ia01': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-corrs-c2m12-ia02': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia03': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-corrs-c2m12-ia04': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia05': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia06': 'IA-18RaDiag04-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia07': 'IA-18RaDiag04-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia08': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia09': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-corrs-c2m12-ia10': 'CA-RaTim-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia11': 'CA-RaTim-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia12': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia13': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-corrs-c2m12-ia14': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia15': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia16': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-corrs-c2m12-ia17': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia18': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia19': 'CA-RaTim-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia20': 'CA-RaTim-CO-IOCSrv',
        'si-ps-corrs-c134-ia01': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c134-ia02': 'IA-20RaDiag02-CO-IOCSrv-2',
        'si-ps-corrs-c134-ia03': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-corrs-c134-ia04': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c134-ia05': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c134-ia06': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-corrs-c134-ia07': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c134-ia08': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-corrs-c134-ia09': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-corrs-c134-ia10': 'CA-RaTim-CO-IOCSrv',
        'si-ps-corrs-c134-ia11': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-corrs-c134-ia12': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c134-ia13': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-corrs-c134-ia14': 'CA-RaTim-CO-IOCSrv',
        'si-ps-corrs-c134-ia15': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c134-ia16': 'IA-18RaDiag04-CO-IOCSrv',
        'si-ps-corrs-c134-ia17': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-corrs-c134-ia18': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c134-ia19': 'CA-RaTim-CO-IOCSrv',
        'si-ps-corrs-c134-ia20': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-qs-sb-ia10': 'IA-18RaDiag04-CO-IOCSrv',
        'si-ps-corrs-sa-ia17': 'IA-18RaDiag04-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia01': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia02': 'CA-RaTim-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia03': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia04': 'CA-RaTim-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia05': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia06': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-m12-ia07': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-m12-ia08': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-m12-ia09': 'CA-RaTim-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia10': 'CA-RaTim-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia11': 'IA-20RaDiag02-CO-IOCSrv-2',
        'si-ps-trims-qs-m12-ia12': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia13': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-m12-ia14': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-m12-ia15': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-m12-ia16': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia17': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-m12-ia18': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-m12-ia19': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia20': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-c1234-ia01': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-c1234-ia02': 'CA-RaTim-CO-IOCSrv',
        'si-ps-trims-qs-c1234-ia03': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-c1234-ia04': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-c1234-ia05': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-c1234-ia06': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-c1234-ia07': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-c1234-ia08': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-c1234-ia09': 'CA-RaTim-CO-IOCSrv',
        'si-ps-trims-qs-c1234-ia10': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-trims-qs-c1234-ia11': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-c1234-ia12': 'IA-20RaDiag02-CO-IOCSrv-2',
        'si-ps-trims-qs-c1234-ia13': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-c1234-ia14': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-c1234-ia15': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-c1234-ia16': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-c1234-ia17': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-c1234-ia18': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-c1234-ia19': 'IA-20RaDiag02-CO-IOCSrv-1',
        'si-ps-trims-qs-c1234-ia20': 'CA-RaTim-CO-IOCSrv',
        'si-ps-conv-fastcorrs': 'IA-20RaDiag02-CO-IOCSrv-2',
        'si-ps-diag-fastcorrs': 'IA-20RaDiag02-CO-IOCSrv-2',
        'it-ps-lens': 'IA-20RaDiag02-CO-IOCSrv-1',
        'bl-ap-imgproc': 'LA-RaCtrl-CO-Srv-1',
        'si-ap-idff-epu50': 'IA-18RaDiag04-CO-IOCSrv',
        'si-ap-idff-papu50': 'IA-18RaDiag04-CO-IOCSrv',
        }

    STACKS = {
        'as-ps-dclinks': {
            'tbts-bodip': 'as-ps-dclinks-tbts-bodip',
            'ia01': 'as-ps-dclinks-ia01',
            'ia02': 'as-ps-dclinks-ia02',
            'ia03': 'as-ps-dclinks-ia03',
            'ia04': 'as-ps-dclinks-ia04',
            'ia05': 'as-ps-dclinks-ia05',
            'ia06': 'as-ps-dclinks-ia06',
            'ia07': 'as-ps-dclinks-ia07',
            'ia08': 'as-ps-dclinks-ia08',
            'ia09': 'as-ps-dclinks-ia09',
            'ia10': 'as-ps-dclinks-ia10',
            'ia11': 'as-ps-dclinks-ia11',
            'ia12': 'as-ps-dclinks-ia12',
            'ia13': 'as-ps-dclinks-ia13',
            'ia14': 'as-ps-dclinks-ia14',
            'ia15': 'as-ps-dclinks-ia15',
            'ia16': 'as-ps-dclinks-ia16',
            'ia17': 'as-ps-dclinks-ia17',
            'ia18': 'as-ps-dclinks-ia18',
            'ia19': 'as-ps-dclinks-ia19',
            'ia20': 'as-ps-dclinks-ia20',
            },
        'as-ti': {
            'general': 'as-ti-general',
            'bo-bpms-corrs': 'bo-ti-bpms-corrs',
            'si-bpms-corrs': 'si-ti-bpms-corrs',
            'si-trims-skews': 'si-ti-trims-skews',
            },
        'bo-ps-corrs': {
            'ia01': 'bo-ps-corrs-ia01',
            'ia02': 'bo-ps-corrs-ia02',
            'ia04': 'bo-ps-corrs-ia04',
            'ia05': 'bo-ps-corrs-ia05',
            'ia07': 'bo-ps-corrs-ia07',
            'ia08': 'bo-ps-corrs-ia08',
            'ia10': 'bo-ps-corrs-ia10',
            'ia11': 'bo-ps-corrs-ia11',
            'ia13': 'bo-ps-corrs-ia13',
            'ia14': 'bo-ps-corrs-ia14',
            'ia16': 'bo-ps-corrs-ia16',
            'ia17': 'bo-ps-corrs-ia17',
            'ia20': 'bo-ps-corrs-ia20',
            },
        'bo-ps-fams': {
            'dips': 'bo-ps-dips',
            'quads': ('bo-ps-quads', ('dips', )),
            'sexts': ('bo-ps-sexts', ('dips', )),
            },
        'bo-ps': {
            'dips': 'bo-ps-dips',
            'quads': ('bo-ps-quads', ('dips', )),
            'sexts': ('bo-ps-sexts', ('dips', )),
            'corrs-ia01': ('bo-ps-corrs-ia01', ('dips', )),
            'corrs-ia02': ('bo-ps-corrs-ia02', ('dips', )),
            'corrs-ia04': ('bo-ps-corrs-ia04', ('dips', )),
            'corrs-ia05': ('bo-ps-corrs-ia05', ('dips', )),
            'corrs-ia07': ('bo-ps-corrs-ia07', ('dips', )),
            'corrs-ia08': ('bo-ps-corrs-ia08', ('dips', )),
            'corrs-ia10': ('bo-ps-corrs-ia10', ('dips', )),
            'corrs-ia11': ('bo-ps-corrs-ia11', ('dips', )),
            'corrs-ia13': ('bo-ps-corrs-ia13', ('dips', )),
            'corrs-ia14': ('bo-ps-corrs-ia14', ('dips', )),
            'corrs-ia16': ('bo-ps-corrs-ia16', ('dips', )),
            'corrs-ia17': ('bo-ps-corrs-ia17', ('dips', )),
            'corrs-ia20': ('bo-ps-corrs-ia20', ('dips', )),
            },
        'li-ps': {
            'spect-quads-lens': 'li-ps-spect-quads-lens',
            'corrs': 'li-ps-corrs',
            'slnds': 'li-ps-slnds',
            'conv': ('li-ps-conv', ('spect-quads-lens', 'corrs', 'slnds')),
            'diag': ('li-ps-diag', ('spect-quads-lens', 'corrs', 'slnds')),
            },
        'tb-ps': {
            'dips': 'tb-ps-dips',
            'quads': ('tb-ps-quads', ('dips', )),
            'corrs': ('tb-ps-corrs', ('dips', )),
            },
        'ts-ps': {
            'dips': 'ts-ps-dips',
            'quads': ('ts-ps-quads', ('dips', )),
            'corrs': ('ts-ps-corrs', ('dips', )),
            },
        'si-ps': {
            'dips': 'si-ps-dips',
            'quads-qd': ('si-ps-quads-qd', ('dips', )),
            'quads-qfq': ('si-ps-quads-qfq', ('dips', )),
            'sexts-sda12b2-sfa0p0-sda0p0': ('si-ps-sexts-sda12b2-sfa0p0-sda0p0', ('dips', )),
            'sexts-sfa12-sda3p1-sfb0-sdb01': ('si-ps-sexts-sfa12-sda3p1-sfb0-sdb01', ('dips', )),
            'sexts-sfb12-sdb3-sfp12-sdp23': ('si-ps-sexts-sfb12-sdb3-sfp12-sdp23', ('dips', )),
            'corrs-c2m12-ia01': ('si-ps-corrs-c2m12-ia01', ('dips', )),
            'corrs-c2m12-ia02': ('si-ps-corrs-c2m12-ia02', ('dips', )),
            'corrs-c2m12-ia03': ('si-ps-corrs-c2m12-ia03', ('dips', )),
            'corrs-c2m12-ia04': ('si-ps-corrs-c2m12-ia04', ('dips', )),
            'corrs-c2m12-ia05': ('si-ps-corrs-c2m12-ia05', ('dips', )),
            'corrs-c2m12-ia06': ('si-ps-corrs-c2m12-ia06', ('dips', )),
            'corrs-c2m12-ia07': ('si-ps-corrs-c2m12-ia07', ('dips', )),
            'corrs-c2m12-ia08': ('si-ps-corrs-c2m12-ia08', ('dips', )),
            'corrs-c2m12-ia09': ('si-ps-corrs-c2m12-ia09', ('dips', )),
            'corrs-c2m12-ia10': ('si-ps-corrs-c2m12-ia10', ('dips', )),
            'corrs-c2m12-ia11': ('si-ps-corrs-c2m12-ia11', ('dips', )),
            'corrs-c2m12-ia12': ('si-ps-corrs-c2m12-ia12', ('dips', )),
            'corrs-c2m12-ia13': ('si-ps-corrs-c2m12-ia13', ('dips', )),
            'corrs-c2m12-ia14': ('si-ps-corrs-c2m12-ia14', ('dips', )),
            'corrs-c2m12-ia15': ('si-ps-corrs-c2m12-ia15', ('dips', )),
            'corrs-c2m12-ia16': ('si-ps-corrs-c2m12-ia16', ('dips', )),
            'corrs-c2m12-ia17': ('si-ps-corrs-c2m12-ia17', ('dips', )),
            'corrs-c2m12-ia18': ('si-ps-corrs-c2m12-ia18', ('dips', )),
            'corrs-c2m12-ia19': ('si-ps-corrs-c2m12-ia19', ('dips', )),
            'corrs-c2m12-ia20': ('si-ps-corrs-c2m12-ia20', ('dips', )),
            'corrs-c134-ia01': ('si-ps-corrs-c134-ia01', ('dips', )),
            'corrs-c134-ia02': ('si-ps-corrs-c134-ia02', ('dips', )),
            'corrs-c134-ia03': ('si-ps-corrs-c134-ia03', ('dips', )),
            'corrs-c134-ia04': ('si-ps-corrs-c134-ia04', ('dips', )),
            'corrs-c134-ia05': ('si-ps-corrs-c134-ia05', ('dips', )),
            'corrs-c134-ia06': ('si-ps-corrs-c134-ia06', ('dips', )),
            'corrs-c134-ia07': ('si-ps-corrs-c134-ia07', ('dips', )),
            'corrs-c134-ia08': ('si-ps-corrs-c134-ia08', ('dips', )),
            'corrs-c134-ia09': ('si-ps-corrs-c134-ia09', ('dips', )),
            'corrs-c134-ia10': ('si-ps-corrs-c134-ia10', ('dips', )),
            'corrs-c134-ia11': ('si-ps-corrs-c134-ia11', ('dips', )),
            'corrs-c134-ia12': ('si-ps-corrs-c134-ia12', ('dips', )),
            'corrs-c134-ia13': ('si-ps-corrs-c134-ia13', ('dips', )),
            'corrs-c134-ia14': ('si-ps-corrs-c134-ia14', ('dips', )),
            'corrs-c134-ia15': ('si-ps-corrs-c134-ia15', ('dips', )),
            'corrs-c134-ia16': ('si-ps-corrs-c134-ia16', ('dips', )),
            'corrs-c134-ia17': ('si-ps-corrs-c134-ia17', ('dips', )),
            'corrs-c134-ia18': ('si-ps-corrs-c134-ia18', ('dips', )),
            'corrs-c134-ia19': ('si-ps-corrs-c134-ia19', ('dips', )),
            'corrs-c134-ia20': ('si-ps-corrs-c134-ia20', ('dips', )),
            'corrs-qs-sb-ia10': ('si-ps-corrs-qs-sb-ia10', ('dips', )),
            'corrs-sa-ia17': ('si-ps-corrs-sa-ia17', ('dips', )),
            'trims-qs-c1234-ia01': ('si-ps-trims-qs-c1234-ia01', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia02': ('si-ps-trims-qs-c1234-ia02', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia03': ('si-ps-trims-qs-c1234-ia03', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia04': ('si-ps-trims-qs-c1234-ia04', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia05': ('si-ps-trims-qs-c1234-ia05', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia06': ('si-ps-trims-qs-c1234-ia06', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia07': ('si-ps-trims-qs-c1234-ia07', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia08': ('si-ps-trims-qs-c1234-ia08', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia09': ('si-ps-trims-qs-c1234-ia09', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia10': ('si-ps-trims-qs-c1234-ia10', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia11': ('si-ps-trims-qs-c1234-ia11', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia12': ('si-ps-trims-qs-c1234-ia12', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia13': ('si-ps-trims-qs-c1234-ia13', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia14': ('si-ps-trims-qs-c1234-ia14', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia15': ('si-ps-trims-qs-c1234-ia15', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia16': ('si-ps-trims-qs-c1234-ia16', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia17': ('si-ps-trims-qs-c1234-ia17', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia18': ('si-ps-trims-qs-c1234-ia18', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia19': ('si-ps-trims-qs-c1234-ia19', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-c1234-ia20': ('si-ps-trims-qs-c1234-ia20', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia01': ('si-ps-trims-qs-m12-ia01', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia02': ('si-ps-trims-qs-m12-ia02', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia03': ('si-ps-trims-qs-m12-ia03', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia04': ('si-ps-trims-qs-m12-ia04', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia05': ('si-ps-trims-qs-m12-ia05', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia06': ('si-ps-trims-qs-m12-ia06', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia07': ('si-ps-trims-qs-m12-ia07', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia08': ('si-ps-trims-qs-m12-ia08', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia09': ('si-ps-trims-qs-m12-ia09', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia10': ('si-ps-trims-qs-m12-ia10', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia11': ('si-ps-trims-qs-m12-ia11', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia12': ('si-ps-trims-qs-m12-ia12', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia13': ('si-ps-trims-qs-m12-ia13', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia14': ('si-ps-trims-qs-m12-ia14', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia15': ('si-ps-trims-qs-m12-ia15', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia16': ('si-ps-trims-qs-m12-ia16', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia17': ('si-ps-trims-qs-m12-ia17', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia18': ('si-ps-trims-qs-m12-ia18', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia19': ('si-ps-trims-qs-m12-ia19', ('dips', 'quads-qd', 'quads-qfq')),
            'trims-qs-m12-ia20': ('si-ps-trims-qs-m12-ia20', ('dips', 'quads-qd', 'quads-qfq')),
            },
        'si-id': {
            'epu50': 'si-id-epu50',
            'conv': ('si-id-conv', ('epu50', )),
        },
        'it-ps': {
            'lens': 'it-ps-lens',
            },
        'si-ps-fastcorrs': {
            'conv': 'si-ps-conv-fastcorrs',
            'diag': 'si-ps-diag-fastcorrs',
            },
        'si-ap-idff': {
            'epu50': 'si-ap-idff-epu50',
            'papu50': 'si-ap-idff-papu50',
        }
        # 'bl-ap-imgproc': {
        #     'imgproc': 'bl-ap-imgproc',
        #     },
        }


class DockerStackConfig(ServiceConfig):
    """Docker stack configuration."""

    IMAGE_TAG_CSCONSTS = '__FAC_CSCONSTS_TAG_TEMPLATE__'
    IMAGE_TAG_IOCS = '__FAC_IOC_TAG_TEMPLATE__'

    def __init__(self, image_tag):
        self.version = '3.7'
        self.image_tag = image_tag
        self.networks = ['host_network'] if 'CSCONSTS' in image_tag else \
            ['ioc-network']
        self.replicas = '1'
        self.condition = 'any'
        self.driver = 'json-file'

    @staticmethod
    def get_command(app):
        """Return command."""
        strf = "bash -c '/ioc-apps/" + app + ".bash'"
        return strf

    def get_image(self, app):
        """Return image."""
        if 'CSCONSTS' in self.image_tag:
            image = 'fac-csconsts'
        elif 'li-ps' in app and 'conv' not in app and 'diag' not in app:
            image = 'fac-iocs-li-ps'
        else:
            image = 'fac-iocs'
        strf = 'dockerregistry.lnls-sirius.com.br/fac/' + image + ":"
        strf += self.image_tag
        return strf

    def str_header(self):
        strf = ''
        strf += 'version: "' + self.version + '"'
        strf += '\n'
        strf += '\n' + 'services:'
        return strf

    def str_service(self, app, node, depends=None):
        strf = ''
        strf += '\n' + '    image: ' + self.get_image(app)
        if depends:
            strf += '\n' + '    depends_on:'
            for item in depends:
                strf += '\n' + '      - "' + item + '"'
        if 'CSCONSTS' not in self.image_tag:
            strf += '\n' + '    command: ' + DockerStackConfig.get_command(app)
        strf += '\n' + '    volumes:'
        strf += '\n' + '      - "/storage/common/fac/iocs-log:/home/sirius/iocs-log"'
        strf += '\n' + '    deploy:'
        strf += '\n' + '      placement:'
        strf += '\n' + '        constraints:'
        strf += '\n' + '          - node.hostname == ' + node
        strf += '\n' + '      replicas: ' + self.replicas
        strf += '\n' + '      restart_policy:'
        strf += '\n' + '        condition: ' + self.condition
        strf += '\n' + '    logging:'
        strf += '\n' + '      driver: ' + '"' + self.driver + '"'
        strf += '\n' + '      options:'
        strf += '\n' + '        max-file: ' + '"10"'
        strf += '\n' + '        max-size: ' + '"10m"'
        strf += '\n' + '    networks:'
        for network in self.networks:
            strf += '\n' + '      - ' + network
        return strf

    def str_networks(self):
        strf = ''
        strf += '\n' + 'networks:'
        strf += '\n' + '  ioc-network' + ':'
        strf += '\n' + '    external: true'
        strf += '\n' + '    name: "host"'
        return strf


class DockerLowStackConfig(DockerStackConfig):
    """Docker low stack configuration."""

    def __init__(self, app, node):
        super().__init__(DockerStackConfig.IMAGE_TAG_IOCS)
        self.app = app
        self.node = node

    def __str__(self):
        strf = self.str_header()
        strf += '\n'
        strf += '\n' + '  iocs:'
        strf += self.str_service(self.app, self.node)
        strf += '\n'
        strf += self.str_networks()
        return strf

    def save_config_file(self):
        fname = 'docker-stack-' + self.app + '.yml'
        print(self, file=open(fname, 'w'))


class DockerHighStackConfig(DockerStackConfig):
    """Docker high stack configuration."""

    def __init__(self, stack):
        super().__init__(DockerStackConfig.IMAGE_TAG_IOCS)
        self.stack = stack
        self.services = ServiceConfig.STACKS[stack]

    def __str__(self):
        strf = self.str_header()
        for service, app in self.services.items():
            if isinstance(app, (tuple, list)):
                app, depends = app
            else:
                depends = None
            # print(service, app, depends)
            node = ServiceConfig.SERVICES[app]
            strf += '\n'
            strf += '\n' + '  ' + service + ':'
            strf += self.str_service(app, node, depends)
        strf += '\n'
        strf += self.str_networks()
        return strf

    def save_config_file(self):
        fname = 'docker-stack-' + self.stack + '.yml'
        print(self, file=open(fname, 'w'))


class DockerCSConstsConfig(DockerStackConfig):
    """Docker control-system-constants configuration."""

    def __init__(self, app, node):
        super().__init__(DockerStackConfig.IMAGE_TAG_CSCONSTS)
        self.app = app
        self.node = node

    def __str__(self):
        strf = self.str_header()
        strf += '\n'
        strf += '\n' + '  facs-csconsts:'
        strf += self.str_service(self.app, self.node)
        strf += '\n'
        strf += self.str_networks()
        return strf

    def save_config_file(self):
        fname = 'docker-stack-' + self.app + '.yml'
        print(self, file=open(fname, 'w'))

    def str_networks(self):
        strf = ''
        strf += '\n' + 'networks:'
        strf += '\n' + '  host_network' + ':'
        strf += '\n' + '    external:'
        strf += '\n' + '      name: "host"'
        return strf


def generate_service_files():
    """Generate docker service file."""

    for app, node in ServiceConfig.SERVICES_CSCONSTS.items():
        config = DockerCSConstsConfig(app=app, node=node)
        config.save_config_file()

    for app, node in ServiceConfig.SERVICES.items():
        config = DockerLowStackConfig(app=app, node=node)
        config.save_config_file()

    for stack in ServiceConfig.STACKS:
        config = DockerHighStackConfig(stack)
        config.save_config_file()


def generate_service_2_ioc_table():
    """Generate docker service -> IOCs table."""

    cont2serv = dict()
    for stack, sub2serv in ServiceConfig.STACKS.items():
        for sub, serv in sub2serv.items():
            if isinstance(serv, (tuple, list)):
                serv = serv[0]
            cont2serv['facs-' + stack + '_' + sub] = serv
    serv2cont = {v: k for k, v in cont2serv.items()}

    cont2iocs = dict()
    for service in ServiceConfig.SERVICES:
        if service in serv2cont:
            container = serv2cont[service]
        else:
            container = 'facs-' + service

        appdir_path = os.path.join(
            os.path.abspath(os.path.dirname(__file__)), '..', 'apps')
        appfile_path = os.path.join(appdir_path, service + '.bash')

        iocs = list()
        with open(appfile_path, 'r') as file:
            text = file.read()
            lines = text.splitlines()
            for lin in lines:
                lin = lin.strip()
                if not lin or lin[0] == '#':
                    continue  # empty line or comment
                elif '/ioc-logs/sirius-ioc-' in lin:
                    if ('-ps' in lin  or 'idff' in lin) and 'conv' not in lin:
                        iocname = lin.split('/bin/sirius-ioc-')[1]
                        iocname = iocname.split(' | tee ')[0]
                        iocname = iocname.replace('.py', '').replace(' -n', '')
                    else:
                        iocname = lin.split('/ioc-logs/sirius-ioc-')[1]
                        iocname = iocname.split(' &')[0]
                        iocname = iocname.split('.log')[0]
                    iocs.append(iocname)
        cont2iocs[container] = iocs

    data = dict()
    for container, iocs in cont2iocs.items():
        data[container] = dict()
        for ioc in iocs:
            ioc = ioc.strip(' ')
            prefixes = list()
            if ('-ps' in ioc or '-pu' in ioc) and 'conv' not in ioc:
                prs = ioc.replace('"', '')
                prs = prs.split(' ')
                if prs[0] == 'as-ps':
                    psm = PSSearch.conv_bbbname_2_psnames(prs[1])
                    prefixes.extend([p[0] for p in psm])
                elif 'diag' in prs[0]:
                    if 'ps' in ioc:
                        filt = {'sec': prs[1], 'sub': prs[2], 'dev': prs[3]}
                    else:
                        filt = {
                            'dis': 'PU', 'dev': '.*(Kckr|Sept)',
                            'propty_name': '(?!:CCoil).*'}
                    devnames = PSSearch.get_psnames(filt)
                    prefixes.extend([p+':Diag' for p in devnames])
                elif prs[0] == 'li-ps':
                    prefixes.append(prs[1])
            else:
                prs = ioc.split('-')
                if 'conv' in ioc:
                    if 'id' in ioc:
                        idnames = IDSearch.get_idnames()
                        idnames.remove('SI-14SB:ID-WIG180')
                        prefixes.extend([i+':Kx' for i in idnames])
                    else:
                        if prs[0] == 'li':
                            filt = {'sec': 'LI'}
                        elif prs[1] == 'pu':
                            filt = {'dis': 'PU'}
                        elif 'fastcorr' in ioc:
                            filt = {'sec': 'SI', 'dev': 'FC.*'}
                        psnames = PSSearch.get_psnames(filt)
                        for psn in psnames:
                            psn = _PVName(psn)
                            try:
                                magf = PSSearch.conv_psname_2_magfunc(psn)
                                strg = util.get_strength_label(magf)
                                prefixes.append(str(psn.substitute(
                                    propty=psn.propty_name+strg)))
                            except ValueError:
                                pass
                elif 'id' in ioc:
                    if 'idff' in ioc:
                        idn = ioc.split(' ')[1]
                        pref = 'SI-' + _PVName(idn).sub + ':AP-IDFF'
                        prefixes.append(pref)
                    else:
                        iddev = ioc.split('-')[2].upper()
                        idnames = IDSearch.get_idnames({'dev': iddev})
                        # needs conversion to str to avoid SiriusPVName __str__
                        prefixes.extend([str(idname) for idname in idnames])
                elif 'diag' in prs[2]:
                    if prs[0] == 'li':
                        devs = LIDiagConst.ALL_DEVICES
                        prefixes.extend([d+':Diag' for d in devs])
                    elif prs[1] == 'rf':
                        devs = RFDiagConst.ALL_DEVICES
                        prefixes.extend([d+':Diag' for d in devs])
                elif prs[1] == 'ap':
                    if prs[2] == 'currinfo':
                        if 'lifetime' in ioc or ioc.startswith('bo'):
                            pref = prs[0].upper() + '-Glob:AP-CurrInfo'
                            prefixes.append(pref)
                        else:
                            dbs = get_currinfo_database(prs[0].upper())
                            devs = {str(_PVName(p).device_name) for p in dbs}
                            prefixes.extend(sorted(devs))
                    elif prs[0] == 'bl' and prs[2] == 'imgproc':
                        bline = prs[3][0:3].upper()
                        hutch = 'A' if prs[3][-1] == 1 else 'B'
                        cam = 'BASLER01'
                        pref = ':'.join([bline, hutch, cam])
                        prefixes.append(pref)
                    else:
                        devname = prs[2][0].upper() + prs[2][1:]
                        devname = devname.replace('ang', 'Ang')
                        devname = devname.replace('corr', 'Corr')
                        devname = devname.replace('shift', 'Shift')
                        devname = devname.replace('ctrl', 'Ctrl')
                        devname = devname.replace('ofb', 'OFB')
                        devname = devname.replace('Stabinfo', 'StabilityInfo')
                        devname = devname.replace('Energy', 'MeasEnergy')
                        pref = prs[0].upper() + '-Glob:AP-' + devname
                        prefixes.append(pref)
                elif prs[1] == 'ti':
                    filt = {'sec': prs[0].upper()}
                    if len(prs) == 4:
                        if prs[3] == 'bpms':
                            filt['dev'] = 'BPM'
                        else:
                            filt['idx'] = prs[3].capitalize()
                            filt['idx'] = filt['idx'].replace('trim', 'Trim')
                    else:
                        filt['dev'] = '(?!BPM).*'
                        filt['idx'] = '(?!(Corrs|Skews|QTrims))'
                    devnames = HLTimeSearch.get_hl_triggers(filt)
                    prefixes.extend([str(d) for d in devnames])
            data[container][ioc] = prefixes

    fname = 'facs.yml'
    hmsg = '# This is a yml file that was automatically generated by\n'
    hmsg += '# the generate_service_files.py script, available at the\n'
    hmsg += '# docker-machine-applications repository.\n'
    hmsg += '#\n'
    hmsg += '# It can be imported into python3 code as a dict with:\n'
    hmsg += '# ```\n'
    hmsg += '#     with open("facs.yml") as file:\n'
    hmsg += '#         data = yaml.load(file)\n'
    hmsg += '# ```\n'
    hmsg += '# where `yaml` is a python3 module available in `pip3`.\n'
    hmsg += '#\n'
    hmsg += '# The blocks below define the relation:\n'
    hmsg += '# SERVICE:\n'
    hmsg += '#   IOC_X:\n'
    hmsg += '#     PREFIX_A\n'
    hmsg += '#     PREFIX_B\n'
    hmsg += '#   IOC_Y:\n'
    hmsg += '#     PREFIX_C\n'
    hmsg += '#     ...\n'
    hmsg += '# where SERVICE is the name of the docker service, IOC_X\n'
    hmsg += '# and IOC_Y are references to IOC processes running into\n'
    hmsg += '# the docker container, PREFIX_A and PREFIX_B, for IOC_X,\n'
    hmsg += '# and PREFIX_C, for IOC_Y, are prefixes of PVs that are\n'
    hmsg += '# provided by each of the IOCs.\n\n'

    with open(fname, 'w') as file:
        file.write(hmsg)
        for container, iocs in data.items():
            file.write(yaml.dump({container: iocs}, default_flow_style=False))
            file.write('\n')


if __name__ == "__main__":
    generate_service_files()
    generate_service_2_ioc_table()
