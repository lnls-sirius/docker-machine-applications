#!/usr/bin/env python-sirius


class ServiceConfig:

    SERVICES_CSCONSTS = {
        'csconsts': 'IA-16RaBbB-CO-IOCSrv'
        }

    SERVICES = {
        'as-ap-currinfo': 'IA-14RaDiag03-CO-IOCSrv',
        'as-ap-machshift': 'IA-16RaBbB-CO-IOCSrv',
        'as-ap-diag': 'lnlsfac-srv2',
        'as-ap-opticscorr': 'CA-RaTim-CO-IOCSrv',
        'as-ap-posang': 'IA-16RaBbB-CO-IOCSrv',
        'as-ap-sofb': 'lnlsfac-srv2',
        'as-ap-injctrl': 'IA-20RaDiag02-CO-IOCSrv-2',
        'as-ps-dclinks-tbts-bodip': 'IA-16RaBbB-CO-IOCSrv',
        'as-ps-dclinks-ia01': 'CA-RaTim-CO-IOCSrv',
        'as-ps-dclinks-ia02': 'CA-RaTim-CO-IOCSrv',
        'as-ps-dclinks-ia03': 'IA-18RaDiag04-CO-IOCSrv',
        'as-ps-dclinks-ia04': 'CA-RaTim-CO-IOCSrv',
        'as-ps-dclinks-ia05': 'IA-20RaDiag02-CO-IOCSrv-2',
        'as-ps-dclinks-ia06': 'CA-RaTim-CO-IOCSrv',
        'as-ps-dclinks-ia07': 'lnlsfac-srv2',
        'as-ps-dclinks-ia08': 'IA-18RaDiag04-CO-IOCSrv',
        'as-ps-dclinks-ia09': 'lnlsfac-srv2',
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
        'as-ps-dclinks-ia20': 'lnlsfac-srv2',
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
        'bo-ps-dips': 'lnlsfac-srv2',
        'bo-ps-quads': 'IA-20RaDiag02-CO-IOCSrv-2',
        'bo-ps-sexts': 'IA-18RaDiag04-CO-IOCSrv',
        'bo-ps-corrs-ia01': 'lnlsfac-srv2',
        'bo-ps-corrs-ia02': 'IA-18RaDiag04-CO-IOCSrv',
        'bo-ps-corrs-ia04': 'CA-RaTim-CO-IOCSrv',
        'bo-ps-corrs-ia05': 'CA-RaTim-CO-IOCSrv',
        'bo-ps-corrs-ia07': 'lnlsfac-srv2',
        'bo-ps-corrs-ia08': 'IA-16RaBbB-CO-IOCSrv',
        'bo-ps-corrs-ia10': 'IA-20RaDiag02-CO-IOCSrv-2',
        'bo-ps-corrs-ia11': 'lnlsfac-srv2',
        'bo-ps-corrs-ia13': 'lnlsfac-srv2',
        'bo-ps-corrs-ia14': 'lnlsfac-srv2',
        'bo-ps-corrs-ia16': 'IA-20RaDiag02-CO-IOCSrv-2',
        'bo-ps-corrs-ia17': 'IA-20RaDiag02-CO-IOCSrv-2',
        'bo-ps-corrs-ia20': 'CA-RaTim-CO-IOCSrv',
        'ts-ps-dips': 'lnlsfac-srv2',
        'ts-ps-quads': 'IA-20RaDiag02-CO-IOCSrv-2',
        'ts-ps-corrs': 'IA-20RaDiag02-CO-IOCSrv-2',
        'si-ap-bl': 'IA-16RaBbB-CO-IOCSrv',
        'si-id-conv': 'IA-18RaDiag04-CO-IOCSrv',
        'si-ap-sofb': 'IA-20RaDiag01-CO-IOCSrv-2',
        'si-ps-dips': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-quads-qfq': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-quads-qd': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-sexts-sda12b2-sfa0p0-sda0p0': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-sexts-sfa12-sda3p1-sfb0-sdb01': 'lnlsfac-srv2',
        'si-ps-sexts-sfb12-sdb3-sfp12-sdp23': 'lnlsfac-srv2',
        'si-ps-corrs-c2m12-ia01': 'lnlsfac-srv2',
        'si-ps-corrs-c2m12-ia02': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia03': 'lnlsfac-srv2',
        'si-ps-corrs-c2m12-ia04': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia05': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia06': 'IA-18RaDiag04-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia07': 'IA-18RaDiag04-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia08': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia09': 'lnlsfac-srv2',
        'si-ps-corrs-c2m12-ia10': 'CA-RaTim-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia11': 'CA-RaTim-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia12': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia13': 'lnlsfac-srv2',
        'si-ps-corrs-c2m12-ia14': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia15': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia16': 'lnlsfac-srv2',
        'si-ps-corrs-c2m12-ia17': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia18': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia19': 'CA-RaTim-CO-IOCSrv',
        'si-ps-corrs-c2m12-ia20': 'CA-RaTim-CO-IOCSrv',
        'si-ps-corrs-c134-ia01': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c134-ia02': 'IA-20RaDiag02-CO-IOCSrv-2',
        'si-ps-corrs-c134-ia03': 'lnlsfac-srv2',
        'si-ps-corrs-c134-ia04': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c134-ia05': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c134-ia06': 'lnlsfac-srv2',
        'si-ps-corrs-c134-ia07': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c134-ia08': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-corrs-c134-ia09': 'lnlsfac-srv2',
        'si-ps-corrs-c134-ia10': 'CA-RaTim-CO-IOCSrv',
        'si-ps-corrs-c134-ia11': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-corrs-c134-ia12': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c134-ia13': 'lnlsfac-srv2',
        'si-ps-corrs-c134-ia14': 'CA-RaTim-CO-IOCSrv',
        'si-ps-corrs-c134-ia15': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c134-ia16': 'IA-18RaDiag04-CO-IOCSrv',
        'si-ps-corrs-c134-ia17': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-corrs-c134-ia18': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-corrs-c134-ia19': 'CA-RaTim-CO-IOCSrv',
        'si-ps-corrs-c134-ia20': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia01': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia02': 'CA-RaTim-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia03': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia04': 'CA-RaTim-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia05': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia06': 'lnlsfac-srv2',
        'si-ps-trims-qs-m12-ia07': 'lnlsfac-srv2',
        'si-ps-trims-qs-m12-ia08': 'lnlsfac-srv2',
        'si-ps-trims-qs-m12-ia09': 'CA-RaTim-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia10': 'CA-RaTim-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia11': 'IA-20RaDiag02-CO-IOCSrv-2',
        'si-ps-trims-qs-m12-ia12': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia13': 'lnlsfac-srv2',
        'si-ps-trims-qs-m12-ia14': 'lnlsfac-srv2',
        'si-ps-trims-qs-m12-ia15': 'lnlsfac-srv2',
        'si-ps-trims-qs-m12-ia16': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia17': 'lnlsfac-srv2',
        'si-ps-trims-qs-m12-ia18': 'lnlsfac-srv2',
        'si-ps-trims-qs-m12-ia19': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-m12-ia20': 'lnlsfac-srv2',
        'si-ps-trims-qs-c1234-ia01': 'lnlsfac-srv2',
        'si-ps-trims-qs-c1234-ia02': 'CA-RaTim-CO-IOCSrv',
        'si-ps-trims-qs-c1234-ia03': 'lnlsfac-srv2',
        'si-ps-trims-qs-c1234-ia04': 'lnlsfac-srv2',
        'si-ps-trims-qs-c1234-ia05': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-c1234-ia06': 'lnlsfac-srv2',
        'si-ps-trims-qs-c1234-ia07': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-c1234-ia08': 'IA-16RaBbB-CO-IOCSrv',
        'si-ps-trims-qs-c1234-ia09': 'CA-RaTim-CO-IOCSrv',
        'si-ps-trims-qs-c1234-ia10': 'IA-14RaDiag03-CO-IOCSrv',
        'si-ps-trims-qs-c1234-ia11': 'lnlsfac-srv2',
        'si-ps-trims-qs-c1234-ia12': 'IA-20RaDiag02-CO-IOCSrv-2',
        'si-ps-trims-qs-c1234-ia13': 'lnlsfac-srv2',
        'si-ps-trims-qs-c1234-ia14': 'lnlsfac-srv2',
        'si-ps-trims-qs-c1234-ia15': 'lnlsfac-srv2',
        'si-ps-trims-qs-c1234-ia16': 'lnlsfac-srv2',
        'si-ps-trims-qs-c1234-ia17': 'lnlsfac-srv2',
        'si-ps-trims-qs-c1234-ia18': 'lnlsfac-srv2',
        'si-ps-trims-qs-c1234-ia19': 'lnlsfac-srv2',
        'si-ps-trims-qs-c1234-ia20': 'CA-RaTim-CO-IOCSrv',
        'si-ps-diag-fastcorrs': 'IA-20RaDiag02-CO-IOCSrv-2',
        'it-ps-lens': 'lnlsfac-srv2',
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
            'diag-fastcorrs': 'si-ps-diag-fastcorrs',
            },
        'it-ps': {
            'lens': 'it-ps-lens',
            },
        }


