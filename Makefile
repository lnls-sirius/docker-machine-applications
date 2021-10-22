# Deploy:
#
# 0. make tags-pkg-versions         # Update forced package tags (optional)
# 1. make tags-update               # Update image and repo tags
#
# IOC image:
#
# 2. make image-build-fac-python
# 3. make image-build-fac-epics
# 4. make image-build-fac-iocs
#
# Linac PS IOC image:
#
# 5. make image-build-fac-ioc-li-ps

include tags.mk

BUILD_CACHE ?= --no-cache
# BUILD_CACHE ?= 

deploy: image-build-fac-iocs
	# update deploy tag in tags.mk
	sed -i "s/DEPLOY_TAG ?= .*/DEPLOY_TAG ?= $(DEPLOY_TAG)/g" ./tags.mk

tags-pkg-versions:
	vi pkg-versions.txt

tags-update:
	vi tags.mk

dockerfiles-create:
	mkdir -p ./deploy
	echo $(IMG_DEBIAN_TAG) > ./deploy/IMG_DEBIAN_TAG
	echo $(LNLS_ANSIBLE_TAG) > ./deploy/LNLS_ANSIBLE_TAG
	curl $(VERSION_FILE) -o ./deploy/LNLS-ANSIBLE-ALL && \
	cat ./deploy/LNLS-ANSIBLE-ALL | grep "^pkg_" | sed "s/://g" | sed 's/"//g' > ./deploy/PKG-VERSIONS && \
	cat ./deploy/PKG-VERSIONS > ./deploy/REPLACE-RULES
	cat ./pkg-versions.txt >> ./deploy/REPLACE-RULES

dockerfiles-destroy:
	rm -rf ./deploy

image-cleanup:
	docker system prune --filter "label=br.com.lnls-sirius.department=FAC" --all --force

image-pull-tag-push-debian:
	docker pull debian:$(IMG_DEBIAN_TAG)
	docker tag  debian:$(IMG_DEBIAN_TAG) dockerregistry.lnls-sirius.com.br/fac/fac-debian:$(IMG_DEBIAN_TAG)
	docker push dockerregistry.lnls-sirius.com.br/fac/fac-debian:$(IMG_DEBIAN_TAG)

# time: 2m35s @ 10.0.38.42
image-build-fac-python: image-cleanup dockerfiles-create image-pull-tag-push-debian
	python ./tools/replace_versions.py ./deploy/REPLACE-RULES dockerfile-templates/Dockerfile.python > ./deploy/Dockerfile.python
	docker build -f ./deploy/Dockerfile.python \
		$(BUILD_CACHE) \
		--build-arg IMG_DEBIAN_TAG=$(IMG_DEBIAN_TAG) \
		--label "br.com.lnls-sirius.department=FAC" \
		. -t dockerregistry.lnls-sirius.com.br/fac/fac-python:$(DEPLOY_TAG)
	docker push dockerregistry.lnls-sirius.com.br/fac/fac-python:$(DEPLOY_TAG)

# time: 1m02s @ 10.0.38.42
image-build-fac-epics: dockerfiles-create
	python ./tools/replace_versions.py ./deploy/REPLACE-RULES dockerfile-templates/Dockerfile.epics > ./deploy/Dockerfile.epics
	docker build -f ./deploy/Dockerfile.epics \
		$(BUILD_CACHE) \
		--build-arg FILES_SERVER_URL=$(FILES_SERVER_URL) \
		--build-arg IMG_PYTHON_TAG=$(IMG_PYTHON_TAG) \
		--build-arg EPICS_BASE_TAG=$(EPICS_BASE_TAG) \
		--label "br.com.lnls-sirius.department=FAC" \
		. -t dockerregistry.lnls-sirius.com.br/fac/fac-epics:$(DEPLOY_TAG)
	docker push dockerregistry.lnls-sirius.com.br/fac/fac-epics:$(DEPLOY_TAG)

