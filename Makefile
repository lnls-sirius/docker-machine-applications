FAC_BASE_TAG ?= $(shell cat ./images/.env | grep FAC_BASE_TAG= | sed s/FAC_BASE_TAG=//g)
FAC_EPICS_TAG ?= $(shell cat ./images/.env | grep FAC_EPICS_TAG= | sed s/FAC_EPICS_TAG=//g)
FAC_APPS_TAG ?= $(shell cat ./images/.env | grep FAC_APPS_TAG= | sed s/FAC_APPS_TAG=//g)
FAC_IOCS_TAG ?= $(shell cat ./images/.env | grep FAC_IOCS_TAG= | sed s/FAC_IOCS_TAG=//g)

# --- deploy ---

deploy:
	# update image tag
	sed -i "s/FAC_IOCS_TAG=.*/FAC_IOCS_TAG=$(FAC_IOCS_TAG)/g" ./images/.env 
	# create image and push to dockerregistry
	make image-build-fac-iocs

# --- tags ---

tags-iocs-update:
	cd services; find ./ -name "docker-*.yml" -exec sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" {} \;

tags-iocs-template:
	cd services; find ./ -name "docker-*.yml" -exec sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" {} \;

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

service-start-highstack-as-ps-dclinks:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks.yml fac-as-ps-dclinks; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks.yml

service-start-highstack-li-ps:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-li-ps.yml; \
	docker stack deploy -c docker-stack-li-ps.yml fac-li-ps; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-li-ps.yml

service-start-highstack-tb-ps:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-tb-ps.yml; \
	docker stack deploy -c docker-stack-tb-ps.yml fac-tb-ps; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-tb-ps.yml

service-start-highstack-bo-ps:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ps.yml; \
	docker stack deploy -c docker-stack-bo-ps.yml fac-bo-ps; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps.yml

service-start-highstack-ts-ps:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-ts-ps.yml; \
	docker stack deploy -c docker-stack-ts-ps.yml fac-ts-ps; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-ts-ps.yml

service-start-highstack-si-ps:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps.yml; \
	docker stack deploy -c docker-stack-si-ps.yml fac-si-ps; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps.yml

service-start-highstack-as-ti:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ti.yml; \
	docker stack deploy -c docker-stack-as-ti.yml fac-as-ti; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ti.yml

service-start-highstack-as-pu-conv:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-pu-conv.yml; \
	docker stack deploy -c docker-stack-as-pu-conv.yml fac-as-pu-conv; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-pu-conv.yml

service-start-highstack-as-ap-posang:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ap-posang.yml; \
	docker stack deploy -c docker-stack-as-ap-posang.yml fac-as-ap-posang; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-posang.yml

service-start-highstack-as-ap-opticscorr:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ap-opticscorr.yml; \
	docker stack deploy -c docker-stack-as-ap-opticscorr.yml fac-as-ap-opticscorr; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-opticscorr.yml

service-start-highstack-as-ap-currinfo:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ap-currinfo.yml; \
	docker stack deploy -c docker-stack-as-ap-currinfo.yml fac-as-ap-currinfo; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-currinfo.yml

service-start-highstack-as-ap-sofb:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ap-sofb.yml; \
	docker stack deploy -c docker-stack-as-ap-sofb.yml fac-as-ap-sofb; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-sofb.yml

service-start-highstack-si-ap-sofb:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ap-sofb.yml; \
	docker stack deploy -c docker-stack-si-ap-sofb.yml fac-si-ap-sofb; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ap-sofb.yml

service-start-highstack-as-ap-diag:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ap-diag.yml; \
	docker stack deploy -c docker-stack-as-ap-diag.yml fac-as-ap-diag; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-diag.yml

service-start-highstack-li-ap-energy:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-li-ap-energy.yml; \
	docker stack deploy -c docker-stack-li-ap-energy.yml fac-li-ap-energy; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-li-ap-energy.yml

service-start-highstack-si-ap-bl:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ap-bl.yml; \
	docker stack deploy -c docker-stack-si-ap-bl.yml fac-si-ap-bl; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ap-bl.yml

service-start-highstack-si-id-conv:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-id-conv.yml; \
	docker stack deploy -c docker-stack-si-id-conv.yml fac-si-id-conv; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-id-conv.yml

service-start-highstack-as-ap-machshift:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ap-machshift.yml; \
	docker stack deploy -c docker-stack-as-ap-machshift.yml fac-as-ap-machshift; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-machshift.yml

service-stop-highstack-as-ps-dclinks:
	cd services; \
	docker stack rm facs-as-ps-dclinks

service-stop-highstack-li-ps:
	cd services; \
	docker stack rm facs-li-ps

service-stop-highstack-tb-ps:
	cd services; \
	docker stack rm facs-tb-ps

service-stop-highstack-bo-ps:
	cd services; \
	docker stack rm facs-bo-ps

service-stop-highstack-ts-ps:
	cd services; \
	docker stack rm facs-ts-ps

service-stop-highstack-si-ps:
	cd services; \
	docker stack rm facs-si-ps

service-stop-highstack-as-ti:
	cd services; \
	docker stack rm facs-as-ti

service-stop-highstack-as-pu-conv:
	cd services; \
	docker stack rm facs-as-pu-conv

service-stop-highstack-as-ap-posang:
	cd services; \
	docker stack rm facs-as-ap-posang

service-stop-highstack-as-ap-opticscorr:
	cd services; \
	docker stack rm facs-as-ap-opticscorr

service-stop-highstack-as-ap-currinfo:
	cd services; \
	docker stack rm facs-as-ap-currinfo

service-stop-highstack-as-ap-sofb:
	cd services; \
	docker stack rm facs-as-ap-sofb

service-stop-highstack-si-ap-sofb:
	cd services; \
	docker stack rm facs-si-ap-sofb

service-stop-highstack-as-ap-diag:
	cd services; \
	docker stack rm facs-as-ap-diag

service-stop-highstack-li-ap-energy:
	cd services; \
	docker stack rm facs-li-ap-energy

service-stop-highstack-si-ap-bl:
	cd services; \
	docker stack rm facs-si-ap-bl

service-stop-highstack-si-id-conv:
	cd services; \
	docker stack rm facs-si-id-conv

service-stop-highstack-as-ap-machshift:
	cd services; \
	docker stack rm facs-as-ap-machshift

service-start-highstack-all: 
	make tags-iocs-update; \
    docker stack deploy -c docker-stack-as-ps-dclinks.yml facs-as-ps-dclinks; \
    docker stack deploy -c docker-stack-li-ps.yml facs-li-ps; \
    docker stack deploy -c docker-stack-tb-ps.yml facs-tb-ps; \
    docker stack deploy -c docker-stack-bo-ps.yml facs-bo-ps; \
    docker stack deploy -c docker-stack-ts-ps.yml facs-ts-ps; \
    docker stack deploy -c docker-stack-si-ps.yml facs-si-ps; \
    docker stack deploy -c docker-stack-as-ti.yml facs-as-ti; \
    docker stack deploy -c docker-stack-as-pu-conv.yml facs-as-pu-conv; \
    docker stack deploy -c docker-stack-as-ap-posang.yml facs-as-ap-posang; \
    docker stack deploy -c docker-stack-as-ap-opticscorr.yml facs-as-ap-opticscorr; \
    docker stack deploy -c docker-stack-as-ap-currinfo.yml facs-as-ap-currinfo; \
    docker stack deploy -c docker-stack-as-ap-sofb.yml facs-as-ap-sofb; \
    docker stack deploy -c docker-stack-si-ap-sofb.yml facs-si-ap-sofb; \
    docker stack deploy -c docker-stack-as-ap-diag.yml facs-as-ap-diag; \
    docker stack deploy -c docker-stack-li-ap-energy.yml facs-li-ap-energy; \
    docker stack deploy -c docker-stack-si-ap-bl.yml facs-si-ap-bl; \
    docker stack deploy -c docker-stack-si-id-conv.yml facs-si-id-conv; \
    docker stack deploy -c docker-stack-as-ap-machsh.yml facs-as-ap-machshift; \
	make tags-iocs-template

service-stop-highstack-all: 
	cd services; \
	docker stack rm facs-as-ps-dclinks; \
	docker stack rm facs-li-ps; \
	docker stack rm facs-tb-ps; \
	docker stack rm facs-bo-ps; \
	docker stack rm facs-ts-ps; \
	docker stack rm facs-si-ps; \
	docker stack rm facs-as-ti; \
	docker stack rm facs-as-pu-conv; \
	docker stack rm facs-as-ap-posang; \
	docker stack rm facs-as-ap-opticscorr; \
	docker stack rm facs-as-ap-currinfo; \
	docker stack rm facs-as-ap-sofb; \
	docker stack rm facs-si-ap-sofb; \
	docker stack rm facs-as-ap-diag; \
	docker stack rm facs-li-ap-energy; \
	docker stack rm facs-si-ap-bl; \
	docker stack rm facs-si-id-conv; \
	docker stack rm facs-as-ap-machshift

# --- middle stacking level services ---

# service-stop-midstack-bo-ps-fams:
# 	cd services; docker stack rm facs-bo-ps-fams

# service-start-midstack-bo-ps-fams:
# 	cd services; docker stack deploy -c docker-stack-bo-ps-fams.yml facs-bo-ps-fams

# service-stop-midstack-bo-ps-corrs:
# 	cd services; docker stack rm facs-bo-ps-corrs

# service-start-midstack-bo-ps-corrs:
# 	cd services; docker stack deploy -c docker-stack-bo-ps-corrs.yml facs-bo-ps-corrs

# --- lower stacking level services ---


service-start-lowstack-as-ps-dclinks-tbts-bodip:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-tbts-bodip.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-tbts-bodip.yml as-ps-dclinks-tbts-bodip; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-tbts-bodip.yml

service-start-lowstack-as-ps-dclinks-ia01:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia01.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia01.yml as-ps-dclinks-ia01; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia01.yml

service-start-lowstack-as-ps-dclinks-ia02:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia02.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia02.yml as-ps-dclinks-ia02; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia02.yml

service-start-lowstack-as-ps-dclinks-ia03:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia03.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia03.yml as-ps-dclinks-ia03; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia03.yml

service-start-lowstack-as-ps-dclinks-ia04:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia04.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia04.yml as-ps-dclinks-ia04; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia04.yml

service-start-lowstack-as-ps-dclinks-ia05:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia05.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia05.yml as-ps-dclinks-ia05; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia05.yml

service-start-lowstack-as-ps-dclinks-ia06:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia06.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia06.yml as-ps-dclinks-ia06; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia06.yml

service-start-lowstack-as-ps-dclinks-ia07:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia07.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia07.yml as-ps-dclinks-ia07; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia07.yml

service-start-lowstack-as-ps-dclinks-ia08:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia08.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia08.yml as-ps-dclinks-ia08; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia08.yml

service-start-lowstack-as-ps-dclinks-ia09:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia09.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia09.yml as-ps-dclinks-ia09; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia09.yml

service-start-lowstack-as-ps-dclinks-ia10:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia10.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia10.yml as-ps-dclinks-ia10; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia10.yml

service-start-lowstack-as-ps-dclinks-ia11:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia11.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia11.yml as-ps-dclinks-ia11; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia11.yml

service-start-lowstack-as-ps-dclinks-ia12:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia12.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia12.yml as-ps-dclinks-ia12; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia12.yml

service-start-lowstack-as-ps-dclinks-ia13:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia13.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia13.yml as-ps-dclinks-ia13; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia13.yml

service-start-lowstack-as-ps-dclinks-ia14:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia14.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia14.yml as-ps-dclinks-ia14; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia14.yml

service-start-lowstack-as-ps-dclinks-ia15:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia15.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia15.yml as-ps-dclinks-ia15; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia15.yml

service-start-lowstack-as-ps-dclinks-ia16:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia16.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia16.yml as-ps-dclinks-ia16; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia16.yml

service-start-lowstack-as-ps-dclinks-ia17:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia17.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia17.yml as-ps-dclinks-ia17; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia17.yml

service-start-lowstack-as-ps-dclinks-ia18:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia18.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia18.yml as-ps-dclinks-ia18; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia18.yml

service-start-lowstack-as-ps-dclinks-ia19:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia19.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia19.yml as-ps-dclinks-ia19; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia19.yml

service-start-lowstack-as-ps-dclinks-ia20:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ps-dclinks-ia20.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia20.yml as-ps-dclinks-ia20; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks-ia20.yml

service-start-lowstack-li-ps-spect-quads-lens:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-li-ps-spect-quads-lens.yml; \
	docker stack deploy -c docker-stack-li-ps-spect-quads-lens.yml li-ps-spect-quads-lens; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-li-ps-spect-quads-lens.yml

service-start-lowstack-li-ps-corrs:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-li-ps-corrs.yml; \
	docker stack deploy -c docker-stack-li-ps-corrs.yml li-ps-corrs; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-li-ps-corrs.yml

service-start-lowstack-li-ps-slnds:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-li-ps-slnds.yml; \
	docker stack deploy -c docker-stack-li-ps-slnds.yml li-ps-slnds; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-li-ps-slnds.yml

service-start-lowstack-li-ps-conv:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-li-ps-conv.yml; \
	docker stack deploy -c docker-stack-li-ps-conv.yml li-ps-conv; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-li-ps-conv.yml

service-start-lowstack-li-ps-diag:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-li-ps-diag.yml; \
	docker stack deploy -c docker-stack-li-ps-diag.yml li-ps-diag; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-li-ps-diag.yml

service-start-lowstack-tb-ps:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-tb-ps.yml; \
	docker stack deploy -c docker-stack-tb-ps.yml tb-ps; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-tb-ps.yml

service-start-lowstack-bo-ps-dips:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ps-dips.yml; \
	docker stack deploy -c docker-stack-bo-ps-dips.yml bo-ps-dips; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps-dips.yml

service-start-lowstack-bo-ps-quads:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ps-quads.yml; \
	docker stack deploy -c docker-stack-bo-ps-quads.yml bo-ps-quads; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps-quads.yml

service-start-lowstack-bo-ps-sexts:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ps-sexts.yml; \
	docker stack deploy -c docker-stack-bo-ps-sexts.yml bo-ps-sexts; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps-sexts.yml

service-start-lowstack-bo-ps-corrs-ia01:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ps-corrs-ia01.yml; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia01.yml bo-ps-corrs-ia01; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps-corrs-ia01.yml

service-start-lowstack-bo-ps-corrs-ia02:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ps-corrs-ia02.yml; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia02.yml bo-ps-corrs-ia02; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps-corrs-ia02.yml

service-start-lowstack-bo-ps-corrs-ia04:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ps-corrs-ia04.yml; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia04.yml bo-ps-corrs-ia04; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps-corrs-ia04.yml

service-start-lowstack-bo-ps-corrs-ia05:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ps-corrs-ia05.yml; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia05.yml bo-ps-corrs-ia05; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps-corrs-ia05.yml

service-start-lowstack-bo-ps-corrs-ia07:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ps-corrs-ia07.yml; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia07.yml bo-ps-corrs-ia07; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps-corrs-ia07.yml

service-start-lowstack-bo-ps-corrs-ia08:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ps-corrs-ia08.yml; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia08.yml bo-ps-corrs-ia08; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps-corrs-ia08.yml

service-start-lowstack-bo-ps-corrs-ia10:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ps-corrs-ia10.yml; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia10.yml bo-ps-corrs-ia10; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps-corrs-ia10.yml

service-start-lowstack-bo-ps-corrs-ia11:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ps-corrs-ia11.yml; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia11.yml bo-ps-corrs-ia11; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps-corrs-ia11.yml

service-start-lowstack-bo-ps-corrs-ia13:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ps-corrs-ia13.yml; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia13.yml bo-ps-corrs-ia13; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps-corrs-ia13.yml

service-start-lowstack-bo-ps-corrs-ia14:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ps-corrs-ia14.yml; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia14.yml bo-ps-corrs-ia14; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps-corrs-ia14.yml

service-start-lowstack-bo-ps-corrs-ia16:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ps-corrs-ia16.yml; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia16.yml bo-ps-corrs-ia16; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps-corrs-ia16.yml

service-start-lowstack-bo-ps-corrs-ia17:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ps-corrs-ia17.yml; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia17.yml bo-ps-corrs-ia17; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps-corrs-ia17.yml

service-start-lowstack-bo-ps-corrs-ia20:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ps-corrs-ia20.yml; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia20.yml bo-ps-corrs-ia20; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps-corrs-ia20.yml

service-start-lowstack-ts-ps:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-ts-ps.yml; \
	docker stack deploy -c docker-stack-ts-ps.yml ts-ps; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-ts-ps.yml

service-start-lowstack-si-ps-dips:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-dips.yml; \
	docker stack deploy -c docker-stack-si-ps-dips.yml si-ps-dips; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-dips.yml

service-start-lowstack-si-ps-quads-qd:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-quads-qd.yml; \
	docker stack deploy -c docker-stack-si-ps-quads-qd.yml si-ps-quads-qd; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-quads-qd.yml

service-start-lowstack-si-ps-quads-qfq:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-quads-qfq.yml; \
	docker stack deploy -c docker-stack-si-ps-quads-qfq.yml si-ps-quads-qfq; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-quads-qfq.yml

service-start-lowstack-si-ps-sexts-sda12b2-sfa0p0-sda0p0:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-sexts-sda12b2-sfa0p0-sda0p0.yml; \
	docker stack deploy -c docker-stack-si-ps-sexts-sda12b2-sfa0p0-sda0p0.yml si-ps-sexts-sda12b2-sfa0p0-sda0p0; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-sexts-sda12b2-sfa0p0-sda0p0.yml

service-start-lowstack-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01.yml; \
	docker stack deploy -c docker-stack-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01.yml si-ps-sexts-sfa12-sda3p1-sfb0-sdb01; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01.yml

service-start-lowstack-si-ps-sexts-sfb12-sdb3-sfp12-sdp23:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-sexts-sfb12-sdb3-sfp12-sdp23.yml; \
	docker stack deploy -c docker-stack-si-ps-sexts-sfb12-sdb3-sfp12-sdp23.yml si-ps-sexts-sfb12-sdb3-sfp12-sdp23; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-sexts-sfb12-sdb3-sfp12-sdp23.yml

service-start-lowstack-si-ps-corrs-c2m12-ia01:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia01.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia01.yml si-ps-corrs-c2m12-ia01; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia01.yml

service-start-lowstack-si-ps-corrs-c2m12-ia02:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia02.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia02.yml si-ps-corrs-c2m12-ia02; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia02.yml

service-start-lowstack-si-ps-corrs-c2m12-ia03:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia03.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia03.yml si-ps-corrs-c2m12-ia03; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia03.yml

service-start-lowstack-si-ps-corrs-c2m12-ia04:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia04.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia04.yml si-ps-corrs-c2m12-ia04; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia04.yml

service-start-lowstack-si-ps-corrs-c2m12-ia05:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia05.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia05.yml si-ps-corrs-c2m12-ia05; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia05.yml

service-start-lowstack-si-ps-corrs-c2m12-ia06:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia06.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia06.yml si-ps-corrs-c2m12-ia06; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia06.yml

service-start-lowstack-si-ps-corrs-c2m12-ia07:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia07.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia07.yml si-ps-corrs-c2m12-ia07; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia07.yml

service-start-lowstack-si-ps-corrs-c2m12-ia08:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia08.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia08.yml si-ps-corrs-c2m12-ia08; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia08.yml

service-start-lowstack-si-ps-corrs-c2m12-ia09:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia09.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia09.yml si-ps-corrs-c2m12-ia09; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia09.yml

service-start-lowstack-si-ps-corrs-c2m12-ia10:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia10.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia10.yml si-ps-corrs-c2m12-ia10; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia10.yml

service-start-lowstack-si-ps-corrs-c2m12-ia11:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia11.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia11.yml si-ps-corrs-c2m12-ia11; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia11.yml

service-start-lowstack-si-ps-corrs-c2m12-ia12:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia12.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia12.yml si-ps-corrs-c2m12-ia12; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia12.yml

service-start-lowstack-si-ps-corrs-c2m12-ia13:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia13.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia13.yml si-ps-corrs-c2m12-ia13; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia13.yml

service-start-lowstack-si-ps-corrs-c2m12-ia14:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia14.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia14.yml si-ps-corrs-c2m12-ia14; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia14.yml

service-start-lowstack-si-ps-corrs-c2m12-ia15:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia15.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia15.yml si-ps-corrs-c2m12-ia15; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia15.yml

service-start-lowstack-si-ps-corrs-c2m12-ia16:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia16.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia16.yml si-ps-corrs-c2m12-ia16; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia16.yml

service-start-lowstack-si-ps-corrs-c2m12-ia17:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia17.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia17.yml si-ps-corrs-c2m12-ia17; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia17.yml

service-start-lowstack-si-ps-corrs-c2m12-ia18:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia18.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia18.yml si-ps-corrs-c2m12-ia18; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia18.yml

service-start-lowstack-si-ps-corrs-c2m12-ia19:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia19.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia19.yml si-ps-corrs-c2m12-ia19; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia19.yml

service-start-lowstack-si-ps-corrs-c2m12-ia20:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c2m12-ia20.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia20.yml si-ps-corrs-c2m12-ia20; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c2m12-ia20.yml

service-start-lowstack-si-ps-corrs-c134-ia01:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia01.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia01.yml si-ps-corrs-c134-ia01; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia01.yml

service-start-lowstack-si-ps-corrs-c134-ia02:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia02.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia02.yml si-ps-corrs-c134-ia02; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia02.yml

service-start-lowstack-si-ps-corrs-c134-ia03:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia03.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia03.yml si-ps-corrs-c134-ia03; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia03.yml

service-start-lowstack-si-ps-corrs-c134-ia04:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia04.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia04.yml si-ps-corrs-c134-ia04; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia04.yml

service-start-lowstack-si-ps-corrs-c134-ia05:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia05.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia05.yml si-ps-corrs-c134-ia05; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia05.yml

service-start-lowstack-si-ps-corrs-c134-ia06:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia06.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia06.yml si-ps-corrs-c134-ia06; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia06.yml

service-start-lowstack-si-ps-corrs-c134-ia07:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia07.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia07.yml si-ps-corrs-c134-ia07; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia07.yml

service-start-lowstack-si-ps-corrs-c134-ia08:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia08.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia08.yml si-ps-corrs-c134-ia08; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia08.yml

service-start-lowstack-si-ps-corrs-c134-ia09:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia09.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia09.yml si-ps-corrs-c134-ia09; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia09.yml

service-start-lowstack-si-ps-corrs-c134-ia10:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia10.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia10.yml si-ps-corrs-c134-ia10; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia10.yml

service-start-lowstack-si-ps-corrs-c134-ia11:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia11.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia11.yml si-ps-corrs-c134-ia11; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia11.yml

service-start-lowstack-si-ps-corrs-c134-ia12:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia12.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia12.yml si-ps-corrs-c134-ia12; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia12.yml

service-start-lowstack-si-ps-corrs-c134-ia13:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia13.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia13.yml si-ps-corrs-c134-ia13; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia13.yml

service-start-lowstack-si-ps-corrs-c134-ia14:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia14.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia14.yml si-ps-corrs-c134-ia14; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia14.yml

service-start-lowstack-si-ps-corrs-c134-ia15:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia15.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia15.yml si-ps-corrs-c134-ia15; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia15.yml

service-start-lowstack-si-ps-corrs-c134-ia16:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia16.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia16.yml si-ps-corrs-c134-ia16; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia16.yml

service-start-lowstack-si-ps-corrs-c134-ia17:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia17.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia17.yml si-ps-corrs-c134-ia17; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia17.yml

service-start-lowstack-si-ps-corrs-c134-ia18:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia18.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia18.yml si-ps-corrs-c134-ia18; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia18.yml

service-start-lowstack-si-ps-corrs-c134-ia19:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia19.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia19.yml si-ps-corrs-c134-ia19; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia19.yml

service-start-lowstack-si-ps-corrs-c134-ia20:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-corrs-c134-ia20.yml; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia20.yml si-ps-corrs-c134-ia20; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-corrs-c134-ia20.yml

service-start-lowstack-si-ps-trims-qs-m12-ia01:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia01.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia01.yml si-ps-trims-qs-m12-ia01; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia01.yml

service-start-lowstack-si-ps-trims-qs-m12-ia02:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia02.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia02.yml si-ps-trims-qs-m12-ia02; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia02.yml

service-start-lowstack-si-ps-trims-qs-m12-ia03:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia03.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia03.yml si-ps-trims-qs-m12-ia03; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia03.yml

service-start-lowstack-si-ps-trims-qs-m12-ia04:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia04.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia04.yml si-ps-trims-qs-m12-ia04; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia04.yml

service-start-lowstack-si-ps-trims-qs-m12-ia05:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia05.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia05.yml si-ps-trims-qs-m12-ia05; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia05.yml

service-start-lowstack-si-ps-trims-qs-m12-ia06:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia06.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia06.yml si-ps-trims-qs-m12-ia06; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia06.yml

service-start-lowstack-si-ps-trims-qs-m12-ia07:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia07.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia07.yml si-ps-trims-qs-m12-ia07; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia07.yml

service-start-lowstack-si-ps-trims-qs-m12-ia08:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia08.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia08.yml si-ps-trims-qs-m12-ia08; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia08.yml

service-start-lowstack-si-ps-trims-qs-m12-ia09:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia09.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia09.yml si-ps-trims-qs-m12-ia09; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia09.yml

service-start-lowstack-si-ps-trims-qs-m12-ia10:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia10.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia10.yml si-ps-trims-qs-m12-ia10; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia10.yml

service-start-lowstack-si-ps-trims-qs-m12-ia11:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia11.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia11.yml si-ps-trims-qs-m12-ia11; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia11.yml

service-start-lowstack-si-ps-trims-qs-m12-ia12:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia12.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia12.yml si-ps-trims-qs-m12-ia12; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia12.yml

service-start-lowstack-si-ps-trims-qs-m12-ia13:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia13.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia13.yml si-ps-trims-qs-m12-ia13; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia13.yml

service-start-lowstack-si-ps-trims-qs-m12-ia14:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia14.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia14.yml si-ps-trims-qs-m12-ia14; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia14.yml

service-start-lowstack-si-ps-trims-qs-m12-ia15:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia15.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia15.yml si-ps-trims-qs-m12-ia15; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia15.yml

service-start-lowstack-si-ps-trims-qs-m12-ia16:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia16.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia16.yml si-ps-trims-qs-m12-ia16; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia16.yml

service-start-lowstack-si-ps-trims-qs-m12-ia17:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia17.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia17.yml si-ps-trims-qs-m12-ia17; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia17.yml

service-start-lowstack-si-ps-trims-qs-m12-ia18:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia18.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia18.yml si-ps-trims-qs-m12-ia18; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia18.yml

service-start-lowstack-si-ps-trims-qs-m12-ia19:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia19.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia19.yml si-ps-trims-qs-m12-ia19; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia19.yml

service-start-lowstack-si-ps-trims-qs-m12-ia20:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-m12-ia20.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia20.yml si-ps-trims-qs-m12-ia20; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-m12-ia20.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia01:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia01.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia01.yml si-ps-trims-qs-c1234-ia01; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia01.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia02:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia02.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia02.yml si-ps-trims-qs-c1234-ia02; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia02.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia03:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia03.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia03.yml si-ps-trims-qs-c1234-ia03; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia03.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia04:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia04.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia04.yml si-ps-trims-qs-c1234-ia04; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia04.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia05:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia05.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia05.yml si-ps-trims-qs-c1234-ia05; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia05.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia06:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia06.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia06.yml si-ps-trims-qs-c1234-ia06; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia06.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia07:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia07.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia07.yml si-ps-trims-qs-c1234-ia07; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia07.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia08:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia08.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia08.yml si-ps-trims-qs-c1234-ia08; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia08.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia09:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia09.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia09.yml si-ps-trims-qs-c1234-ia09; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia09.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia10:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia10.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia10.yml si-ps-trims-qs-c1234-ia10; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia10.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia11:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia11.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia11.yml si-ps-trims-qs-c1234-ia11; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia11.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia12:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia12.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia12.yml si-ps-trims-qs-c1234-ia12; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia12.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia13:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia13.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia13.yml si-ps-trims-qs-c1234-ia13; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia13.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia14:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia14.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia14.yml si-ps-trims-qs-c1234-ia14; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia14.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia15:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia15.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia15.yml si-ps-trims-qs-c1234-ia15; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia15.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia16:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia16.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia16.yml si-ps-trims-qs-c1234-ia16; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia16.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia17:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia17.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia17.yml si-ps-trims-qs-c1234-ia17; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia17.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia18:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia18.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia18.yml si-ps-trims-qs-c1234-ia18; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia18.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia19:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia19.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia19.yml si-ps-trims-qs-c1234-ia19; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia19.yml

service-start-lowstack-si-ps-trims-qs-c1234-ia20:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ps-trims-qs-c1234-ia20.yml; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia20.yml si-ps-trims-qs-c1234-ia20; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps-trims-qs-c1234-ia20.yml

service-start-lowstack-as-ti-general:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ti-general.yml; \
	docker stack deploy -c docker-stack-as-ti-general.yml as-ti-general; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ti-general.yml

service-start-lowstack-bo-ti-bpms-corrs:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-bo-ti-bpms-corrs.yml; \
	docker stack deploy -c docker-stack-bo-ti-bpms-corrs.yml bo-ti-bpms-corrs; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ti-bpms-corrs.yml

service-start-lowstack-si-ti-bpms-corrs:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ti-bpms-corrs.yml; \
	docker stack deploy -c docker-stack-si-ti-bpms-corrs.yml si-ti-bpms-corrs; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ti-bpms-corrs.yml

service-start-lowstack-si-ti-trims-skews:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ti-trims-skews.yml; \
	docker stack deploy -c docker-stack-si-ti-trims-skews.yml si-ti-trims-skews; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ti-trims-skews.yml

service-start-lowstack-as-pu-conv:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-pu-conv.yml; \
	docker stack deploy -c docker-stack-as-pu-conv.yml as-pu-conv; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-pu-conv.yml

service-start-lowstack-as-ap-posang:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ap-posang.yml; \
	docker stack deploy -c docker-stack-as-ap-posang.yml as-ap-posang; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-posang.yml

service-start-lowstack-as-ap-opticscorr:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ap-opticscorr.yml; \
	docker stack deploy -c docker-stack-as-ap-opticscorr.yml as-ap-opticscorr; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-opticscorr.yml

service-start-lowstack-as-ap-currinfo:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ap-currinfo.yml; \
	docker stack deploy -c docker-stack-as-ap-currinfo.yml as-ap-currinfo; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-currinfo.yml

service-start-lowstack-as-ap-sofb:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ap-sofb.yml; \
	docker stack deploy -c docker-stack-as-ap-sofb.yml as-ap-sofb; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-sofb.yml

service-start-lowstack-si-ap-sofb:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ap-sofb.yml; \
	docker stack deploy -c docker-stack-si-ap-sofb.yml si-ap-sofb; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ap-sofb.yml

service-start-lowstack-as-ap-diag:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ap-diag.yml; \
	docker stack deploy -c docker-stack-as-ap-diag.yml as-ap-diag; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-diag.yml

service-start-lowstack-li-ap-energy:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-li-ap-energy.yml; \
	docker stack deploy -c docker-stack-li-ap-energy.yml li-ap-energy; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-li-ap-energy.yml

service-start-lowstack-si-ap-bl:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-ap-bl.yml; \
	docker stack deploy -c docker-stack-si-ap-bl.yml si-ap-bl; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ap-bl.yml

service-start-lowstack-si-id-conv:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-si-id-conv.yml; \
	docker stack deploy -c docker-stack-si-id-conv.yml si-id-conv; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-id-conv.yml

service-start-lowstack-as-ap-machshift:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(FAC_IOCS_TAG)/g" docker-stack-as-ap-machshift.yml; \
	docker stack deploy -c docker-stack-as-ap-machshift.yml as-ap-machshift; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-machshift.yml

service-stop-lowstack-as-ps-dclinks-tbts-bodip:
	cd services; \
	docker stack rm as-ps-dclinks-tbts-bodip

service-stop-lowstack-as-ps-dclinks-ia01:
	cd services; \
	docker stack rm as-ps-dclinks-ia01

service-stop-lowstack-as-ps-dclinks-ia02:
	cd services; \
	docker stack rm as-ps-dclinks-ia02

service-stop-lowstack-as-ps-dclinks-ia03:
	cd services; \
	docker stack rm as-ps-dclinks-ia03

service-stop-lowstack-as-ps-dclinks-ia04:
	cd services; \
	docker stack rm as-ps-dclinks-ia04

service-stop-lowstack-as-ps-dclinks-ia05:
	cd services; \
	docker stack rm as-ps-dclinks-ia05

service-stop-lowstack-as-ps-dclinks-ia06:
	cd services; \
	docker stack rm as-ps-dclinks-ia06

service-stop-lowstack-as-ps-dclinks-ia07:
	cd services; \
	docker stack rm as-ps-dclinks-ia07

service-stop-lowstack-as-ps-dclinks-ia08:
	cd services; \
	docker stack rm as-ps-dclinks-ia08

service-stop-lowstack-as-ps-dclinks-ia09:
	cd services; \
	docker stack rm as-ps-dclinks-ia09

service-stop-lowstack-as-ps-dclinks-ia10:
	cd services; \
	docker stack rm as-ps-dclinks-ia10

service-stop-lowstack-as-ps-dclinks-ia11:
	cd services; \
	docker stack rm as-ps-dclinks-ia11

service-stop-lowstack-as-ps-dclinks-ia12:
	cd services; \
	docker stack rm as-ps-dclinks-ia12

service-stop-lowstack-as-ps-dclinks-ia13:
	cd services; \
	docker stack rm as-ps-dclinks-ia13

service-stop-lowstack-as-ps-dclinks-ia14:
	cd services; \
	docker stack rm as-ps-dclinks-ia14

service-stop-lowstack-as-ps-dclinks-ia15:
	cd services; \
	docker stack rm as-ps-dclinks-ia15

service-stop-lowstack-as-ps-dclinks-ia16:
	cd services; \
	docker stack rm as-ps-dclinks-ia16

service-stop-lowstack-as-ps-dclinks-ia17:
	cd services; \
	docker stack rm as-ps-dclinks-ia17

service-stop-lowstack-as-ps-dclinks-ia18:
	cd services; \
	docker stack rm as-ps-dclinks-ia18

service-stop-lowstack-as-ps-dclinks-ia19:
	cd services; \
	docker stack rm as-ps-dclinks-ia19

service-stop-lowstack-as-ps-dclinks-ia20:
	cd services; \
	docker stack rm as-ps-dclinks-ia20

service-stop-lowstack-li-ps-spect-quads-lens:
	cd services; \
	docker stack rm li-ps-spect-quads-lens

service-stop-lowstack-li-ps-corrs:
	cd services; \
	docker stack rm li-ps-corrs

service-stop-lowstack-li-ps-slnds:
	cd services; \
	docker stack rm li-ps-slnds

service-stop-lowstack-li-ps-conv:
	cd services; \
	docker stack rm li-ps-conv

service-stop-lowstack-li-ps-diag:
	cd services; \
	docker stack rm li-ps-diag

service-stop-lowstack-tb-ps:
	cd services; \
	docker stack rm tb-ps

service-stop-lowstack-bo-ps-dips:
	cd services; \
	docker stack rm bo-ps-dips

service-stop-lowstack-bo-ps-quads:
	cd services; \
	docker stack rm bo-ps-quads

service-stop-lowstack-bo-ps-sexts:
	cd services; \
	docker stack rm bo-ps-sexts

service-stop-lowstack-bo-ps-corrs-ia01:
	cd services; \
	docker stack rm bo-ps-corrs-ia01

service-stop-lowstack-bo-ps-corrs-ia02:
	cd services; \
	docker stack rm bo-ps-corrs-ia02

service-stop-lowstack-bo-ps-corrs-ia04:
	cd services; \
	docker stack rm bo-ps-corrs-ia04

service-stop-lowstack-bo-ps-corrs-ia05:
	cd services; \
	docker stack rm bo-ps-corrs-ia05

service-stop-lowstack-bo-ps-corrs-ia07:
	cd services; \
	docker stack rm bo-ps-corrs-ia07

service-stop-lowstack-bo-ps-corrs-ia08:
	cd services; \
	docker stack rm bo-ps-corrs-ia08

service-stop-lowstack-bo-ps-corrs-ia10:
	cd services; \
	docker stack rm bo-ps-corrs-ia10

service-stop-lowstack-bo-ps-corrs-ia11:
	cd services; \
	docker stack rm bo-ps-corrs-ia11

service-stop-lowstack-bo-ps-corrs-ia13:
	cd services; \
	docker stack rm bo-ps-corrs-ia13

service-stop-lowstack-bo-ps-corrs-ia14:
	cd services; \
	docker stack rm bo-ps-corrs-ia14

service-stop-lowstack-bo-ps-corrs-ia16:
	cd services; \
	docker stack rm bo-ps-corrs-ia16

service-stop-lowstack-bo-ps-corrs-ia17:
	cd services; \
	docker stack rm bo-ps-corrs-ia17

service-stop-lowstack-bo-ps-corrs-ia20:
	cd services; \
	docker stack rm bo-ps-corrs-ia20

service-stop-lowstack-ts-ps:
	cd services; \
	docker stack rm ts-ps

service-stop-lowstack-si-ps-dips:
	cd services; \
	docker stack rm si-ps-dips

service-stop-lowstack-si-ps-quads-qd:
	cd services; \
	docker stack rm si-ps-quads-qd

service-stop-lowstack-si-ps-quads-qfq:
	cd services; \
	docker stack rm si-ps-quads-qfq

service-stop-lowstack-si-ps-sexts-sda12b2-sfa0p0-sda0p0:
	cd services; \
	docker stack rm si-ps-sexts-sda12b2-sfa0p0-sda0p0

service-stop-lowstack-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01:
	cd services; \
	docker stack rm si-ps-sexts-sfa12-sda3p1-sfb0-sdb01

service-stop-lowstack-si-ps-sexts-sfb12-sdb3-sfp12-sdp23:
	cd services; \
	docker stack rm si-ps-sexts-sfb12-sdb3-sfp12-sdp23

service-stop-lowstack-si-ps-corrs-c2m12-ia01:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia01

service-stop-lowstack-si-ps-corrs-c2m12-ia02:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia02

service-stop-lowstack-si-ps-corrs-c2m12-ia03:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia03

service-stop-lowstack-si-ps-corrs-c2m12-ia04:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia04

service-stop-lowstack-si-ps-corrs-c2m12-ia05:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia05

service-stop-lowstack-si-ps-corrs-c2m12-ia06:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia06

service-stop-lowstack-si-ps-corrs-c2m12-ia07:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia07

service-stop-lowstack-si-ps-corrs-c2m12-ia08:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia08

service-stop-lowstack-si-ps-corrs-c2m12-ia09:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia09

service-stop-lowstack-si-ps-corrs-c2m12-ia10:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia10

service-stop-lowstack-si-ps-corrs-c2m12-ia11:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia11

service-stop-lowstack-si-ps-corrs-c2m12-ia12:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia12

service-stop-lowstack-si-ps-corrs-c2m12-ia13:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia13

service-stop-lowstack-si-ps-corrs-c2m12-ia14:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia14

service-stop-lowstack-si-ps-corrs-c2m12-ia15:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia15

service-stop-lowstack-si-ps-corrs-c2m12-ia16:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia16

service-stop-lowstack-si-ps-corrs-c2m12-ia17:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia17

service-stop-lowstack-si-ps-corrs-c2m12-ia18:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia18

service-stop-lowstack-si-ps-corrs-c2m12-ia19:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia19

service-stop-lowstack-si-ps-corrs-c2m12-ia20:
	cd services; \
	docker stack rm si-ps-corrs-c2m12-ia20

service-stop-lowstack-si-ps-corrs-c134-ia01:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia01

service-stop-lowstack-si-ps-corrs-c134-ia02:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia02

service-stop-lowstack-si-ps-corrs-c134-ia03:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia03

service-stop-lowstack-si-ps-corrs-c134-ia04:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia04

service-stop-lowstack-si-ps-corrs-c134-ia05:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia05

service-stop-lowstack-si-ps-corrs-c134-ia06:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia06

service-stop-lowstack-si-ps-corrs-c134-ia07:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia07

service-stop-lowstack-si-ps-corrs-c134-ia08:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia08

service-stop-lowstack-si-ps-corrs-c134-ia09:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia09

service-stop-lowstack-si-ps-corrs-c134-ia10:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia10

service-stop-lowstack-si-ps-corrs-c134-ia11:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia11

service-stop-lowstack-si-ps-corrs-c134-ia12:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia12

service-stop-lowstack-si-ps-corrs-c134-ia13:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia13

service-stop-lowstack-si-ps-corrs-c134-ia14:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia14

service-stop-lowstack-si-ps-corrs-c134-ia15:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia15

service-stop-lowstack-si-ps-corrs-c134-ia16:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia16

service-stop-lowstack-si-ps-corrs-c134-ia17:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia17

service-stop-lowstack-si-ps-corrs-c134-ia18:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia18

service-stop-lowstack-si-ps-corrs-c134-ia19:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia19

service-stop-lowstack-si-ps-corrs-c134-ia20:
	cd services; \
	docker stack rm si-ps-corrs-c134-ia20

service-stop-lowstack-si-ps-trims-qs-m12-ia01:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia01

service-stop-lowstack-si-ps-trims-qs-m12-ia02:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia02

service-stop-lowstack-si-ps-trims-qs-m12-ia03:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia03

service-stop-lowstack-si-ps-trims-qs-m12-ia04:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia04

service-stop-lowstack-si-ps-trims-qs-m12-ia05:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia05

service-stop-lowstack-si-ps-trims-qs-m12-ia06:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia06

service-stop-lowstack-si-ps-trims-qs-m12-ia07:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia07

service-stop-lowstack-si-ps-trims-qs-m12-ia08:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia08

service-stop-lowstack-si-ps-trims-qs-m12-ia09:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia09

service-stop-lowstack-si-ps-trims-qs-m12-ia10:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia10

service-stop-lowstack-si-ps-trims-qs-m12-ia11:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia11

service-stop-lowstack-si-ps-trims-qs-m12-ia12:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia12

service-stop-lowstack-si-ps-trims-qs-m12-ia13:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia13

service-stop-lowstack-si-ps-trims-qs-m12-ia14:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia14

service-stop-lowstack-si-ps-trims-qs-m12-ia15:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia15

service-stop-lowstack-si-ps-trims-qs-m12-ia16:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia16

service-stop-lowstack-si-ps-trims-qs-m12-ia17:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia17

service-stop-lowstack-si-ps-trims-qs-m12-ia18:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia18

service-stop-lowstack-si-ps-trims-qs-m12-ia19:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia19

service-stop-lowstack-si-ps-trims-qs-m12-ia20:
	cd services; \
	docker stack rm si-ps-trims-qs-m12-ia20

service-stop-lowstack-si-ps-trims-qs-c1234-ia01:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia01

service-stop-lowstack-si-ps-trims-qs-c1234-ia02:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia02

service-stop-lowstack-si-ps-trims-qs-c1234-ia03:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia03

service-stop-lowstack-si-ps-trims-qs-c1234-ia04:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia04

service-stop-lowstack-si-ps-trims-qs-c1234-ia05:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia05

service-stop-lowstack-si-ps-trims-qs-c1234-ia06:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia06

service-stop-lowstack-si-ps-trims-qs-c1234-ia07:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia07

service-stop-lowstack-si-ps-trims-qs-c1234-ia08:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia08

service-stop-lowstack-si-ps-trims-qs-c1234-ia09:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia09

service-stop-lowstack-si-ps-trims-qs-c1234-ia10:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia10

service-stop-lowstack-si-ps-trims-qs-c1234-ia11:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia11

service-stop-lowstack-si-ps-trims-qs-c1234-ia12:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia12

service-stop-lowstack-si-ps-trims-qs-c1234-ia13:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia13

service-stop-lowstack-si-ps-trims-qs-c1234-ia14:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia14

service-stop-lowstack-si-ps-trims-qs-c1234-ia15:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia15

service-stop-lowstack-si-ps-trims-qs-c1234-ia16:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia16

service-stop-lowstack-si-ps-trims-qs-c1234-ia17:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia17

service-stop-lowstack-si-ps-trims-qs-c1234-ia18:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia18

service-stop-lowstack-si-ps-trims-qs-c1234-ia19:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia19

service-stop-lowstack-si-ps-trims-qs-c1234-ia20:
	cd services; \
	docker stack rm si-ps-trims-qs-c1234-ia20

service-stop-lowstack-as-ti-general:
	cd services; \
	docker stack rm as-ti-general

service-stop-lowstack-bo-ti-bpms-corrs:
	cd services; \
	docker stack rm bo-ti-bpms-corrs

service-stop-lowstack-si-ti-bpms-corrs:
	cd services; \
	docker stack rm si-ti-bpms-corrs

service-stop-lowstack-si-ti-trims-skews:
	cd services; \
	docker stack rm si-ti-trims-skews

service-stop-lowstack-as-pu-conv:
	cd services; \
	docker stack rm as-pu-conv

service-stop-lowstack-as-ap-posang:
	cd services; \
	docker stack rm as-ap-posang

service-stop-lowstack-as-ap-opticscorr:
	cd services; \
	docker stack rm as-ap-opticscorr

service-stop-lowstack-as-ap-currinfo:
	cd services; \
	docker stack rm as-ap-currinfo

service-stop-lowstack-as-ap-sofb:
	cd services; \
	docker stack rm as-ap-sofb

service-stop-lowstack-si-ap-sofb:
	cd services; \
	docker stack rm si-ap-sofb

service-stop-lowstack-as-ap-diag:
	cd services; \
	docker stack rm as-ap-diag

service-stop-lowstack-li-ap-energy:
	cd services; \
	docker stack rm li-ap-energy

service-stop-lowstack-si-ap-bl:
	cd services; \
	docker stack rm si-ap-bl

service-stop-lowstack-si-id-conv:
	cd services; \
	docker stack rm si-id-conv

service-stop-lowstack-as-ap-machshift:
	cd services; \
	docker stack rm as-ap-machshift

service-start-lowstack-all:
	make tags-iocs-update; \
	docker stack deploy -c docker-stack-as-ps-dclinks-tbts-bodip; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia01; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia02; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia03; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia04; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia05; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia06; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia07; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia08; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia09; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia10; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia11; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia12; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia13; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia14; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia15; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia16; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia17; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia18; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia19; \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia20; \
	docker stack deploy -c docker-stack-li-ps-spect-quads-lens; \
	docker stack deploy -c docker-stack-li-ps-corrs; \
	docker stack deploy -c docker-stack-li-ps-slnds; \
	docker stack deploy -c docker-stack-li-ps-conv; \
	docker stack deploy -c docker-stack-li-ps-diag; \
	docker stack deploy -c docker-stack-tb-ps; \
	docker stack deploy -c docker-stack-bo-ps-dips; \
	docker stack deploy -c docker-stack-bo-ps-quads; \
	docker stack deploy -c docker-stack-bo-ps-sexts; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia01; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia02; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia04; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia05; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia07; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia08; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia10; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia11; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia13; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia14; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia16; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia17; \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia20; \
	docker stack deploy -c docker-stack-ts-ps; \
	docker stack deploy -c docker-stack-si-ps-dips; \
	docker stack deploy -c docker-stack-si-ps-quads-qd; \
	docker stack deploy -c docker-stack-si-ps-quads-qfq; \
	docker stack deploy -c docker-stack-si-ps-sexts-sda12b2-sfa0p0-sda0p0; \
	docker stack deploy -c docker-stack-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01; \
	docker stack deploy -c docker-stack-si-ps-sexts-sfb12-sdb3-sfp12-sdp23; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia01; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia02; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia03; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia04; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia05; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia06; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia07; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia08; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia09; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia10; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia11; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia12; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia13; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia14; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia15; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia16; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia17; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia18; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia19; \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia20; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia01; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia02; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia03; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia04; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia05; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia06; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia07; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia08; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia09; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia10; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia11; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia12; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia13; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia14; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia15; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia16; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia17; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia18; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia19; \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia20; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia01; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia02; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia03; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia04; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia05; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia06; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia07; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia08; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia09; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia10; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia11; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia12; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia13; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia14; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia15; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia16; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia17; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia18; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia19; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-m12-ia20; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia01; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia02; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia03; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia04; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia05; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia06; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia07; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia08; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia09; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia10; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia11; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia12; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia13; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia14; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia15; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia16; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia17; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia18; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia19; \
	docker stack deploy -c docker-stack-si-ps-trims-qs-c1234-ia20; \
	docker stack deploy -c docker-stack-as-ti-general; \
	docker stack deploy -c docker-stack-bo-ti-bpms-corrs; \
	docker stack deploy -c docker-stack-si-ti-bpms-corrs; \
	docker stack deploy -c docker-stack-si-ti-trims-skews; \
	docker stack deploy -c docker-stack-as-pu-conv; \
	docker stack deploy -c docker-stack-as-ap-posang; \
	docker stack deploy -c docker-stack-as-ap-opticscorr; \
	docker stack deploy -c docker-stack-as-ap-currinfo; \
	docker stack deploy -c docker-stack-as-ap-sofb; \
	docker stack deploy -c docker-stack-si-ap-sofb; \
	docker stack deploy -c docker-stack-as-ap-diag; \
	docker stack deploy -c docker-stack-li-ap-energy; \
	docker stack deploy -c docker-stack-si-ap-bl; \
	docker stack deploy -c docker-stack-si-id-conv; \
	docker stack deploy -c docker-stack-as-ap-machshift; \
	make tags-iocs-template

service-stop-lowstack-all:
	cd services; \
	docker stack rm as-ps-dclinks-tbts-bodip; \
	docker stack rm as-ps-dclinks-ia01; \
	docker stack rm as-ps-dclinks-ia02; \
	docker stack rm as-ps-dclinks-ia03; \
	docker stack rm as-ps-dclinks-ia04; \
	docker stack rm as-ps-dclinks-ia05; \
	docker stack rm as-ps-dclinks-ia06; \
	docker stack rm as-ps-dclinks-ia07; \
	docker stack rm as-ps-dclinks-ia08; \
	docker stack rm as-ps-dclinks-ia09; \
	docker stack rm as-ps-dclinks-ia10; \
	docker stack rm as-ps-dclinks-ia11; \
	docker stack rm as-ps-dclinks-ia12; \
	docker stack rm as-ps-dclinks-ia13; \
	docker stack rm as-ps-dclinks-ia14; \
	docker stack rm as-ps-dclinks-ia15; \
	docker stack rm as-ps-dclinks-ia16; \
	docker stack rm as-ps-dclinks-ia17; \
	docker stack rm as-ps-dclinks-ia18; \
	docker stack rm as-ps-dclinks-ia19; \
	docker stack rm as-ps-dclinks-ia20; \
	docker stack rm li-ps-spect-quads-lens; \
	docker stack rm li-ps-corrs; \
	docker stack rm li-ps-slnds; \
	docker stack rm li-ps-conv; \
	docker stack rm li-ps-diag; \
	docker stack rm tb-ps; \
	docker stack rm bo-ps-dips; \
	docker stack rm bo-ps-quads; \
	docker stack rm bo-ps-sexts; \
	docker stack rm bo-ps-corrs-ia01; \
	docker stack rm bo-ps-corrs-ia02; \
	docker stack rm bo-ps-corrs-ia04; \
	docker stack rm bo-ps-corrs-ia05; \
	docker stack rm bo-ps-corrs-ia07; \
	docker stack rm bo-ps-corrs-ia08; \
	docker stack rm bo-ps-corrs-ia10; \
	docker stack rm bo-ps-corrs-ia11; \
	docker stack rm bo-ps-corrs-ia13; \
	docker stack rm bo-ps-corrs-ia14; \
	docker stack rm bo-ps-corrs-ia16; \
	docker stack rm bo-ps-corrs-ia17; \
	docker stack rm bo-ps-corrs-ia20; \
	docker stack rm ts-ps; \
	docker stack rm si-ps-dips; \
	docker stack rm si-ps-quads-qd; \
	docker stack rm si-ps-quads-qfq; \
	docker stack rm si-ps-sexts-sda12b2-sfa0p0-sda0p0; \
	docker stack rm si-ps-sexts-sfa12-sda3p1-sfb0-sdb01; \
	docker stack rm si-ps-sexts-sfb12-sdb3-sfp12-sdp23; \
	docker stack rm si-ps-corrs-c2m12-ia01; \
	docker stack rm si-ps-corrs-c2m12-ia02; \
	docker stack rm si-ps-corrs-c2m12-ia03; \
	docker stack rm si-ps-corrs-c2m12-ia04; \
	docker stack rm si-ps-corrs-c2m12-ia05; \
	docker stack rm si-ps-corrs-c2m12-ia06; \
	docker stack rm si-ps-corrs-c2m12-ia07; \
	docker stack rm si-ps-corrs-c2m12-ia08; \
	docker stack rm si-ps-corrs-c2m12-ia09; \
	docker stack rm si-ps-corrs-c2m12-ia10; \
	docker stack rm si-ps-corrs-c2m12-ia11; \
	docker stack rm si-ps-corrs-c2m12-ia12; \
	docker stack rm si-ps-corrs-c2m12-ia13; \
	docker stack rm si-ps-corrs-c2m12-ia14; \
	docker stack rm si-ps-corrs-c2m12-ia15; \
	docker stack rm si-ps-corrs-c2m12-ia16; \
	docker stack rm si-ps-corrs-c2m12-ia17; \
	docker stack rm si-ps-corrs-c2m12-ia18; \
	docker stack rm si-ps-corrs-c2m12-ia19; \
	docker stack rm si-ps-corrs-c2m12-ia20; \
	docker stack rm si-ps-corrs-c134-ia01; \
	docker stack rm si-ps-corrs-c134-ia02; \
	docker stack rm si-ps-corrs-c134-ia03; \
	docker stack rm si-ps-corrs-c134-ia04; \
	docker stack rm si-ps-corrs-c134-ia05; \
	docker stack rm si-ps-corrs-c134-ia06; \
	docker stack rm si-ps-corrs-c134-ia07; \
	docker stack rm si-ps-corrs-c134-ia08; \
	docker stack rm si-ps-corrs-c134-ia09; \
	docker stack rm si-ps-corrs-c134-ia10; \
	docker stack rm si-ps-corrs-c134-ia11; \
	docker stack rm si-ps-corrs-c134-ia12; \
	docker stack rm si-ps-corrs-c134-ia13; \
	docker stack rm si-ps-corrs-c134-ia14; \
	docker stack rm si-ps-corrs-c134-ia15; \
	docker stack rm si-ps-corrs-c134-ia16; \
	docker stack rm si-ps-corrs-c134-ia17; \
	docker stack rm si-ps-corrs-c134-ia18; \
	docker stack rm si-ps-corrs-c134-ia19; \
	docker stack rm si-ps-corrs-c134-ia20; \
	docker stack rm si-ps-trims-qs-m12-ia01; \
	docker stack rm si-ps-trims-qs-m12-ia02; \
	docker stack rm si-ps-trims-qs-m12-ia03; \
	docker stack rm si-ps-trims-qs-m12-ia04; \
	docker stack rm si-ps-trims-qs-m12-ia05; \
	docker stack rm si-ps-trims-qs-m12-ia06; \
	docker stack rm si-ps-trims-qs-m12-ia07; \
	docker stack rm si-ps-trims-qs-m12-ia08; \
	docker stack rm si-ps-trims-qs-m12-ia09; \
	docker stack rm si-ps-trims-qs-m12-ia10; \
	docker stack rm si-ps-trims-qs-m12-ia11; \
	docker stack rm si-ps-trims-qs-m12-ia12; \
	docker stack rm si-ps-trims-qs-m12-ia13; \
	docker stack rm si-ps-trims-qs-m12-ia14; \
	docker stack rm si-ps-trims-qs-m12-ia15; \
	docker stack rm si-ps-trims-qs-m12-ia16; \
	docker stack rm si-ps-trims-qs-m12-ia17; \
	docker stack rm si-ps-trims-qs-m12-ia18; \
	docker stack rm si-ps-trims-qs-m12-ia19; \
	docker stack rm si-ps-trims-qs-m12-ia20; \
	docker stack rm si-ps-trims-qs-c1234-ia01; \
	docker stack rm si-ps-trims-qs-c1234-ia02; \
	docker stack rm si-ps-trims-qs-c1234-ia03; \
	docker stack rm si-ps-trims-qs-c1234-ia04; \
	docker stack rm si-ps-trims-qs-c1234-ia05; \
	docker stack rm si-ps-trims-qs-c1234-ia06; \
	docker stack rm si-ps-trims-qs-c1234-ia07; \
	docker stack rm si-ps-trims-qs-c1234-ia08; \
	docker stack rm si-ps-trims-qs-c1234-ia09; \
	docker stack rm si-ps-trims-qs-c1234-ia10; \
	docker stack rm si-ps-trims-qs-c1234-ia11; \
	docker stack rm si-ps-trims-qs-c1234-ia12; \
	docker stack rm si-ps-trims-qs-c1234-ia13; \
	docker stack rm si-ps-trims-qs-c1234-ia14; \
	docker stack rm si-ps-trims-qs-c1234-ia15; \
	docker stack rm si-ps-trims-qs-c1234-ia16; \
	docker stack rm si-ps-trims-qs-c1234-ia17; \
	docker stack rm si-ps-trims-qs-c1234-ia18; \
	docker stack rm si-ps-trims-qs-c1234-ia19; \
	docker stack rm si-ps-trims-qs-c1234-ia20; \
	docker stack rm as-ti-general; \
	docker stack rm bo-ti-bpms-corrs; \
	docker stack rm si-ti-bpms-corrs; \
	docker stack rm si-ti-trims-skews; \
	docker stack rm as-pu-conv; \
	docker stack rm as-ap-posang; \
	docker stack rm as-ap-opticscorr; \
	docker stack rm as-ap-currinfo; \
	docker stack rm as-ap-sofb; \
	docker stack rm si-ap-sofb; \
	docker stack rm as-ap-diag; \
	docker stack rm li-ap-energy; \
	docker stack rm si-ap-bl; \
	docker stack rm si-id-conv; \
	docker stack rm as-ap-machshift

# --- all ---

service-stop-all: service-stop-highstack-all service-stop-lowstack-all
