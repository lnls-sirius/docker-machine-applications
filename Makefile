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

service-facs-li-ap-energy-stop:
	cd services; docker stack rm facs-li-ap-energy

service-facs-li-ap-energy-start:
	cd services; docker stack deploy -c docker-stack-li-ap-energy.yml facs-li-ap-energy

service-facs-li-ps-stop:
	cd services; docker stack rm facs-li-ps

service-facs-li-ps-start:
	cd services; docker stack deploy -c docker-stack-li-ps.yml facs-li-ps

service-facs-tb-ps-stop:
	cd services; docker stack rm facs-tb-ps

service-facs-tb-ps-start:
	cd services; docker stack deploy -c docker-stack-tb-ps.yml facs-tb-ps

service-facs-ts-ps-stop:
	cd services; docker stack rm facs-ts-ps

service-facs-ts-ps-start:
	cd services; docker stack deploy -c docker-stack-ts-ps.yml facs-ts-ps

service-facs-bo-ps-fams-stop:
	cd services; docker stack rm facs-ts-ps-fams

service-facs-bo-ps-fams-start:
	cd services; docker stack deploy -c docker-stack-bo-ps-fams.yml facs-bo-ps-fams

service-facs-bo-ps-corrs-stop:
	cd services; docker stack rm facs-ts-ps-corrs

service-facs-bo-ps-corrs-start:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs.yml facs-bo-ps-corrs

service-facs-si-ps-fams-stop:
	cd services; docker stack rm facs-si-ps-fams

service-facs-si-ps-fams-start:
	cd services; docker stack deploy -c docker-stack-si-ps-fams.yml facs-si-ps-fams

service-facs-si-ps-corrs-c2m12-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12

service-facs-si-ps-corrs-c2m12-start:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c2m12.yml facs-si-ps-corrs-c2m12

service-facs-si-ps-corrs-c134-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134

service-facs-si-ps-corrs-c134-start:
	cd services; docker stack deploy -c docker-stack-si-ps-corrs-c134.yml facs-si-ps-corrs-c134

service-facs-si-ps-trims-m12-stop:
	cd services; docker stack rm facs-si-ps-trims-m12

service-facs-si-ps-trims-m12-start:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-m12.yml facs-si-ps-trims-m12

service-facs-si-ps-trims-c1234-stop:
	cd services; docker stack rm facs-si-ps-trims-c1234

service-facs-si-ps-trims-c1234-start:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-c1234.yml facs-si-ps-trims-c1234

service-facs-si-ap-sofb-stop:
	cd services; docker stack rm facs-si-ap-sofb

service-facs-si-ap-sofb-start:
	cd services; docker stack deploy -c docker-stack-si-ap-sofb.yml facs-si-ap-sofb

service-facs-as-ap-posang-stop:
	cd services; docker stack rm facs-as-ap-posang

service-facs-as-ap-posang-start:
	cd services; docker stack deploy -c docker-stack-as-ap-posang.yml facs-as-ap-posang

service-facs-as-ap-opticscorr-stop:
	cd services; docker stack rm facs-as-ap-opticscorr

service-facs-as-ap-opticscorr-start:
	cd services; docker stack deploy -c docker-stack-as-ap-opticscorr.yml facs-as-ap-opticscorr

service-facs-as-ap-machshift-stop:
	cd services; docker stack rm facs-as-ap-machshift

service-facs-as-ap-machshift-start:
	cd services; docker stack deploy -c docker-stack-as-ap-machshift.yml facs-as-ap-machshift

service-facs-as-ap-currinfo-stop:
	cd services; docker stack rm facs-as-ap-currinfo

service-facs-as-ap-currinfo-start:
	cd services; docker stack deploy -c docker-stack-as-ap-currinfo.yml facs-as-ap-currinfo

service-facs-as-ap-bl-stop:
	cd services; docker stack rm facs-as-ap-bl

service-facs-as-ap-bl-start:
	cd services; docker stack deploy -c docker-stack-as-ap-bl.yml facs-as-ap-bl

service-facs-as-ap-diag-stop:
	cd services; docker stack rm facs-as-ap-diag

service-facs-as-ap-diag-start:
	cd services; docker stack deploy -c docker-stack-as-ap-diag.yml facs-as-ap-diag

