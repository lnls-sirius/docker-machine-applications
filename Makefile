FAC_BASE_TAG:=$(shell cat ./images/.env | grep FAC_BASE_TAG= | sed s/FAC_BASE_TAG=//g)
FAC_EPICS_TAG:=$(shell cat ./images/.env | grep FAC_EPICS_TAG= | sed s/FAC_EPICS_TAG=//g)
FAC_APPS_TAG:=$(shell cat ./images/.env | grep FAC_APPS_TAG= | sed s/FAC_APPS_TAG=//g)
FAC_IOCS_TAG:=$(shell cat ./images/.env | grep FAC_IOCS_TAG= | sed s/FAC_IOCS_TAG=//g)


# --- images ---

build-fac-iocs: cleanup pull-fac-apps
	cd images; docker-compose --file docker-compose.yml build --force-rm --no-cache fac-iocs
	docker push dockerregistry.lnls-sirius.com.br/fac/fac-iocs:$(FAC_IOCS_TAG)

build-fac-apps: cleanup pull-fac-epics
	cd images; docker-compose --file docker-compose.yml build --force-rm --no-cache fac-apps
	docker push dockerregistry.lnls-sirius.com.br/fac/fac-apps:$(FAC_IOCS_TAG)

build-fac-epics: cleanup pull-fac-base
	cd images; docker-compose --file docker-compose.yml build --force-rm --no-cache fac-epics
	docker push dockerregistry.lnls-sirius.com.br/fac/fac-epics:$(FAC_EPICS_TAG)

build-fac-base: cleanup
	cd images; docker-compose --file docker-compose.yml build --force-rm --no-cache fac-base
	docker push dockerregistry.lnls-sirius.com.br/fac/fac-base:$(FAC_BASE_TAG)

pull-fac-iocs:
	docker pull dockerregistry.lnls-sirius.com.br/fac/fac-iocs:$(FAC_IOCS_TAG)

pull-fac-apps:
	docker pull dockerregistry.lnls-sirius.com.br/fac/fac-apps:$(FAC_APPS_TAG)

pull-fac-epics:
	docker pull dockerregistry.lnls-sirius.com.br/fac/fac-epics:$(FAC_EPICS_TAG)

pull-fac-base:
	docker pull dockerregistry.lnls-sirius.com.br/fac/fac-base:$(FAC_BASE_TAG)

cleanup:
	docker system prune --filter "label=br.com.lnls-sirius.department=FAC" --all --force


# --- services ---

service-facs-as-ps-dclinks-tbts-bodip-stop:
	cd services; docker stack rm fac-facs-as-ps-dclinks-tbts-bodip

service-facs-as-ps-dclinks-tbts-bodip-start:
	cd services; docker stack deploy -c docker-stack-service-facs-as-ps-dclinks-tbts-bodip.yml facs-as-ps-dclinks-tbts-bodip

service-facs-as-ps-dclinks-ia01t10-stop:
	cd services; docker stack rm fac-facs-as-ps-dclinks-ia01t10

service-facs-as-ps-dclinks-ia01t10-start:
	cd services; docker stack deploy -c docker-stack-service-facs-as-ps-dclinks-ia01t10.yml facs-as-ps-dclinks-ia01t10

service-facs-as-ps-dclinks-ia11t20-stop:
	cd services; docker stack rm fac-facs-as-ps-dclinks-ia11t20

service-facs-as-ps-dclinks-ia11t20-start:
	cd services; docker stack deploy -c docker-stack-service-facs-as-ps-dclinks-ia11t20.yml facs-as-ps-dclinks-ia11t20

service-facs-li-ps-spect-quads-lens-stop:
	cd services; docker stack rm fac-facs-li-ps-spect-quads-lens

service-facs-li-ps-spect-quads-lens-start:
	cd services; docker stack deploy -c docker-stack-service-facs-li-ps-spect-quads-lens.yml facs-li-ps-spect-quads-lens

service-facs-li-ps-corrs-stop:
	cd services; docker stack rm fac-facs-li-ps-corrs

service-facs-li-ps-corrs-start:
	cd services; docker stack deploy -c docker-stack-service-facs-li-ps-corrs.yml facs-li-ps-corrs

service-facs-li-ps-slnds-stop:
	cd services; docker stack rm fac-facs-li-ps-slnds

service-facs-li-ps-slnds-start:
	cd services; docker stack deploy -c docker-stack-service-facs-li-ps-slnds.yml facs-li-ps-slnds

service-facs-li-ps-conv-stop:
	cd services; docker stack rm fac-facs-li-ps-conv

service-facs-li-ps-conv-start:
	cd services; docker stack deploy -c docker-stack-service-facs-li-ps-conv.yml facs-li-ps-conv

service-facs-li-ps-diag-stop:
	cd services; docker stack rm fac-facs-li-ps-diag

service-facs-li-ps-diag-start:
	cd services; docker stack deploy -c docker-stack-service-facs-li-ps-diag.yml facs-li-ps-diag

service-facs-tb-ps-stop:
	cd services; docker stack rm fac-facs-tb-ps

service-facs-tb-ps-start:
	cd services; docker stack deploy -c docker-stack-service-facs-tb-ps.yml facs-tb-ps

service-facs-bo-ps-dips-stop:
	cd services; docker stack rm fac-facs-bo-ps-dips

service-facs-bo-ps-dips-start:
	cd services; docker stack deploy -c docker-stack-service-facs-bo-ps-dips.yml facs-bo-ps-dips

service-facs-bo-ps-quads-stop:
	cd services; docker stack rm fac-facs-bo-ps-quads

service-facs-bo-ps-quads-start:
	cd services; docker stack deploy -c docker-stack-service-facs-bo-ps-quads.yml facs-bo-ps-quads

service-facs-bo-ps-sexts-stop:
	cd services; docker stack rm fac-facs-bo-ps-sexts

service-facs-bo-ps-sexts-start:
	cd services; docker stack deploy -c docker-stack-service-facs-bo-ps-sexts.yml facs-bo-ps-sexts

service-facs-bo-ps-corrs-ia01t10-stop:
	cd services; docker stack rm fac-facs-bo-ps-corrs-ia01t10

service-facs-bo-ps-corrs-ia01t10-start:
	cd services; docker stack deploy -c docker-stack-service-facs-bo-ps-corrs-ia01t10.yml facs-bo-ps-corrs-ia01t10

service-facs-bo-ps-corrs-ia11t20-stop:
	cd services; docker stack rm fac-facs-bo-ps-corrs-ia11t20

service-facs-bo-ps-corrs-ia11t20-start:
	cd services; docker stack deploy -c docker-stack-service-facs-bo-ps-corrs-ia11t20.yml facs-bo-ps-corrs-ia11t20

service-facs-ts-ps-stop:
	cd services; docker stack rm fac-facs-ts-ps

service-facs-ts-ps-start:
	cd services; docker stack deploy -c docker-stack-service-facs-ts-ps.yml facs-ts-ps

service-facs-si-ps-fams-dips-stop:
	cd services; docker stack rm fac-facs-si-ps-fams-dips

service-facs-si-ps-fams-dips-start:
	cd services; docker stack deploy -c docker-stack-service-facs-si-ps-fams-dips.yml facs-si-ps-fams-dips

service-facs-si-ps-fams-quads-stop:
	cd services; docker stack rm fac-facs-si-ps-fams-quads

service-facs-si-ps-fams-quads-start:
	cd services; docker stack deploy -c docker-stack-service-facs-si-ps-fams-quads.yml facs-si-ps-fams-quads

service-facs-si-ps-fams-sexts-stop:
	cd services; docker stack rm fac-facs-si-ps-fams-sexts

service-facs-si-ps-fams-sexts-start:
	cd services; docker stack deploy -c docker-stack-service-facs-si-ps-fams-sexts.yml facs-si-ps-fams-sexts

service-facs-si-ps-corrs-c2m12-ia01t10-stop:
	cd services; docker stack rm fac-facs-si-ps-corrs-c2m12-ia01t10

service-facs-si-ps-corrs-c2m12-ia01t10-start:
	cd services; docker stack deploy -c docker-stack-service-facs-si-ps-corrs-c2m12-ia01t10.yml facs-si-ps-corrs-c2m12-ia01t10

service-facs-si-ps-corrs-c2m12-ia11t20-stop:
	cd services; docker stack rm fac-facs-si-ps-corrs-c2m12-ia11t20

service-facs-si-ps-corrs-c2m12-ia11t20-start:
	cd services; docker stack deploy -c docker-stack-service-facs-si-ps-corrs-c2m12-ia11t20.yml facs-si-ps-corrs-c2m12-ia11t20

service-facs-si-ps-corrs-c134-ia01t10-stop:
	cd services; docker stack rm fac-facs-si-ps-corrs-c134-ia01t10

service-facs-si-ps-corrs-c134-ia01t10-start:
	cd services; docker stack deploy -c docker-stack-service-facs-si-ps-corrs-c134-ia01t10.yml facs-si-ps-corrs-c134-ia01t10

service-facs-si-ps-corrs-c134-ia11t20-stop:
	cd services; docker stack rm fac-facs-si-ps-corrs-c134-ia11t20

service-facs-si-ps-corrs-c134-ia11t20-start:
	cd services; docker stack deploy -c docker-stack-service-facs-si-ps-corrs-c134-ia11t20.yml facs-si-ps-corrs-c134-ia11t20

service-facs-si-ps-trims-m12-ia01t10-stop:
	cd services; docker stack rm fac-facs-si-ps-trims-m12-ia01t10

service-facs-si-ps-trims-m12-ia01t10-start:
	cd services; docker stack deploy -c docker-stack-service-facs-si-ps-trims-m12-ia01t10.yml facs-si-ps-trims-m12-ia01t10

service-facs-si-ps-trims-m12-ia11t20-stop:
	cd services; docker stack rm fac-facs-si-ps-trims-m12-ia11t20

service-facs-si-ps-trims-m12-ia11t20-start:
	cd services; docker stack deploy -c docker-stack-service-facs-si-ps-trims-m12-ia11t20.yml facs-si-ps-trims-m12-ia11t20

service-facs-si-ps-trims-c1234-ia01t10-stop:
	cd services; docker stack rm fac-facs-si-ps-trims-c1234-ia01t10

service-facs-si-ps-trims-c1234-ia01t10-start:
	cd services; docker stack deploy -c docker-stack-service-facs-si-ps-trims-c1234-ia01t10.yml facs-si-ps-trims-c1234-ia01t10

service-facs-si-ps-trims-c1234-ia11t20-stop:
	cd services; docker stack rm fac-facs-si-ps-trims-c1234-ia11t20

service-facs-si-ps-trims-c1234-ia11t20-start:
	cd services; docker stack deploy -c docker-stack-service-facs-si-ps-trims-c1234-ia11t20.yml facs-si-ps-trims-c1234-ia11t20

service-facs-as-pu-conv-stop:
	cd services; docker stack rm fac-facs-as-pu-conv

service-facs-as-pu-conv-start:
	cd services; docker stack deploy -c docker-stack-service-facs-as-pu-conv.yml facs-as-pu-conv

service-facs-as-ti-stop:
	cd services; docker stack rm fac-facs-as-ti

service-facs-as-ti-start:
	cd services; docker stack deploy -c docker-stack-service-facs-as-ti.yml facs-as-ti

service-facs-bo-ti-bpms-corrs-stop:
	cd services; docker stack rm fac-facs-bo-ti-bpms-corrs

service-facs-bo-ti-bpms-corrs-start:
	cd services; docker stack deploy -c docker-stack-service-facs-bo-ti-bpms-corrs.yml facs-bo-ti-bpms-corrs

service-facs-si-ti-bpms-corrs-stop:
	cd services; docker stack rm fac-facs-si-ti-bpms-corrs

service-facs-si-ti-bpms-corrs-start:
	cd services; docker stack deploy -c docker-stack-service-facs-si-ti-bpms-corrs.yml facs-si-ti-bpms-corrs

service-facs-si-ti-trims-skews-stop:
	cd services; docker stack rm fac-facs-si-ti-trims-skews

service-facs-si-ti-trims-skews-start:
	cd services; docker stack deploy -c docker-stack-service-facs-si-ti-trims-skews.yml facs-si-ti-trims-skews

service-facs-as-ap-posang-stop:
	cd services; docker stack rm fac-facs-as-ap-posang

service-facs-as-ap-posang-start:
	cd services; docker stack deploy -c docker-stack-service-facs-as-ap-posang.yml facs-as-ap-posang

service-facs-as-ap-opticscorr-stop:
	cd services; docker stack rm fac-facs-as-ap-opticscorr

service-facs-as-ap-opticscorr-start:
	cd services; docker stack deploy -c docker-stack-service-facs-as-ap-opticscorr.yml facs-as-ap-opticscorr

service-facs-as-ap-currinfo-stop:
	cd services; docker stack rm fac-facs-as-ap-currinfo

service-facs-as-ap-currinfo-start:
	cd services; docker stack deploy -c docker-stack-service-facs-as-ap-currinfo.yml facs-as-ap-currinfo

service-facs-as-ap-sofb-stop:
	cd services; docker stack rm fac-facs-as-ap-sofb

service-facs-as-ap-sofb-start:
	cd services; docker stack deploy -c docker-stack-service-facs-as-ap-sofb.yml facs-as-ap-sofb

service-facs-si-ap-sofb-stop:
	cd services; docker stack rm fac-facs-si-ap-sofb

service-facs-si-ap-sofb-start:
	cd services; docker stack deploy -c docker-stack-service-facs-si-ap-sofb.yml facs-si-ap-sofb

service-facs-as-ap-diag-stop:
	cd services; docker stack rm fac-facs-as-ap-diag

service-facs-as-ap-diag-start:
	cd services; docker stack deploy -c docker-stack-service-facs-as-ap-diag.yml facs-as-ap-diag

service-facs-li-ap-energy-stop:
	cd services; docker stack rm fac-facs-li-ap-energy

service-facs-li-ap-energy-start:
	cd services; docker stack deploy -c docker-stack-service-facs-li-ap-energy.yml facs-li-ap-energy

service-facs-si-ap-bl-stop:
	cd services; docker stack rm fac-facs-si-ap-bl

service-facs-si-ap-bl-start:
	cd services; docker stack deploy -c docker-stack-service-facs-si-ap-bl.yml facs-si-ap-bl

service-facs-si-id-conv-stop:
	cd services; docker stack rm fac-facs-si-id-conv

service-facs-si-id-conv-start:
	cd services; docker stack deploy -c docker-stack-service-facs-si-id-conv.yml facs-si-id-conv

service-facs-as-ap-machshift-stop:
	cd services; docker stack rm fac-facs-as-ap-machshift

service-facs-as-ap-machshift-start:
	cd services; docker stack deploy -c docker-stack-service-facs-as-ap-machshift.yml facs-as-ap-machshift

service-facs-all-stop:
	cd services; \
	docker stack rm facs-as-ps-dclinks-tbts-bodip \
	docker stack rm facs-as-ps-dclinks-ia01t10 \
	docker stack rm facs-as-ps-dclinks-ia11t20 \
	docker stack rm facs-li-ps-spect-quads-lens \
	docker stack rm facs-li-ps-corrs \
	docker stack rm facs-li-ps-slnds \
	docker stack rm facs-li-ps-conv \
	docker stack rm facs-li-ps-diag \
	docker stack rm facs-tb-ps \
	docker stack rm facs-bo-ps-dips \
	docker stack rm facs-bo-ps-quads \
	docker stack rm facs-bo-ps-sexts \
	docker stack rm facs-bo-ps-corrs-ia01t10 \
	docker stack rm facs-bo-ps-corrs-ia11t20 \
	docker stack rm facs-ts-ps \
	docker stack rm facs-si-ps-fams-dips \
	docker stack rm facs-si-ps-fams-quads \
	docker stack rm facs-si-ps-fams-sexts \
	docker stack rm facs-si-ps-corrs-c2m12-ia01t10 \
	docker stack rm facs-si-ps-corrs-c2m12-ia11t20 \
	docker stack rm facs-si-ps-corrs-c134-ia01t10 \
	docker stack rm facs-si-ps-corrs-c134-ia11t20 \
	docker stack rm facs-si-ps-trims-m12-ia01t10 \
	docker stack rm facs-si-ps-trims-m12-ia11t20 \
	docker stack rm facs-si-ps-trims-c1234-ia01t10 \
	docker stack rm facs-si-ps-trims-c1234-ia11t20 \
	docker stack rm facs-as-pu-conv \
	docker stack rm facs-as-ti \
	docker stack rm facs-bo-ti-bpms-corrs \
	docker stack rm facs-si-ti-bpms-corrs \
	docker stack rm facs-si-ti-trims-skews \
	docker stack rm facs-as-ap-posang \
	docker stack rm facs-as-ap-opticscorr \
	docker stack rm facs-as-ap-currinfo \
	docker stack rm facs-as-ap-sofb \
	docker stack rm facs-si-ap-sofb \
	docker stack rm facs-as-ap-diag \
	docker stack rm facs-li-ap-energy \
	docker stack rm facs-si-ap-bl \
	docker stack rm facs-si-id-conv \
	docker stack rm facs-as-ap-machshift

service-facs-all-start:
	cd services; \
	docker stack deploy -c docker-stack-service-facs-as-ps-dclinks-tbts-bodip.yml facs-as-ps-dclinks-tbts-bodip \
	docker stack deploy -c docker-stack-service-facs-as-ps-dclinks-ia01t10.yml facs-as-ps-dclinks-ia01t10 \
	docker stack deploy -c docker-stack-service-facs-as-ps-dclinks-ia11t20.yml facs-as-ps-dclinks-ia11t20 \
	docker stack deploy -c docker-stack-service-facs-li-ps-spect-quads-lens.yml facs-li-ps-spect-quads-lens \
	docker stack deploy -c docker-stack-service-facs-li-ps-corrs.yml facs-li-ps-corrs \
	docker stack deploy -c docker-stack-service-facs-li-ps-slnds.yml facs-li-ps-slnds \
	docker stack deploy -c docker-stack-service-facs-li-ps-conv.yml facs-li-ps-conv \
	docker stack deploy -c docker-stack-service-facs-li-ps-diag.yml facs-li-ps-diag \
	docker stack deploy -c docker-stack-service-facs-tb-ps.yml facs-tb-ps \
	docker stack deploy -c docker-stack-service-facs-bo-ps-dips.yml facs-bo-ps-dips \
	docker stack deploy -c docker-stack-service-facs-bo-ps-quads.yml facs-bo-ps-quads \
	docker stack deploy -c docker-stack-service-facs-bo-ps-sexts.yml facs-bo-ps-sexts \
	docker stack deploy -c docker-stack-service-facs-bo-ps-corrs-ia01t10.yml facs-bo-ps-corrs-ia01t10 \
	docker stack deploy -c docker-stack-service-facs-bo-ps-corrs-ia11t20.yml facs-bo-ps-corrs-ia11t20 \
	docker stack deploy -c docker-stack-service-facs-ts-ps.yml facs-ts-ps \
	docker stack deploy -c docker-stack-service-facs-si-ps-fams-dips.yml facs-si-ps-fams-dips \
	docker stack deploy -c docker-stack-service-facs-si-ps-fams-quads.yml facs-si-ps-fams-quads \
	docker stack deploy -c docker-stack-service-facs-si-ps-fams-sexts.yml facs-si-ps-fams-sexts \
	docker stack deploy -c docker-stack-service-facs-si-ps-corrs-c2m12-ia01t10.yml facs-si-ps-corrs-c2m12-ia01t10 \
	docker stack deploy -c docker-stack-service-facs-si-ps-corrs-c2m12-ia11t20.yml facs-si-ps-corrs-c2m12-ia11t20 \
	docker stack deploy -c docker-stack-service-facs-si-ps-corrs-c134-ia01t10.yml facs-si-ps-corrs-c134-ia01t10 \
	docker stack deploy -c docker-stack-service-facs-si-ps-corrs-c134-ia11t20.yml facs-si-ps-corrs-c134-ia11t20 \
	docker stack deploy -c docker-stack-service-facs-si-ps-trims-m12-ia01t10.yml facs-si-ps-trims-m12-ia01t10 \
	docker stack deploy -c docker-stack-service-facs-si-ps-trims-m12-ia11t20.yml facs-si-ps-trims-m12-ia11t20 \
	docker stack deploy -c docker-stack-service-facs-si-ps-trims-c1234-ia01t10.yml facs-si-ps-trims-c1234-ia01t10 \
	docker stack deploy -c docker-stack-service-facs-si-ps-trims-c1234-ia11t20.yml facs-si-ps-trims-c1234-ia11t20 \
	docker stack deploy -c docker-stack-service-facs-as-pu-conv.yml facs-as-pu-conv \
	docker stack deploy -c docker-stack-service-facs-as-ti.yml facs-as-ti \
	docker stack deploy -c docker-stack-service-facs-bo-ti-bpms-corrs.yml facs-bo-ti-bpms-corrs \
	docker stack deploy -c docker-stack-service-facs-si-ti-bpms-corrs.yml facs-si-ti-bpms-corrs \
	docker stack deploy -c docker-stack-service-facs-si-ti-trims-skews.yml facs-si-ti-trims-skews \
	docker stack deploy -c docker-stack-service-facs-as-ap-posang.yml facs-as-ap-posang \
	docker stack deploy -c docker-stack-service-facs-as-ap-opticscorr.yml facs-as-ap-opticscorr \
	docker stack deploy -c docker-stack-service-facs-as-ap-currinfo.yml facs-as-ap-currinfo \
	docker stack deploy -c docker-stack-service-facs-as-ap-sofb.yml facs-as-ap-sofb \
	docker stack deploy -c docker-stack-service-facs-si-ap-sofb.yml facs-si-ap-sofb \
	docker stack deploy -c docker-stack-service-facs-as-ap-diag.yml facs-as-ap-diag \
	docker stack deploy -c docker-stack-service-facs-li-ap-energy.yml facs-li-ap-energy \
	docker stack deploy -c docker-stack-service-facs-si-ap-bl.yml facs-si-ap-bl \
	docker stack deploy -c docker-stack-service-facs-si-id-conv.yml facs-si-id-conv \
	docker stack deploy -c docker-stack-service-facs-as-ap-machshift.yml facs-as-ap-machshift