# time: 3m29s @ 10.0.38.42
image-build-fac-apps: dockerfiles-create
	python ./tools/replace_versions.py ./deploy/REPLACE-RULES dockerfile-templates/Dockerfile.apps > ./deploy/Dockerfile.apps
	docker build -f ./deploy/Dockerfile.apps \
		$(BUILD_CACHE) \
		--build-arg IMG_EPICS_TAG=$(IMG_EPICS_TAG) \
		--label "br.com.lnls-sirius.department=FAC" \
		. -t dockerregistry.lnls-sirius.com.br/fac/fac-apps:$(DEPLOY_TAG)
	docker push dockerregistry.lnls-sirius.com.br/fac/fac-apps:$(DEPLOY_TAG)

# time: 1m41s @ 10.0.38.42
image-build-fac-iocs: image-cleanup dockerfiles-create
	python ./tools/replace_versions.py ./deploy/REPLACE-RULES dockerfile-templates/Dockerfile.iocs > ./deploy/Dockerfile.iocs
	docker build -f ./deploy/Dockerfile.iocs \
		$(BUILD_CACHE) \
		--build-arg IMG_APPS_TAG=$(IMG_APPS_TAG) \
		--label "br.com.lnls-sirius.department=FAC" \
		. -t dockerregistry.lnls-sirius.com.br/fac/fac-iocs:$(DEPLOY_TAG) && \
	docker push dockerregistry.lnls-sirius.com.br/fac/fac-iocs:$(DEPLOY_TAG)

# time: 3m21s @ 10.0.38.42
image-build-fac-iocs-li-ps: image-cleanup dockerfiles-create image-pull-tag-push-debian
	python ./tools/replace_versions.py ./deploy/REPLACE-RULES dockerfile-templates/Dockerfile.python2 > ./deploy/Dockerfile.python2
	python ./tools/replace_versions.py ./deploy/REPLACE-RULES dockerfile-templates/Dockerfile.epics-python2 > ./deploy/Dockerfile.epics-python2
	python ./tools/replace_versions.py ./deploy/REPLACE-RULES dockerfile-templates/Dockerfile.iocs-li-ps > ./deploy/Dockerfile.iocs-li-ps
	docker build -f ./deploy/Dockerfile.python2 \
		$(BUILD_CACHE) \
		--build-arg IMG_DEBIAN_TAG=$(IMG_DEBIAN_TAG) \
		--label "br.com.lnls-sirius.department=FAC" \
		. -t fac-python2 && \
	docker build -f ./deploy/Dockerfile.epics-python2 \
		$(BUILD_CACHE) \
		--build-arg FILES_SERVER_URL=$(FILES_SERVER_URL) \
		--build-arg IMG_PYTHON2_TAG=$(DEPLOY_TAG) \
		--build-arg EPICS_BASE_TAG=$(EPICS_BASE_TAG) \
		--label "br.com.lnls-sirius.department=FAC" \
		. -t fac-epics-python2 && \
	docker build -f ./deploy/Dockerfile.iocs-li-ps \
		$(BUILD_CACHE) \
		--build-arg IMG_EPICS_TAG=$(DEPLOY_TAG) \
		--label "br.com.lnls-sirius.department=FAC" \
		. -t dockerregistry.lnls-sirius.com.br/fac/fac-iocs-li-ps:$(DEPLOY_TAG) && \
	docker push dockerregistry.lnls-sirius.com.br/fac/fac-iocs-li-ps:$(DEPLOY_TAG)

image-runbash-fac-python:
	docker run -it --rm --network host dockerregistry.lnls-sirius.com.br/fac/fac-python:$(DEPLOY_TAG)

image-runbash-fac-epics:
	docker run -it --rm --network host dockerregistry.lnls-sirius.com.br/fac/fac-epics:$(DEPLOY_TAG)

image-runbash-fac-apps:
	docker run -it --rm --network host dockerregistry.lnls-sirius.com.br/fac/fac-apps:$(DEPLOY_TAG)