service-facs-as-ap-sofb-stop:
	cd services; docker stack rm facs-as-ap-sofb

service-facs-as-ap-sofb-start:
	cd services; docker stack deploy -c docker-stack-as-ap-sofb.yml facs-as-ap-sofb

service-facs-as-ps-dclinks-stop:
	cd services; docker stack rm facs-as-ps-dclinks

service-facs-as-ps-dclinks-start:
	cd services; docker stack deploy -c docker-stack-as-ps-dclinks facs-as-ps-dclinks

service-facs-as-pu-conv-stop:
	cd services; docker stack rm facs-as-pu-conv

service-facs-as-pu-conv-start:
	cd services; docker stack deploy -c docker-stack-as-pu-conv.yml facs-as-pu-conv

service-facs-as-ti-stop:
	cd services; docker stack rm facs-as-ti

service-facs-as-ti-start:
	cd services; docker stack deploy -c docker-stack-as-ti.yml facs-as-ti

service-facs-all-stop:
	cd services; \
	docker stack rm facs-li-ap-energy; \
	docker stack rm facs-li-ps; \
	docker stack rm facs-tb-ps; \
	docker stack rm facs-ts-ps; \
	docker stack rm facs-bo-ps-fams; \
	docker stack rm facs-bo-ps-corrs; \
	docker stack rm facs-si-ps-fams; \
	docker stack rm facs-si-ps-corrs-c2m12; \
	docker stack rm facs-si-ps-corrs-c134; \
	docker stack rm facs-si-ps-trims-m12; \
	docker stack rm facs-si-ps-trims-c1234; \
	docker stack rm facs-si-ap-sofb; \
	docker stack rm facs-as-ap-posang; \
	docker stack rm facs-as-ap-opticscorr; \
	docker stack rm facs-as-ap-machshift; \
	docker stack rm facs-as-ap-currinfo; \
	docker stack rm facs-as-ap-bl; \
	docker stack rm facs-as-ap-diag; \
	docker stack rm facs-as-ap-sofb; \
	docker stack rm facs-as-ps-dclinks; \
	docker stack rm facs-as-pu-conv; \
	docker stack rm facs-as-ti

service-facs-all-start:
	cd services; \
	docker stack deploy -c docker-stack-li-ap-energy.yml facs-li-ap-energy; \
	docker stack deploy -c docker-stack-li-ps.yml facs-li-ps; \
	docker stack deploy -c docker-stack-tb-ps.yml facs-tb-ps; \
	docker stack deploy -c docker-stack-ts-ps.yml facs-ts-ps; \
	docker stack deploy -c docker-stack-bo-ps-fams.yml facs-bo-ps-fams; \
	docker stack deploy -c docker-stack-bo-ps-corrs.yml facs-bo-ps-corrs; \
	docker stack deploy -c docker-stack-si-ps-fams.yml facs-si-ps-fams; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12.yml facs-si-ps-corrs-c2m12; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134.yml facs-si-ps-corrs-c134; \
	docker stack deploy -c docker-stack-si-ps-trims-m12.yml facs-si-ps-trims-m12; \
	docker stack deploy -c docker-stack-si-ps-trims-c1234.yml facs-si-ps-trims-c1234; \
	docker stack deploy -c docker-stack-si-ap-sofb.yml facs-si-ap-sofb; \
	docker stack deploy -c docker-stack-as-ap-posang.yml facs-as-ap-posang; \
	docker stack deploy -c docker-stack-as-ap-opticscorr.yml facs-as-ap-opticscorr; \
	docker stack deploy -c docker-stack-as-ap-machshift.yml facs-as-ap-machshift; \
	docker stack deploy -c docker-stack-as-ap-currinfo.yml facs-as-ap-currinfo; \
	docker stack deploy -c docker-stack-as-ap-bl.yml facs-as-ap-bl; \
	docker stack deploy -c docker-stack-as-ap-diag.yml facs-as-ap-diag; \
	docker stack deploy -c docker-stack-as-ap-sofb.yml facs-as-ap-sofb; \
	docker stack deploy -c docker-stack-as-ps-dclinks.yml facs-as-ps-dclinks; \
	docker stack deploy -c docker-stack-as-pu-conv.yml facs-as-pu-conv; \
	docker stack deploy -c docker-stack-as-ti.yml facs-as-ti