class DockerStackConfig(ServiceConfig):

    IMAGE_TAG_CSCONSTS = '__FAC_CSCONSTS_TAG_TEMPLATE__'
    IMAGE_TAG_IOCS = '__FAC_IOC_TAG_TEMPLATE__'

    def __init__(self, image_tag):
        self.version = '3.7'
        self.image_tag = image_tag
        if 'CSCONSTS' in image_tag:
            self.image = 'dockerregistry.lnls-sirius.com.br/fac/fac-csconsts:' + self.image_tag
            self.networks = ['host_network']
        else:
            self.image = 'dockerregistry.lnls-sirius.com.br/fac/fac-iocs:' + self.image_tag
            self.networks = ['ioc-network']
        self.replicas = '1'
        self.condition = 'any'
        self.driver = 'json-file'

    @staticmethod
    def get_command(app):
        strf = "bash -c '/ioc-apps/" + app + ".bash'"
        return strf

    def str_header(self):
        strf = ''
        strf += 'version: "' + self.version + '"'
        strf += '\n'
        strf += '\n' + 'services:'
        return strf

    def str_service(self, image, app, node, depends=None):
        strf = ''
        strf += '\n' + '    image: ' + image
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

    def __init__(self, app, node):
        super().__init__(DockerStackConfig.IMAGE_TAG_IOCS)
        self.app = app
        self.node = node

    def __str__(self):

        strf = self.str_header()
        strf += '\n'
        strf += '\n' + '  iocs:'
        strf += self.str_service(self.image, self.app, self.node)
        strf += '\n'
        strf += self.str_networks()
        return strf

    def save_config_file(self):
        fname = 'docker-stack-' + self.app + '.yml'
        print(self, file=open(fname, 'w'))


class DockerHighStackConfig(DockerStackConfig):

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
            strf += self.str_service(self.image, app, node, depends)
        strf += '\n'
        strf += self.str_networks()
        return strf

    def save_config_file(self):
        fname = 'docker-stack-' + self.stack + '.yml'
        print(self, file=open(fname, 'w'))


class DockerCSConstsConfig(DockerStackConfig):

    def __init__(self, app, node):
        super().__init__(DockerStackConfig.IMAGE_TAG_CSCONSTS)
        self.app = app
        self.node = node

    def __str__(self):

        strf = self.str_header()
        strf += '\n'
        strf += '\n' + '  facs-csconsts:'
        strf += self.str_service(self.image, self.app, self.node)
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

    for app, node in ServiceConfig.SERVICES_CSCONSTS.items():
        config = DockerCSConstsConfig(app=app, node=node)
        config.save_config_file()

    for app, node in ServiceConfig.SERVICES.items():
        config = DockerLowStackConfig(app=app, node=node)
        config.save_config_file()

    for stack in ServiceConfig.STACKS:
        config = DockerHighStackConfig(stack)
        config.save_config_file()


if __name__ == "__main__":
    generate_service_files()