image-runbash-fac-iocs:
	docker run -it --rm --network host dockerregistry.lnls-sirius.com.br/fac/fac-iocs:$(DEPLOY_TAG)

image-runbash-fac-iocs-li-ps:
	docker run -it --rm --network host dockerregistry.lnls-sirius.com.br/fac/fac-iocs-li-ps:$(DEPLOY_TAG)


# --- individual service stacks ---

service-start-li-ps:
	cd services && \
	sed -i "s/fac-iocs-li-ps:.*/fac-iocs-li-ps:$(IMG_IOCS_LI_PS_TAG)/g" docker-stack-li-ps.yml && \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-li-ps.yml && \
	docker stack deploy -c docker-stack-li-ps.yml facs-li-ps && \
	sed -i "s/fac-iocs-li-ps:.*/fac-iocs-li-ps:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-li-ps.yml && \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-li-ps.yml

service-stop-li-ps:
	cd services && \
	docker stack rm facs-li-ps


service-start-as-ps-dclinks:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-as-ps-dclinks.yml; \
	docker stack deploy -c docker-stack-as-ps-dclinks.yml facs-as-ps-dclinks; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ps-dclinks.yml

service-start-tb-ps:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-tb-ps.yml; \
	docker stack deploy -c docker-stack-tb-ps.yml facs-tb-ps; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-tb-ps.yml

service-start-bo-ps:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-bo-ps.yml; \
	docker stack deploy -c docker-stack-bo-ps.yml facs-bo-ps; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-bo-ps.yml

service-start-ts-ps:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-ts-ps.yml; \
	docker stack deploy -c docker-stack-ts-ps.yml facs-ts-ps; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-ts-ps.yml

service-start-si-ps:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-si-ps.yml; \
	docker stack deploy -c docker-stack-si-ps.yml facs-si-ps; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ps.yml

service-start-it-ps:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-it-ps.yml; \
	docker stack deploy -c docker-stack-it-ps.yml facs-it-ps; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-it-ps.yml

service-start-as-ti:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-as-ti.yml; \
	docker stack deploy -c docker-stack-as-ti.yml facs-as-ti; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ti.yml

service-start-as-pu-conv:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-as-pu-conv.yml; \
	docker stack deploy -c docker-stack-as-pu-conv.yml facs-as-pu-conv; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-pu-conv.yml

service-start-as-ap-posang:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-as-ap-posang.yml; \
	docker stack deploy -c docker-stack-as-ap-posang.yml facs-as-ap-posang; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-posang.yml

service-start-as-ap-opticscorr:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-as-ap-opticscorr.yml; \
	docker stack deploy -c docker-stack-as-ap-opticscorr.yml facs-as-ap-opticscorr; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-opticscorr.yml

service-start-as-ap-currinfo:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-as-ap-currinfo.yml; \
	docker stack deploy -c docker-stack-as-ap-currinfo.yml facs-as-ap-currinfo; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-currinfo.yml

service-start-as-ap-sofb:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-as-ap-sofb.yml; \
	docker stack deploy -c docker-stack-as-ap-sofb.yml facs-as-ap-sofb; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-sofb.yml

service-start-si-ap-sofb:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-si-ap-sofb.yml; \
	docker stack deploy -c docker-stack-si-ap-sofb.yml facs-si-ap-sofb; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ap-sofb.yml

service-start-as-ap-diag:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-as-ap-diag.yml; \
	docker stack deploy -c docker-stack-as-ap-diag.yml facs-as-ap-diag; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-diag.yml

service-start-li-ap-energy:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-li-ap-energy.yml; \
	docker stack deploy -c docker-stack-li-ap-energy.yml facs-li-ap-energy; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-li-ap-energy.yml

service-start-si-ap-bl:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-si-ap-bl.yml; \
	docker stack deploy -c docker-stack-si-ap-bl.yml facs-si-ap-bl; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-ap-bl.yml

service-start-si-id-conv:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-si-id-conv.yml; \
	docker stack deploy -c docker-stack-si-id-conv.yml facs-si-id-conv; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-si-id-conv.yml

