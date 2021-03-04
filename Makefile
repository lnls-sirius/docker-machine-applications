FAC_BASE_TAG:=$(shell cat ./images/.env | grep FAC_BASE_TAG= | sed s/FAC_BASE_TAG=//g)
FAC_EPICS_TAG:=$(shell cat ./images/.env | grep FAC_EPICS_TAG= | sed s/FAC_EPICS_TAG=//g)
FAC_APPS_TAG:=$(shell cat ./images/.env | grep FAC_APPS_TAG= | sed s/FAC_APPS_TAG=//g)
FAC_IOCS_TAG:=$(shell cat ./images/.env | grep FAC_IOCS_TAG= | sed s/FAC_IOCS_TAG=//g)

# --- images ---

image-build-fac-iocs: image-cleanup image-pull-fac-apps
	cd images; docker-compose --file docker-compose.yml build --force-rm --no-cache fac-iocs
	docker push dockerregistry.lnls-sirius.com.br/fac/fac-iocs:$(FAC_IOCS_TAG)

image-build-fac-apps: image-cleanup image-pull-fac-epics
	cd images; docker-compose --file docker-compose.yml build --force-rm --no-cache fac-apps
	docker push dockerregistry.lnls-sirius.com.br/fac/fac-apps:$(FAC_IOCS_TAG)

image-build-fac-epics: image-cleanup image-pull-fac-base
	cd images; docker-compose --file docker-compose.yml build --force-rm --no-cache fac-epics
	docker push dockerregistry.lnls-sirius.com.br/fac/fac-epics:$(FAC_EPICS_TAG)

image-build-fac-base: image-cleanup
	cd images; docker-compose --file docker-compose.yml build --force-rm --no-cache fac-base
	docker push dockerregistry.lnls-sirius.com.br/fac/fac-base:$(FAC_BASE_TAG)

image-pull-fac-iocs:
	docker pull dockerregistry.lnls-sirius.com.br/fac/fac-iocs:$(FAC_IOCS_TAG)

image-pull-fac-apps:
	docker pull dockerregistry.lnls-sirius.com.br/fac/fac-apps:$(FAC_APPS_TAG)

image-pull-fac-epics:
	docker pull dockerregistry.lnls-sirius.com.br/fac/fac-epics:$(FAC_EPICS_TAG)

image-pull-fac-base:
	docker pull dockerregistry.lnls-sirius.com.br/fac/fac-base:$(FAC_BASE_TAG)

image-cleanup:
	docker system prune --filter "label=br.com.lnls-sirius.department=FAC" --all --force


# --- higher stacking level services ---

service-stop-highstack-as-ps-dclinks:
	cd services; docker stack rm facs-as-ps-dclinks

service-start-highstack-as-ps-dclinks:
	cd services; docker stack deploy -c docker-stack-as-ps-dclinks.yml facs-as-ps-dclinks

service-stop-highstack-li-ps:
	cd services; docker stack rm facs-li-ps

service-start-highstack-li-ps:
	cd services; docker stack deploy -c docker-stack-li-ps.yml facs-li-ps

service-stop-highstack-tb-ps:
	cd services; docker stack rm facs-tb-ps

service-start-highstack-tb-ps:
	cd services; docker stack deploy -c docker-stack-tb-ps.yml facs-tb-ps

service-stop-highstack-bo-ps:
	cd services; docker stack rm facs-bo-ps

service-start-highstack-bo-ps:
	cd services; docker stack deploy -c docker-stack-bo-ps.yml facs-bo-ps

service-stop-highstack-ts-ps:
	cd services; docker stack rm facs-ts-ps

service-start-highstack-ts-ps:
	cd services; docker stack deploy -c docker-stack-ts-ps.yml facs-ts-ps

service-stop-highstack-si-ps:
	cd services; docker stack rm facs-si-ps

service-start-highstack-si-ps:
	cd services; docker stack deploy -c docker-stack-si-ps.yml facs-si-ps

service-stop-highstack-as-ti:
	cd services; docker stack rm facs-as-ti

service-start-highstack-as-ti:
	cd services; docker stack deploy -c docker-stack-as-ti.yml facs-as-ti

service-stop-highstack-as-pu-conv:
	cd services; docker stack rm facs-as-pu-conv

service-start-highstack-as-pu-conv:
	cd services; docker stack deploy -c docker-stack-as-pu-conv.yml facs-as-pu-conv

service-stop-highstack-as-ap-posang:
	cd services; docker stack rm facs-as-ap-posang

service-start-highstack-as-ap-posang:
	cd services; docker stack deploy -c docker-stack-as-ap-posang.yml facs-as-ap-posang

service-stop-highstack-as-ap-opticscorr:
	cd services; docker stack rm facs-as-ap-opticscorr

service-start-highstack-as-ap-opticscorr:
	cd services; docker stack deploy -c docker-stack-as-ap-opticscorr.yml facs-as-ap-opticscorr

service-stop-highstack-as-ap-currinfo:
	cd services; docker stack rm facs-as-ap-currinfo

service-start-highstack-as-ap-currinfo:
	cd services; docker stack deploy -c docker-stack-as-ap-currinfo.yml facs-as-ap-currinfo

service-stop-highstack-as-ap-sofb:
	cd services; docker stack rm facs-as-ap-sofb

service-start-highstack-as-ap-sofb:
	cd services; docker stack deploy -c docker-stack-as-ap-sofb.yml facs-as-ap-sofb

service-stop-highstack-si-ap-sofb:
	cd services; docker stack rm facs-si-ap-sofb

service-start-highstack-si-ap-sofb:
	cd services; docker stack deploy -c docker-stack-si-ap-sofb.yml facs-si-ap-sofb

service-stop-highstack-as-ap-diag:
	cd services; docker stack rm facs-as-ap-diag

service-start-highstack-as-ap-diag:
	cd services; docker stack deploy -c docker-stack-as-ap-diag.yml facs-as-ap-diag

service-stop-highstack-li-ap-energy:
	cd services; docker stack rm facs-li-ap-energy

service-start-highstack-li-ap-energy:
	cd services; docker stack deploy -c docker-stack-li-ap-energy.yml facs-li-ap-energy

service-stop-highstack-si-ap-bl:
	cd services; docker stack rm facs-si-ap-bl

service-start-highstack-si-ap-bl:
	cd services; docker stack deploy -c docker-stack-si-ap-bl.yml facs-si-ap-bl

service-stop-highstack-si-id-conv:
	cd services; docker stack rm facs-si-id-conv

service-start-highstack-si-id-conv:
	cd services; docker stack deploy -c docker-stack-si-id-conv.yml facs-si-id-conv

service-stop-highstack-as-ap-machshift:
	cd services; docker stack rm facs-as-ap-machshift

service-start-highstack-as-ap-machshift:
	cd services; docker stack deploy -c docker-stack-as-ap-machshift.yml facs-as-ap-machshift


TARGET_HIGHSTACK_DEPS_STOP := service-stop-highstack-as-ps-dclinks
TARGET_HIGHSTACK_DEPS_STOP += service-stop-highstack-li-ps
TARGET_HIGHSTACK_DEPS_STOP += service-stop-highstack-tb-ps
TARGET_HIGHSTACK_DEPS_STOP += service-stop-highstack-bo-ps
TARGET_HIGHSTACK_DEPS_STOP += service-stop-highstack-ts-ps
TARGET_HIGHSTACK_DEPS_STOP += service-stop-highstack-si-ps
TARGET_HIGHSTACK_DEPS_STOP += service-stop-highstack-as-ti
TARGET_HIGHSTACK_DEPS_STOP += service-stop-highstack-as-pu-conv
TARGET_HIGHSTACK_DEPS_STOP += service-stop-highstack-as-ap-posang
TARGET_HIGHSTACK_DEPS_STOP += service-stop-highstack-as-ap-opticscorr
TARGET_HIGHSTACK_DEPS_STOP += service-stop-highstack-as-ap-currinfo
TARGET_HIGHSTACK_DEPS_STOP += service-stop-highstack-as-ap-sofb
TARGET_HIGHSTACK_DEPS_STOP += service-stop-highstack-as-ap-diag
TARGET_HIGHSTACK_DEPS_STOP += service-stop-highstack-as-ap-machshift
TARGET_HIGHSTACK_DEPS_STOP += service-stop-highstack-li-ap-energy
TARGET_HIGHSTACK_DEPS_STOP += service-stop-highstack-si-ap-sofb
TARGET_HIGHSTACK_DEPS_STOP += service-stop-highstack-si-ap-bl
TARGET_HIGHSTACK_DEPS_STOP += service-stop-highstack-si-id-conv
service-stop-highstack-all: $(TARGET_HIGHSTACK_DEPS_STOP)

TARGET_HIGHSTACK_DEPS_START := service-start-highstack-as-ps-dclinks
TARGET_HIGHSTACK_DEPS_START += service-start-highstack-li-ps
TARGET_HIGHSTACK_DEPS_START += service-start-highstack-tb-ps
TARGET_HIGHSTACK_DEPS_START += service-start-highstack-bo-ps
TARGET_HIGHSTACK_DEPS_START += service-start-highstack-ts-ps
TARGET_HIGHSTACK_DEPS_START += service-start-highstack-si-ps
TARGET_HIGHSTACK_DEPS_START += service-start-highstack-as-ti
TARGET_HIGHSTACK_DEPS_START += service-start-highstack-as-pu-conv
TARGET_HIGHSTACK_DEPS_START += service-start-highstack-as-ap-posang
TARGET_HIGHSTACK_DEPS_START += service-start-highstack-as-ap-opticscorr
TARGET_HIGHSTACK_DEPS_START += service-start-highstack-as-ap-currinfo
TARGET_HIGHSTACK_DEPS_START += service-start-highstack-as-ap-sofb
TARGET_HIGHSTACK_DEPS_START += service-start-highstack-as-ap-diag
TARGET_HIGHSTACK_DEPS_START += service-start-highstack-as-ap-machshift
TARGET_HIGHSTACK_DEPS_START += service-start-highstack-li-ap-energy
TARGET_HIGHSTACK_DEPS_START += service-start-highstack-si-ap-sofb
TARGET_HIGHSTACK_DEPS_START += service-start-highstack-si-ap-bl
TARGET_HIGHSTACK_DEPS_START += service-start-highstack-si-id-conv
service-start-highstack-all: $(TARGET_HIGHSTACK_DEPS_START)

# --- middle stacking level services ---

# service-stop-midstack-bo-ps-fams:
# 	cd services; docker stack rm facs-bo-ps-fams

# service-start-midstack-bo-ps-fams:
# 	cd services; docker stack deploy -c docker-stack-bo-ps-fams.yml facs-bo-ps-fams

# service-stop-midstack-bo-ps-corrs:
# 	cd services; docker stack rm facs-bo-ps-corrs

# service-start-midstack-bo-ps-corrs:
# 	cd services; docker stack deploy -c docker-stack-bo-ps-corrs.yml facs-bo-ps-corrs

# TARGET_MIDSTACK_DEPS_START += service-start-midstack-bo-ps-fams
# TARGET_MIDSTACK_DEPS_START += service-start-midstack-bo-ps-corrs

# --- lower stacking level services ---

service-stop-lowstack-as-ps-dclinks-tbts-bodip:
	cd services; docker stack rm facs-as-ps-dclinks-tbts-bodip

service-start-lowstack-as-ps-dclinks-tbts-bodip:
	cd services; docker stack deploy -c docker-stack-as-ps-dclinks-tbts-bodip.yml facs-as-ps-dclinks-tbts-bodip

service-stop-lowstack-as-ps-dclinks-ia01t05:
	cd services; docker stack rm facs-as-ps-dclinks-ia01t05

service-start-lowstack-as-ps-dclinks-ia01t05:
	cd services; docker stack deploy -c docker-stack-as-ps-dclinks-ia01t05.yml facs-as-ps-dclinks-ia01t05

service-stop-lowstack-as-ps-dclinks-ia06t10:
	cd services; docker stack rm facs-as-ps-dclinks-ia06t10

service-start-lowstack-as-ps-dclinks-ia06t10:
	cd services; docker stack deploy -c docker-stack-as-ps-dclinks-ia06t10.yml facs-as-ps-dclinks-ia06t10

service-stop-lowstack-as-ps-dclinks-ia11t15:
	cd services; docker stack rm facs-as-ps-dclinks-ia11t15

service-start-lowstack-as-ps-dclinks-ia11t15:
	cd services; docker stack deploy -c docker-stack-as-ps-dclinks-ia11t15.yml facs-as-ps-dclinks-ia11t15

service-stop-lowstack-as-ps-dclinks-ia16t20:
	cd services; docker stack rm facs-as-ps-dclinks-ia16t20

service-start-lowstack-as-ps-dclinks-ia16t20:
	cd services; docker stack deploy -c docker-stack-as-ps-dclinks-ia16t20.yml facs-as-ps-dclinks-ia16t20

service-stop-lowstack-li-ps-spect-quads-lens:
	cd services; docker stack rm facs-li-ps-spect-quads-lens

service-start-lowstack-li-ps-spect-quads-lens:
	cd services; docker stack deploy -c docker-stack-li-ps-spect-quads-lens.yml facs-li-ps-spect-quads-lens

service-stop-lowstack-li-ps-corrs:
	cd services; docker stack rm facs-li-ps-corrs

service-start-lowstack-li-ps-corrs:
	cd services; docker stack deploy -c docker-stack-li-ps-corrs.yml facs-li-ps-corrs

service-stop-lowstack-li-ps-slnds:
	cd services; docker stack rm facs-li-ps-slnds

service-start-lowstack-li-ps-slnds:
	cd services; docker stack deploy -c docker-stack-li-ps-slnds.yml facs-li-ps-slnds

service-stop-lowstack-li-ps-conv:
	cd services; docker stack rm facs-li-ps-conv

service-start-lowstack-li-ps-conv:
	cd services; docker stack deploy -c docker-stack-li-ps-conv.yml facs-li-ps-conv

service-stop-lowstack-li-ps-diag:
	cd services; docker stack rm facs-li-ps-diag

service-start-lowstack-li-ps-diag:
	cd services; docker stack deploy -c docker-stack-li-ps-diag.yml facs-li-ps-diag

service-stop-lowstack-tb-ps:
	cd services; docker stack rm facs-tb-ps

service-start-lowstack-tb-ps:
	cd services; docker stack deploy -c docker-stack-tb-ps.yml facs-tb-ps

service-stop-lowstack-bo-ps-dips:
	cd services; docker stack rm facs-bo-ps-dips

service-start-lowstack-bo-ps-dips:
	cd services; docker stack deploy -c docker-stack-bo-ps-dips.yml facs-bo-ps-dips

service-stop-lowstack-bo-ps-quads:
	cd services; docker stack rm facs-bo-ps-quads

service-start-lowstack-bo-ps-quads:
	cd services; docker stack deploy -c docker-stack-bo-ps-quads.yml facs-bo-ps-quads

service-stop-lowstack-bo-ps-sexts:
	cd services; docker stack rm facs-bo-ps-sexts

service-start-lowstack-bo-ps-sexts:
	cd services; docker stack deploy -c docker-stack-bo-ps-sexts.yml facs-bo-ps-sexts

service-stop-lowstack-bo-ps-corrs-ia01:
	cd services; docker stack rm facs-bo-ps-corrs-ia01

service-start-lowstack-bo-ps-corrs-ia01:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs-ia01.yml facs-bo-ps-corrs-ia01

service-stop-lowstack-bo-ps-corrs-ia02:
	cd services; docker stack rm facs-bo-ps-corrs-ia02

service-start-lowstack-bo-ps-corrs-ia02:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs-ia02.yml facs-bo-ps-corrs-ia02

service-stop-lowstack-bo-ps-corrs-ia04:
	cd services; docker stack rm facs-bo-ps-corrs-ia04

service-start-lowstack-bo-ps-corrs-ia04:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs-ia04.yml facs-bo-ps-corrs-ia04

service-stop-lowstack-bo-ps-corrs-ia05:
	cd services; docker stack rm facs-bo-ps-corrs-ia05

service-start-lowstack-bo-ps-corrs-ia05:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs-ia05.yml facs-bo-ps-corrs-ia05

service-stop-lowstack-bo-ps-corrs-ia07:
	cd services; docker stack rm facs-bo-ps-corrs-ia07

service-start-lowstack-bo-ps-corrs-ia07:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs-ia07.yml facs-bo-ps-corrs-ia07

service-stop-lowstack-bo-ps-corrs-ia08:
	cd services; docker stack rm facs-bo-ps-corrs-ia08

service-start-lowstack-bo-ps-corrs-ia08:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs-ia08.yml facs-bo-ps-corrs-ia08

service-stop-lowstack-bo-ps-corrs-ia10:
	cd services; docker stack rm facs-bo-ps-corrs-ia10

service-start-lowstack-bo-ps-corrs-ia10:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs-ia10.yml facs-bo-ps-corrs-ia10

service-stop-lowstack-bo-ps-corrs-ia11:
	cd services; docker stack rm facs-bo-ps-corrs-ia11

service-start-lowstack-bo-ps-corrs-ia11:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs-ia11.yml facs-bo-ps-corrs-ia11

service-stop-lowstack-bo-ps-corrs-ia13:
	cd services; docker stack rm facs-bo-ps-corrs-ia13

service-start-lowstack-bo-ps-corrs-ia13:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs-ia13.yml facs-bo-ps-corrs-ia13

service-stop-lowstack-bo-ps-corrs-ia14:
	cd services; docker stack rm facs-bo-ps-corrs-ia14

service-start-lowstack-bo-ps-corrs-ia14:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs-ia14.yml facs-bo-ps-corrs-ia14

service-stop-lowstack-bo-ps-corrs-ia16:
	cd services; docker stack rm facs-bo-ps-corrs-ia16

service-start-lowstack-bo-ps-corrs-ia16:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs-ia16.yml facs-bo-ps-corrs-ia16

service-stop-lowstack-bo-ps-corrs-ia17:
	cd services; docker stack rm facs-bo-ps-corrs-ia17

service-start-lowstack-bo-ps-corrs-ia17:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs-ia17.yml facs-bo-ps-corrs-ia17

service-stop-lowstack-bo-ps-corrs-ia20:
	cd services; docker stack rm facs-bo-ps-corrs-ia20

service-start-lowstack-bo-ps-corrs-ia20:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs-ia20.yml facs-bo-ps-corrs-ia20

service-stop-lowstack-ts-ps:
	cd services; docker stack rm facs-ts-ps

service-start-lowstack-ts-ps:
	cd services; docker stack deploy -c docker-stack-ts-ps.yml facs-ts-ps

service-stop-lowstack-si-ps-dips:
	cd services; docker stack rm facs-si-ps-dips

service-start-lowstack-si-ps-dips:
	cd services; docker stack deploy -c docker-stack-si-ps-dips.yml facs-si-ps-dips

service-stop-lowstack-si-ps-quads-qd:
	cd services; docker stack rm facs-si-ps-quads-qd

service-start-lowstack-si-ps-quads-qd:
	cd services; docker stack deploy -c docker-stack-si-ps-quads-qd.yml facs-si-ps-quads-qd

service-stop-lowstack-si-ps-quads-qfq:
	cd services; docker stack rm facs-si-ps-quads-qfq

service-start-lowstack-si-ps-quads-qfq:
	cd services; docker stack deploy -c docker-stack-si-ps-quads-qfq.yml facs-si-ps-quads-qfq

service-stop-lowstack-si-ps-sexts-sda12b2-sfa0p0-sda0p0:
	cd services; docker stack rm facs-si-ps-sexts-sda12b2-sfa0p0-sda0p0

service-start-lowstack-si-ps-sexts-sda12b2-sfa0p0-sda0p0:
	cd services; docker stack deploy -c docker-stack-si-ps-sexts-sda12b2-sfa0p0-sda0p0.yml facs-si-ps-sexts-sda12b2-sfa0p0-sda0p0

service-stop-lowstack-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01:
	cd services; docker stack rm facs-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01

service-start-lowstack-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01:
	cd services; docker stack deploy -c docker-stack-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01.yml facs-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01

service-stop-lowstack-si-ps-sexts-sfb12-sdb3-sfp12-sdp23:
	cd services; docker stack rm facs-si-ps-sexts-sfb12-sdb3-sfp12-sdp23

service-start-lowstack-si-ps-sexts-sfb12-sdb3-sfp12-sdp23:
	cd services; docker stack deploy -c docker-stack-si-ps-sexts-sfb12-sdb3-sfp12-sdp23.yml facs-si-ps-sexts-sfb12-sdb3-sfp12-sdp23

service-stop-lowstack-si-ps-corrs-c2m12-ia01:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia01

service-start-lowstack-si-ps-corrs-c2m12-ia01:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia01.yml facs-si-ps-corrs-c2m12-ia01

service-stop-lowstack-si-ps-corrs-c2m12-ia02:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia02

service-start-lowstack-si-ps-corrs-c2m12-ia02:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia02.yml facs-si-ps-corrs-c2m12-ia02

service-stop-lowstack-si-ps-corrs-c2m12-ia03:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia03

service-start-lowstack-si-ps-corrs-c2m12-ia03:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia03.yml facs-si-ps-corrs-c2m12-ia03

service-stop-lowstack-si-ps-corrs-c2m12-ia04:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia04

service-start-lowstack-si-ps-corrs-c2m12-ia04:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia04.yml facs-si-ps-corrs-c2m12-ia04

service-stop-lowstack-si-ps-corrs-c2m12-ia05:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia05

service-start-lowstack-si-ps-corrs-c2m12-ia05:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia05.yml facs-si-ps-corrs-c2m12-ia05

service-stop-lowstack-si-ps-corrs-c2m12-ia06:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia06

service-start-lowstack-si-ps-corrs-c2m12-ia06:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia06.yml facs-si-ps-corrs-c2m12-ia06

service-stop-lowstack-si-ps-corrs-c2m12-ia07:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia07

service-start-lowstack-si-ps-corrs-c2m12-ia07:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia07.yml facs-si-ps-corrs-c2m12-ia07

service-stop-lowstack-si-ps-corrs-c2m12-ia08:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia08

service-start-lowstack-si-ps-corrs-c2m12-ia08:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia08.yml facs-si-ps-corrs-c2m12-ia08

service-stop-lowstack-si-ps-corrs-c2m12-ia09:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia09

service-start-lowstack-si-ps-corrs-c2m12-ia09:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia09.yml facs-si-ps-corrs-c2m12-ia09

service-stop-lowstack-si-ps-corrs-c2m12-ia10:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia10

service-start-lowstack-si-ps-corrs-c2m12-ia10:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia10.yml facs-si-ps-corrs-c2m12-ia10

service-stop-lowstack-si-ps-corrs-c2m12-ia11:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia11

service-start-lowstack-si-ps-corrs-c2m12-ia11:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia11.yml facs-si-ps-corrs-c2m12-ia11

service-stop-lowstack-si-ps-corrs-c2m12-ia12:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia12

service-start-lowstack-si-ps-corrs-c2m12-ia12:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia12.yml facs-si-ps-corrs-c2m12-ia12

service-stop-lowstack-si-ps-corrs-c2m12-ia13:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia13

service-start-lowstack-si-ps-corrs-c2m12-ia13:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia13.yml facs-si-ps-corrs-c2m12-ia13

service-stop-lowstack-si-ps-corrs-c2m12-ia14:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia14

service-start-lowstack-si-ps-corrs-c2m12-ia14:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia14.yml facs-si-ps-corrs-c2m12-ia14

service-stop-lowstack-si-ps-corrs-c2m12-ia15:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia15

service-start-lowstack-si-ps-corrs-c2m12-ia15:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia15.yml facs-si-ps-corrs-c2m12-ia15

service-stop-lowstack-si-ps-corrs-c2m12-ia16:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia16

service-start-lowstack-si-ps-corrs-c2m12-ia16:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia16.yml facs-si-ps-corrs-c2m12-ia16

service-stop-lowstack-si-ps-corrs-c2m12-ia17:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia17

service-start-lowstack-si-ps-corrs-c2m12-ia17:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia17.yml facs-si-ps-corrs-c2m12-ia17

service-stop-lowstack-si-ps-corrs-c2m12-ia18:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia18

service-start-lowstack-si-ps-corrs-c2m12-ia18:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia18.yml facs-si-ps-corrs-c2m12-ia18

service-stop-lowstack-si-ps-corrs-c2m12-ia19:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia19

service-start-lowstack-si-ps-corrs-c2m12-ia19:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia19.yml facs-si-ps-corrs-c2m12-ia19

service-stop-lowstack-si-ps-corrs-c2m12-ia20:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia20

service-start-lowstack-si-ps-corrs-c2m12-ia20:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia20.yml facs-si-ps-corrs-c2m12-ia20

service-stop-lowstack-si-ps-corrs-c134-ia01:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia01

service-start-lowstack-si-ps-corrs-c134-ia01:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia01.yml facs-si-ps-corrs-c134-ia01

service-stop-lowstack-si-ps-corrs-c134-ia02:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia02

service-start-lowstack-si-ps-corrs-c134-ia02:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia02.yml facs-si-ps-corrs-c134-ia02

service-stop-lowstack-si-ps-corrs-c134-ia03:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia03

service-start-lowstack-si-ps-corrs-c134-ia03:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia03.yml facs-si-ps-corrs-c134-ia03

service-stop-lowstack-si-ps-corrs-c134-ia04:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia04

service-start-lowstack-si-ps-corrs-c134-ia04:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia04.yml facs-si-ps-corrs-c134-ia04

service-stop-lowstack-si-ps-corrs-c134-ia05:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia05

service-start-lowstack-si-ps-corrs-c134-ia05:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia05.yml facs-si-ps-corrs-c134-ia05

service-stop-lowstack-si-ps-corrs-c134-ia06:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia06

service-start-lowstack-si-ps-corrs-c134-ia06:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia06.yml facs-si-ps-corrs-c134-ia06

service-stop-lowstack-si-ps-corrs-c134-ia07:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia07

service-start-lowstack-si-ps-corrs-c134-ia07:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia07.yml facs-si-ps-corrs-c134-ia07

service-stop-lowstack-si-ps-corrs-c134-ia08:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia08

service-start-lowstack-si-ps-corrs-c134-ia08:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia08.yml facs-si-ps-corrs-c134-ia08

service-stop-lowstack-si-ps-corrs-c134-ia09:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia09

service-start-lowstack-si-ps-corrs-c134-ia09:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia09.yml facs-si-ps-corrs-c134-ia09

service-stop-lowstack-si-ps-corrs-c134-ia10:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia10

service-start-lowstack-si-ps-corrs-c134-ia10:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia10.yml facs-si-ps-corrs-c134-ia10

service-stop-lowstack-si-ps-corrs-c134-ia11:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia11

service-start-lowstack-si-ps-corrs-c134-ia11:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia11.yml facs-si-ps-corrs-c134-ia11

service-stop-lowstack-si-ps-corrs-c134-ia12:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia12

service-start-lowstack-si-ps-corrs-c134-ia12:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia12.yml facs-si-ps-corrs-c134-ia12

service-stop-lowstack-si-ps-corrs-c134-ia13:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia13

service-start-lowstack-si-ps-corrs-c134-ia13:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia13.yml facs-si-ps-corrs-c134-ia13

service-stop-lowstack-si-ps-corrs-c134-ia14:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia14

service-start-lowstack-si-ps-corrs-c134-ia14:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia14.yml facs-si-ps-corrs-c134-ia14

service-stop-lowstack-si-ps-corrs-c134-ia15:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia15

service-start-lowstack-si-ps-corrs-c134-ia15:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia15.yml facs-si-ps-corrs-c134-ia15

service-stop-lowstack-si-ps-corrs-c134-ia16:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia16

service-start-lowstack-si-ps-corrs-c134-ia16:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia16.yml facs-si-ps-corrs-c134-ia16

service-stop-lowstack-si-ps-corrs-c134-ia17:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia17

service-start-lowstack-si-ps-corrs-c134-ia17:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia17.yml facs-si-ps-corrs-c134-ia17

service-stop-lowstack-si-ps-corrs-c134-ia18:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia18

service-start-lowstack-si-ps-corrs-c134-ia18:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia18.yml facs-si-ps-corrs-c134-ia18

service-stop-lowstack-si-ps-corrs-c134-ia19:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia19

service-start-lowstack-si-ps-corrs-c134-ia19:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia19.yml facs-si-ps-corrs-c134-ia19

service-stop-lowstack-si-ps-corrs-c134-ia20:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia20

service-start-lowstack-si-ps-corrs-c134-ia20:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134-ia20.yml facs-si-ps-corrs-c134-ia20

service-stop-lowstack-si-ps-trims-qs-m12-ia01:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia01

service-start-lowstack-si-ps-trims-qs-m12-ia01:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia01.yml facs-si-ps-trims-qs-m12-ia01

service-stop-lowstack-si-ps-trims-qs-m12-ia02:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia02

service-start-lowstack-si-ps-trims-qs-m12-ia02:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia02.yml facs-si-ps-trims-qs-m12-ia02

service-stop-lowstack-si-ps-trims-qs-m12-ia03:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia03

service-start-lowstack-si-ps-trims-qs-m12-ia03:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia03.yml facs-si-ps-trims-qs-m12-ia03

service-stop-lowstack-si-ps-trims-qs-m12-ia04:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia04

service-start-lowstack-si-ps-trims-qs-m12-ia04:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia04.yml facs-si-ps-trims-qs-m12-ia04

service-stop-lowstack-si-ps-trims-qs-m12-ia05:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia05

service-start-lowstack-si-ps-trims-qs-m12-ia05:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia05.yml facs-si-ps-trims-qs-m12-ia05

service-stop-lowstack-si-ps-trims-qs-m12-ia06:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia06

service-start-lowstack-si-ps-trims-qs-m12-ia06:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia06.yml facs-si-ps-trims-qs-m12-ia06

service-stop-lowstack-si-ps-trims-qs-m12-ia07:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia07

service-start-lowstack-si-ps-trims-qs-m12-ia07:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia07.yml facs-si-ps-trims-qs-m12-ia07

service-stop-lowstack-si-ps-trims-qs-m12-ia08:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia08

service-start-lowstack-si-ps-trims-qs-m12-ia08:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia08.yml facs-si-ps-trims-qs-m12-ia08

service-stop-lowstack-si-ps-trims-qs-m12-ia09:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia09

service-start-lowstack-si-ps-trims-qs-m12-ia09:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia09.yml facs-si-ps-trims-qs-m12-ia09

service-stop-lowstack-si-ps-trims-qs-m12-ia10:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia10

service-start-lowstack-si-ps-trims-qs-m12-ia10:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia10.yml facs-si-ps-trims-qs-m12-ia10

service-stop-lowstack-si-ps-trims-qs-m12-ia11:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia11

service-start-lowstack-si-ps-trims-qs-m12-ia11:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia11.yml facs-si-ps-trims-qs-m12-ia11

service-stop-lowstack-si-ps-trims-qs-m12-ia12:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia12

service-start-lowstack-si-ps-trims-qs-m12-ia12:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia12.yml facs-si-ps-trims-qs-m12-ia12

service-stop-lowstack-si-ps-trims-qs-m12-ia13:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia13

service-start-lowstack-si-ps-trims-qs-m12-ia13:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia13.yml facs-si-ps-trims-qs-m12-ia13

service-stop-lowstack-si-ps-trims-qs-m12-ia14:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia14

service-start-lowstack-si-ps-trims-qs-m12-ia14:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia14.yml facs-si-ps-trims-qs-m12-ia14

service-stop-lowstack-si-ps-trims-qs-m12-ia15:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia15

service-start-lowstack-si-ps-trims-qs-m12-ia15:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia15.yml facs-si-ps-trims-qs-m12-ia15

service-stop-lowstack-si-ps-trims-qs-m12-ia16:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia16

service-start-lowstack-si-ps-trims-qs-m12-ia16:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia16.yml facs-si-ps-trims-qs-m12-ia16

service-stop-lowstack-si-ps-trims-qs-m12-ia17:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia17

service-start-lowstack-si-ps-trims-qs-m12-ia17:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia17.yml facs-si-ps-trims-qs-m12-ia17

service-stop-lowstack-si-ps-trims-qs-m12-ia18:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia18

service-start-lowstack-si-ps-trims-qs-m12-ia18:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia18.yml facs-si-ps-trims-qs-m12-ia18

service-stop-lowstack-si-ps-trims-qs-m12-ia19:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia19

service-start-lowstack-si-ps-trims-qs-m12-ia19:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia19.yml facs-si-ps-trims-qs-m12-ia19

service-stop-lowstack-si-ps-trims-qs-m12-ia20:
	cd services; docker stack rm facs-si-ps-trims-qs-m12-ia20

service-start-lowstack-si-ps-trims-qs-m12-ia20:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia20.yml facs-si-ps-trims-qs-m12-ia20

service-stop-lowstack-si-ps-trims-qs-c1234-ia01:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia01

service-start-lowstack-si-ps-trims-qs-c1234-ia01:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia01.yml facs-si-ps-trims-qs-c1234-ia01

service-stop-lowstack-si-ps-trims-qs-c1234-ia02:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia02

service-start-lowstack-si-ps-trims-qs-c1234-ia02:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia02.yml facs-si-ps-trims-qs-c1234-ia02

service-stop-lowstack-si-ps-trims-qs-c1234-ia03:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia03

service-start-lowstack-si-ps-trims-qs-c1234-ia03:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia03.yml facs-si-ps-trims-qs-c1234-ia03

service-stop-lowstack-si-ps-trims-qs-c1234-ia04:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia04

service-start-lowstack-si-ps-trims-qs-c1234-ia04:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia04.yml facs-si-ps-trims-qs-c1234-ia04

service-stop-lowstack-si-ps-trims-qs-c1234-ia05:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia05

service-start-lowstack-si-ps-trims-qs-c1234-ia05:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia05.yml facs-si-ps-trims-qs-c1234-ia05

service-stop-lowstack-si-ps-trims-qs-c1234-ia06:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia06

service-start-lowstack-si-ps-trims-qs-c1234-ia06:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia06.yml facs-si-ps-trims-qs-c1234-ia06

service-stop-lowstack-si-ps-trims-qs-c1234-ia07:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia07

service-start-lowstack-si-ps-trims-qs-c1234-ia07:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia07.yml facs-si-ps-trims-qs-c1234-ia07

service-stop-lowstack-si-ps-trims-qs-c1234-ia08:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia08

service-start-lowstack-si-ps-trims-qs-c1234-ia08:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia08.yml facs-si-ps-trims-qs-c1234-ia08

service-stop-lowstack-si-ps-trims-qs-c1234-ia09:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia09

service-start-lowstack-si-ps-trims-qs-c1234-ia09:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia09.yml facs-si-ps-trims-qs-c1234-ia09

service-stop-lowstack-si-ps-trims-qs-c1234-ia10:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia10

service-start-lowstack-si-ps-trims-qs-c1234-ia10:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia10.yml facs-si-ps-trims-qs-c1234-ia10

service-stop-lowstack-si-ps-trims-qs-c1234-ia11:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia11

service-start-lowstack-si-ps-trims-qs-c1234-ia11:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia11.yml facs-si-ps-trims-qs-c1234-ia11

service-stop-lowstack-si-ps-trims-qs-c1234-ia12:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia12

service-start-lowstack-si-ps-trims-qs-c1234-ia12:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia12.yml facs-si-ps-trims-qs-c1234-ia12

service-stop-lowstack-si-ps-trims-qs-c1234-ia13:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia13

service-start-lowstack-si-ps-trims-qs-c1234-ia13:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia13.yml facs-si-ps-trims-qs-c1234-ia13

service-stop-lowstack-si-ps-trims-qs-c1234-ia14:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia14

service-start-lowstack-si-ps-trims-qs-c1234-ia14:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia14.yml facs-si-ps-trims-qs-c1234-ia14

service-stop-lowstack-si-ps-trims-qs-c1234-ia15:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia15

service-start-lowstack-si-ps-trims-qs-c1234-ia15:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia15.yml facs-si-ps-trims-qs-c1234-ia15

service-stop-lowstack-si-ps-trims-qs-c1234-ia16:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia16

service-start-lowstack-si-ps-trims-qs-c1234-ia16:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia16.yml facs-si-ps-trims-qs-c1234-ia16

service-stop-lowstack-si-ps-trims-qs-c1234-ia17:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia17

service-start-lowstack-si-ps-trims-qs-c1234-ia17:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia17.yml facs-si-ps-trims-qs-c1234-ia17

service-stop-lowstack-si-ps-trims-qs-c1234-ia18:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia18

service-start-lowstack-si-ps-trims-qs-c1234-ia18:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia18.yml facs-si-ps-trims-qs-c1234-ia18

service-stop-lowstack-si-ps-trims-qs-c1234-ia19:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia19

service-start-lowstack-si-ps-trims-qs-c1234-ia19:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia19.yml facs-si-ps-trims-qs-c1234-ia19

service-stop-lowstack-si-ps-trims-qs-c1234-ia20:
	cd services; docker stack rm facs-si-ps-trims-qs-c1234-ia20

service-start-lowstack-si-ps-trims-qs-c1234-ia20:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia20.yml facs-si-ps-trims-qs-c1234-ia20

service-stop-lowstack-as-ti-general:
	cd services; docker stack rm facs-as-ti-general

service-start-lowstack-as-ti-general:
	cd services; docker stack deploy -c docker-stack-as-ti-general.yml facs-as-ti-general

service-stop-lowstack-bo-ti-bpms-corrs:
	cd services; docker stack rm facs-bo-ti-bpms-corrs

service-start-lowstack-bo-ti-bpms-corrs:
	cd services; docker stack deploy -c docker-stack-bo-ti-bpms-corrs.yml facs-bo-ti-bpms-corrs

service-stop-lowstack-si-ti-bpms-corrs:
	cd services; docker stack rm facs-si-ti-bpms-corrs

service-start-lowstack-si-ti-bpms-corrs:
	cd services; docker stack deploy -c docker-stack-si-ti-bpms-corrs.yml facs-si-ti-bpms-corrs

service-stop-lowstack-si-ti-trims-skews:
	cd services; docker stack rm facs-si-ti-trims-skews

service-start-lowstack-si-ti-trims-skews:
	cd services; docker stack deploy -c docker-stack-si-ti-trims-skews.yml facs-si-ti-trims-skews

service-stop-lowstack-as-pu-conv:
	cd services; docker stack rm facs-as-pu-conv

service-start-lowstack-as-pu-conv:
	cd services; docker stack deploy -c docker-stack-as-pu-conv.yml facs-as-pu-conv

service-stop-lowstack-as-ap-posang:
	cd services; docker stack rm facs-as-ap-posang

service-start-lowstack-as-ap-posang:
	cd services; docker stack deploy -c docker-stack-as-ap-posang.yml facs-as-ap-posang

service-stop-lowstack-as-ap-opticscorr:
	cd services; docker stack rm facs-as-ap-opticscorr

service-start-lowstack-as-ap-opticscorr:
	cd services; docker stack deploy -c docker-stack-as-ap-opticscorr.yml facs-as-ap-opticscorr

service-stop-lowstack-as-ap-currinfo:
	cd services; docker stack rm facs-as-ap-currinfo

service-start-lowstack-as-ap-currinfo:
	cd services; docker stack deploy -c docker-stack-as-ap-currinfo.yml facs-as-ap-currinfo

service-stop-lowstack-as-ap-sofb:
	cd services; docker stack rm facs-as-ap-sofb

service-start-lowstack-as-ap-sofb:
	cd services; docker stack deploy -c docker-stack-as-ap-sofb.yml facs-as-ap-sofb

service-stop-lowstack-si-ap-sofb:
	cd services; docker stack rm facs-si-ap-sofb

service-start-lowstack-si-ap-sofb:
	cd services; docker stack deploy -c docker-stack-si-ap-sofb.yml facs-si-ap-sofb

service-stop-lowstack-as-ap-diag:
	cd services; docker stack rm facs-as-ap-diag

service-start-lowstack-as-ap-diag:
	cd services; docker stack deploy -c docker-stack-as-ap-diag.yml facs-as-ap-diag

service-stop-lowstack-li-ap-energy:
	cd services; docker stack rm facs-li-ap-energy

service-start-lowstack-li-ap-energy:
	cd services; docker stack deploy -c docker-stack-li-ap-energy.yml facs-li-ap-energy

service-stop-lowstack-si-ap-bl:
	cd services; docker stack rm facs-si-ap-bl

service-start-lowstack-si-ap-bl:
	cd services; docker stack deploy -c docker-stack-si-ap-bl.yml facs-si-ap-bl

service-stop-lowstack-si-id-conv:
	cd services; docker stack rm facs-si-id-conv

service-start-lowstack-si-id-conv:
	cd services; docker stack deploy -c docker-stack-si-id-conv.yml facs-si-id-conv

service-stop-lowstack-as-ap-machshift:
	cd services; docker stack rm facs-as-ap-machshift

service-start-lowstack-as-ap-machshift:
	cd services; docker stack deploy -c docker-stack-as-ap-machshift.yml facs-as-ap-machshift

TARGET_LOWSTACK_DEPS_STOP := service-stop-lowstack-as-ps-dclinks-tbts-bodip
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-as-ps-dclinks-ia01t05
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-as-ps-dclinks-ia06t10
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-as-ps-dclinks-ia11t15
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-as-ps-dclinks-ia16t20
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-li-ps-spect-quads-lens
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-li-ps-corrs
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-li-ps-slnds
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-li-ps-conv
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-li-ps-diag
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-tb-ps
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-bo-ps-dips
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-bo-ps-quads
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-bo-ps-sexts
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-bo-ps-fams
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-bo-ps-corrs-ia01t05
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-bo-ps-corrs-ia06t10
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-bo-ps-corrs-ia11t15
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-bo-ps-corrs-ia16t20
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-bo-ps-corrs
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-ts-ps
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-dips
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-quads-qd
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-quads-qfq
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-sexts-sda12b2-sfa0p0-sda0p0
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-sexts-sfb12-sdb3-sfp12-sdp23
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia01
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia02
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia03
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia04
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia05
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia06
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia07
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia08
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia09
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia10
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia11
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia12
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia13
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia14
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia15
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia16
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia17
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia18
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia19
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c2m12-ia20
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia01
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia02
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia03
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia04
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia05
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia06
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia07
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia08
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia09
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia10
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia11
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia12
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia13
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia14
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia15
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia16
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia17
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia18
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia19
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-corrs-c134-ia20
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia01
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia02
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia03
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia04
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia05
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia06
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia07
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia08
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia09
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia10
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia11
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia12
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia13
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia14
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia15
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia16
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia17
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia18
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia19
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-m12-ia20
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia01
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia02
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia03
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia04
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia05
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia06
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia07
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia08
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia09
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia10
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia11
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia12
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia13
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia14
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia15
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia16
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia17
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia18
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia19
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ps-trims-qs-c1234-ia20
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-as-ti-general
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-bo-ti-bpms-corrs
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ti-bpms-corrs
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ti-trims-skews
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-as-pu-conv
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-as-ap-posang
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-as-ap-opticscorr
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-as-ap-currinfo
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-as-ap-sofb
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ap-sofb
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-as-ap-diag
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-li-ap-energy
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-ap-bl
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-si-id-conv
TARGET_LOWSTACK_DEPS_STOP += service-stop-lowstack-as-ap-machshift
service-stop-lowstack-all: $(TARGET_LOWSTACK_DEPS_STOP)

TARGET_LOWSTACK_DEPS_START := service-start-lowstack-as-ps-dclinks-tbts-bodip
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-as-ps-dclinks-ia01t05
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-as-ps-dclinks-ia06t10
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-as-ps-dclinks-ia11t15
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-as-ps-dclinks-ia16t20
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-li-ps-spect-quads-lens
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-li-ps-corrs
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-li-ps-slnds
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-li-ps-conv
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-li-ps-diag
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-tb-ps
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-bo-ps-dips
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-bo-ps-quads
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-bo-ps-sexts
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-bo-ps-corrs-ia01
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-bo-ps-corrs-ia02
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-bo-ps-corrs-ia04
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-bo-ps-corrs-ia05
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-bo-ps-corrs-ia07
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-bo-ps-corrs-ia08
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-bo-ps-corrs-ia10
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-bo-ps-corrs-ia11
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-bo-ps-corrs-ia13
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-bo-ps-corrs-ia14
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-bo-ps-corrs-ia16
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-bo-ps-corrs-ia17
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-bo-ps-corrs-ia20
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-ts-ps
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-dips
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-quads-qd
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-quads-qfq
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-sexts-sda12b2-sfa0p0-sda0p0
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-sexts-sfb12-sdb3-sfp12-sdp23
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia01
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia02
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia03
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia04
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia05
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia06
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia07
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia08
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia09
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia10
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia11
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia12
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia13
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia14
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia15
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia16
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia17
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia18
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia19
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c2m12-ia20
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia01
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia02
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia03
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia04
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia05
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia06
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia07
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia08
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia09
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia10
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia11
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia12
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia13
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia14
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia15
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia16
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia17
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia18
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia19
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-corrs-c134-ia20
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia01
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia02
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia03
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia04
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia05
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia06
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia07
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia08
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia09
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia10
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia11
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia12
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia13
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia14
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia15
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia16
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia17
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia18
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia19
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-m12-ia20
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia01
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia02
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia03
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia04
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia05
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia06
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia07
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia08
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia09
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia10
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia11
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia12
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia13
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia14
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia15
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia16
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia17
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia18
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia19
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ps-trims-qs-c1234-ia20
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-as-ti-general
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-bo-ti-bpms-corrs
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ti-bpms-corrs
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ti-trims-skews
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-as-pu-conv
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-as-ap-posang
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-as-ap-opticscorr
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-as-ap-currinfo
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-as-ap-sofb
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ap-sofb
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-as-ap-diag
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-li-ap-energy
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-ap-bl
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-si-id-conv
TARGET_LOWSTACK_DEPS_START += service-start-lowstack-as-ap-machshift
service-start-lowstack-all: $(TARGET_LOWSTACK_DEPS_START)


# --- stop all services ---

TARGET_DEPS_STOP := $(TARGET_HIGHSTACK_DEPS_STOP)
TARGET_DEPS_STOP += $(TARGET_LOWSTACK_DEPS_STOP)
service-stop-all: $(TARGET_DEPS_STOP)