service-start-as-ap-machshift:
	cd services; \
	sed -i "s/fac-iocs:.*/fac-iocs:$(IMG_IOCS_TAG)/g" docker-stack-as-ap-machshift.yml; \
	docker stack deploy -c docker-stack-as-ap-machshift.yml facs-as-ap-machshift; \
	sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" docker-stack-as-ap-machshift.yml

service-stop-as-ps-dclinks:
	cd services; \
	docker stack rm facs-as-ps-dclinks

service-stop-tb-ps:
	cd services; \
	docker stack rm facs-tb-ps

service-stop-bo-ps:
	cd services; \
	docker stack rm facs-bo-ps

service-stop-ts-ps:
	cd services; \
	docker stack rm facs-ts-ps

service-stop-si-ps:
	cd services; \
	docker stack rm facs-si-ps

service-stop-it-ps:
	cd services; \
	docker stack rm facs-it-ps

service-stop-as-ti:
	cd services; \
	docker stack rm facs-as-ti

service-stop-as-pu-conv:
	cd services; \
	docker stack rm facs-as-pu-conv

service-stop-as-ap-posang:
	cd services; \
	docker stack rm facs-as-ap-posang

service-stop-as-ap-opticscorr:
	cd services; \
	docker stack rm facs-as-ap-opticscorr

service-stop-as-ap-currinfo:
	cd services; \
	docker stack rm facs-as-ap-currinfo

service-stop-as-ap-sofb:
	cd services; \
	docker stack rm facs-as-ap-sofb

service-stop-si-ap-sofb:
	cd services; \
	docker stack rm facs-si-ap-sofb

service-stop-as-ap-diag:
	cd services; \
	docker stack rm facs-as-ap-diag

service-stop-li-ap-energy:
	cd services; \
	docker stack rm facs-li-ap-energy

service-stop-si-ap-bl:
	cd services; \
	docker stack rm facs-si-ap-bl

service-stop-si-id-conv:
	cd services; \
	docker stack rm facs-si-id-conv

service-stop-as-ap-machshift:
	cd services; \
	docker stack rm facs-as-ap-machshift





# --- all services at once ---

service-start-all:
	cd services && \
	sed -i "s/fac-iocs-li-ps:.*/fac-iocs-li-ps:$(IMG_IOCS_LI_PS_TAG)/g" docker-stack-li-ps.yml && \
	find ./ -name "docker-*.yml" -exec sed -i "s/fac-iocs-li-ps:.*/fac-iocs:$(IMG_IOCS_LI_PS_TAG)/g" {} \;
	docker stack deploy -c docker-stack-as-ps-dclinks.yml facs-as-ps-dclinks; \
	docker stack deploy -c docker-stack-li-ps.yml facs-li-ps; \
	docker stack deploy -c docker-stack-tb-ps.yml facs-tb-ps; \
	docker stack deploy -c docker-stack-bo-ps.yml facs-bo-ps; \
	docker stack deploy -c docker-stack-ts-ps.yml facs-ts-ps; \
	docker stack deploy -c docker-stack-si-ps.yml facs-si-ps; \
	docker stack deploy -c docker-stack-it-ps.yml facs-it-ps; \
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
	sed -i "s/fac-iocs-li-ps:.*/fac-iocs-li-ps:__FAC_IOC_LI_PS_TAG_TEMPLATE__/g" docker-stack-li-ps.yml && \
	find ./ -name "docker-*.yml" -exec sed -i "s/fac-iocs:.*/fac-iocs:__FAC_IOC_TAG_TEMPLATE__/g" {} \; && \

service-stop-all:
	cd services; \
	docker stack rm facs-as-ps-dclinks; \
	docker stack rm facs-li-ps; \
	docker stack rm facs-tb-ps; \
	docker stack rm facs-bo-ps; \
	docker stack rm facs-ts-ps; \
	docker stack rm facs-si-ps; \
	docker stack rm facs-it-ps; \
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


