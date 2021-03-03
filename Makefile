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
	cd services; docker stack rm facs-as-ps-dclinks-tbts-bodip

service-facs-as-ps-dclinks-tbts-bodip-start:
	cd services; docker stack deploy -c docker-stack-as-ps-dclinks-tbts-bodip.yml facs-as-ps-dclinks-tbts-bodip

service-facs-as-ps-dclinks-ia01t05-stop:
	cd services; docker stack rm facs-as-ps-dclinks-ia01t05

service-facs-as-ps-dclinks-ia01t05-start:
	cd services; docker stack deploy -c docker-stack-as-ps-dclinks-ia01t05.yml facs-as-ps-dclinks-ia01t05

service-facs-as-ps-dclinks-ia06t10-stop:
	cd services; docker stack rm facs-as-ps-dclinks-ia06t10

service-facs-as-ps-dclinks-ia06t10-start:
	cd services; docker stack deploy -c docker-stack-as-ps-dclinks-ia06t10.yml facs-as-ps-dclinks-ia06t10

service-facs-as-ps-dclinks-ia11t15-stop:
	cd services; docker stack rm facs-as-ps-dclinks-ia11t15

service-facs-as-ps-dclinks-ia11t15-start:
	cd services; docker stack deploy -c docker-stack-as-ps-dclinks-ia11t15.yml facs-as-ps-dclinks-ia11t15

service-facs-as-ps-dclinks-ia16t20-stop:
	cd services; docker stack rm facs-as-ps-dclinks-ia16t20

service-facs-as-ps-dclinks-ia16t20-start:
	cd services; docker stack deploy -c docker-stack-as-ps-dclinks-ia16t20.yml facs-as-ps-dclinks-ia16t20

service-facs-li-ps-spect-quads-lens-stop:
	cd services; docker stack rm facs-li-ps-spect-quads-lens

service-facs-li-ps-spect-quads-lens-start:
	cd services; docker stack deploy -c docker-stack-li-ps-spect-quads-lens.yml facs-li-ps-spect-quads-lens

service-facs-li-ps-corrs-stop:
	cd services; docker stack rm facs-li-ps-corrs

service-facs-li-ps-corrs-start:
	cd services; docker stack deploy -c docker-stack-li-ps-corrs.yml facs-li-ps-corrs

service-facs-li-ps-slnds-stop:
	cd services; docker stack rm facs-li-ps-slnds

service-facs-li-ps-slnds-start:
	cd services; docker stack deploy -c docker-stack-li-ps-slnds.yml facs-li-ps-slnds

service-facs-li-ps-conv-stop:
	cd services; docker stack rm facs-li-ps-conv

service-facs-li-ps-conv-start:
	cd services; docker stack deploy -c docker-stack-li-ps-conv.yml facs-li-ps-conv

service-facs-li-ps-diag-stop:
	cd services; docker stack rm facs-li-ps-diag

service-facs-li-ps-diag-start:
	cd services; docker stack deploy -c docker-stack-li-ps-diag.yml facs-li-ps-diag

service-facs-tb-ps-stop:
	cd services; docker stack rm facs-tb-ps

service-facs-tb-ps-start:
	cd services; docker stack deploy -c docker-stack-tb-ps.yml facs-tb-ps

service-facs-bo-ps-dips-stop:
	cd services; docker stack rm facs-bo-ps-dips

service-facs-bo-ps-dips-start:
	cd services; docker stack deploy -c docker-stack-bo-ps-dips.yml facs-bo-ps-dips

service-facs-bo-ps-quads-stop:
	cd services; docker stack rm facs-bo-ps-quads

service-facs-bo-ps-quads-start:
	cd services; docker stack deploy -c docker-stack-bo-ps-quads.yml facs-bo-ps-quads

service-facs-bo-ps-sexts-stop:
	cd services; docker stack rm facs-bo-ps-sexts

service-facs-bo-ps-sexts-start:
	cd services; docker stack deploy -c docker-stack-bo-ps-sexts.yml facs-bo-ps-sexts

service-facs-bo-ps-corrs-ia01t05-stop:
	cd services; docker stack rm facs-bo-ps-corrs-ia01t05

service-facs-bo-ps-corrs-ia01t05-start:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs-ia01t05.yml facs-bo-ps-corrs-ia01t05

service-facs-bo-ps-corrs-ia06t10-stop:
	cd services; docker stack rm facs-bo-ps-corrs-ia06t10

service-facs-bo-ps-corrs-ia06t10-start:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs-ia06t10.yml facs-bo-ps-corrs-ia06t10

service-facs-bo-ps-corrs-ia11t15-stop:
	cd services; docker stack rm facs-bo-ps-corrs-ia11t15

service-facs-bo-ps-corrs-ia11t15-start:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs-ia11t15.yml facs-bo-ps-corrs-ia11t15

service-facs-bo-ps-corrs-ia16t20-stop:
	cd services; docker stack rm facs-bo-ps-corrs-ia16t20

service-facs-bo-ps-corrs-ia16t20-start:
	cd services; docker stack deploy -c docker-stack-bo-ps-corrs-ia16t20.yml facs-bo-ps-corrs-ia16t20

service-facs-ts-ps-stop:
	cd services; docker stack rm facs-ts-ps

service-facs-ts-ps-start:
	cd services; docker stack deploy -c docker-stack-ts-ps.yml facs-ts-ps

service-facs-si-ps-dips-stop:
	cd services; docker stack rm facs-si-ps-dips

service-facs-si-ps-dips-start:
	cd services; docker stack deploy -c docker-stack-si-ps-dips.yml facs-si-ps-dips

service-facs-si-ps-quads-qd-stop:
	cd services; docker stack rm facs-si-ps-quads-qd

service-facs-si-ps-quads-qd-start:
	cd services; docker stack deploy -c docker-stack-si-ps-quads-qd.yml facs-si-ps-quads-qd

service-facs-si-ps-quads-qfq-stop:
	cd services; docker stack rm facs-si-ps-quads-qfq

service-facs-si-ps-quads-qfq-start:
	cd services; docker stack deploy -c docker-stack-si-ps-quads-qfq.yml facs-si-ps-quads-qfq

service-facs-si-ps-sexts-sda12b2-sfa0p0-sda0p0-stop:
	cd services; docker stack rm facs-si-ps-sexts-sda12b2-sfa0p0-sda0p0

service-facs-si-ps-sexts-sda12b2-sfa0p0-sda0p0-start:
	cd services; docker stack deploy -c docker-stack-si-ps-sexts-sda12b2-sfa0p0-sda0p0.yml facs-si-ps-sexts-sda12b2-sfa0p0-sda0p0

service-facs-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01-stop:
	cd services; docker stack rm facs-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01

service-facs-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01-start:
	cd services; docker stack deploy -c docker-stack-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01.yml facs-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01

service-facs-si-ps-sexts-sfb12-sdb3-sfp12-sdp23-stop:
	cd services; docker stack rm facs-si-ps-sexts-sfb12-sdb3-sfp12-sdp23

service-facs-si-ps-sexts-sfb12-sdb3-sfp12-sdp23-start:
	cd services; docker stack deploy -c docker-stack-si-ps-sexts-sfb12-sdb3-sfp12-sdp23.yml facs-si-ps-sexts-sfb12-sdb3-sfp12-sdp23

service-facs-si-ps-corrs-c2m12-ia01-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia01

service-facs-si-ps-corrs-c2m12-ia01-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia01.yml facs-si-ps-corrs-c2m12-ia01

service-facs-si-ps-corrs-c2m12-ia02-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia02

service-facs-si-ps-corrs-c2m12-ia02-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia02.yml facs-si-ps-corrs-c2m12-ia02

service-facs-si-ps-corrs-c2m12-ia03-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia03

service-facs-si-ps-corrs-c2m12-ia03-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia03.yml facs-si-ps-corrs-c2m12-ia03

service-facs-si-ps-corrs-c2m12-ia04-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia04

service-facs-si-ps-corrs-c2m12-ia04-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia04.yml facs-si-ps-corrs-c2m12-ia04

service-facs-si-ps-corrs-c2m12-ia05-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia05

service-facs-si-ps-corrs-c2m12-ia05-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia05.yml facs-si-ps-corrs-c2m12-ia05

service-facs-si-ps-corrs-c2m12-ia06-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia06

service-facs-si-ps-corrs-c2m12-ia06-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia06.yml facs-si-ps-corrs-c2m12-ia06

service-facs-si-ps-corrs-c2m12-ia07-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia07

service-facs-si-ps-corrs-c2m12-ia07-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia07.yml facs-si-ps-corrs-c2m12-ia07

service-facs-si-ps-corrs-c2m12-ia08-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia08

service-facs-si-ps-corrs-c2m12-ia08-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia08.yml facs-si-ps-corrs-c2m12-ia08

service-facs-si-ps-corrs-c2m12-ia09-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia09

service-facs-si-ps-corrs-c2m12-ia09-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia09.yml facs-si-ps-corrs-c2m12-ia09

service-facs-si-ps-corrs-c2m12-ia10-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia10

service-facs-si-ps-corrs-c2m12-ia10-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia10.yml facs-si-ps-corrs-c2m12-ia10

service-facs-si-ps-corrs-c2m12-ia11-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia11

service-facs-si-ps-corrs-c2m12-ia11-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia11.yml facs-si-ps-corrs-c2m12-ia11

service-facs-si-ps-corrs-c2m12-ia12-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia12

service-facs-si-ps-corrs-c2m12-ia12-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia12.yml facs-si-ps-corrs-c2m12-ia12

service-facs-si-ps-corrs-c2m12-ia13-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia13

service-facs-si-ps-corrs-c2m12-ia13-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia13.yml facs-si-ps-corrs-c2m12-ia13

service-facs-si-ps-corrs-c2m12-ia14-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia14

service-facs-si-ps-corrs-c2m12-ia14-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia14.yml facs-si-ps-corrs-c2m12-ia14

service-facs-si-ps-corrs-c2m12-ia15-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia15

service-facs-si-ps-corrs-c2m12-ia15-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia15.yml facs-si-ps-corrs-c2m12-ia15

service-facs-si-ps-corrs-c2m12-ia16-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia16

service-facs-si-ps-corrs-c2m12-ia16-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia16.yml facs-si-ps-corrs-c2m12-ia16

service-facs-si-ps-corrs-c2m12-ia17-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia17

service-facs-si-ps-corrs-c2m12-ia17-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia17.yml facs-si-ps-corrs-c2m12-ia17

service-facs-si-ps-corrs-c2m12-ia18-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia18

service-facs-si-ps-corrs-c2m12-ia18-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia18.yml facs-si-ps-corrs-c2m12-ia18

service-facs-si-ps-corrs-c2m12-ia19-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia19

service-facs-si-ps-corrs-c2m12-ia19-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia19.yml facs-si-ps-corrs-c2m12-ia19

service-facs-si-ps-corrs-c2m12-ia20-stop:
	cd services; docker stack rm facs-si-ps-corrs-c2m12-ia20

service-facs-si-ps-corrs-c2m12-ia20-start:
	cd sevices; docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia20.yml facs-si-ps-corrs-c2m12-ia20

service-facs-si-ps-corrs-c134-ia01-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia01

service-facs-si-ps-corrs-c134-ia01-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia01,yml facs-si-ps-corrs-c134-ia01

service-facs-si-ps-corrs-c134-ia02-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia02

service-facs-si-ps-corrs-c134-ia02-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia02,yml facs-si-ps-corrs-c134-ia02

service-facs-si-ps-corrs-c134-ia03-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia03

service-facs-si-ps-corrs-c134-ia03-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia03,yml facs-si-ps-corrs-c134-ia03

service-facs-si-ps-corrs-c134-ia04-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia04

service-facs-si-ps-corrs-c134-ia04-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia04,yml facs-si-ps-corrs-c134-ia04

service-facs-si-ps-corrs-c134-ia05-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia05

service-facs-si-ps-corrs-c134-ia05-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia05,yml facs-si-ps-corrs-c134-ia05

service-facs-si-ps-corrs-c134-ia06-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia06

service-facs-si-ps-corrs-c134-ia06-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia06,yml facs-si-ps-corrs-c134-ia06

service-facs-si-ps-corrs-c134-ia07-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia07

service-facs-si-ps-corrs-c134-ia07-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia07,yml facs-si-ps-corrs-c134-ia07

service-facs-si-ps-corrs-c134-ia08-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia08

service-facs-si-ps-corrs-c134-ia08-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia08,yml facs-si-ps-corrs-c134-ia08

service-facs-si-ps-corrs-c134-ia09-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia09

service-facs-si-ps-corrs-c134-ia09-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia09,yml facs-si-ps-corrs-c134-ia09

service-facs-si-ps-corrs-c134-ia10-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia10

service-facs-si-ps-corrs-c134-ia10-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia10,yml facs-si-ps-corrs-c134-ia10

service-facs-si-ps-corrs-c134-ia11-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia11

service-facs-si-ps-corrs-c134-ia11-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia11,yml facs-si-ps-corrs-c134-ia11

service-facs-si-ps-corrs-c134-ia12-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia12

service-facs-si-ps-corrs-c134-ia12-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia12,yml facs-si-ps-corrs-c134-ia12

service-facs-si-ps-corrs-c134-ia13-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia13

service-facs-si-ps-corrs-c134-ia13-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia13,yml facs-si-ps-corrs-c134-ia13

service-facs-si-ps-corrs-c134-ia14-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia14

service-facs-si-ps-corrs-c134-ia14-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia14,yml facs-si-ps-corrs-c134-ia14

service-facs-si-ps-corrs-c134-ia15-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia15

service-facs-si-ps-corrs-c134-ia15-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia15,yml facs-si-ps-corrs-c134-ia15

service-facs-si-ps-corrs-c134-ia16-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia16

service-facs-si-ps-corrs-c134-ia16-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia16,yml facs-si-ps-corrs-c134-ia16

service-facs-si-ps-corrs-c134-ia17-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia17

service-facs-si-ps-corrs-c134-ia17-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia17,yml facs-si-ps-corrs-c134-ia17

service-facs-si-ps-corrs-c134-ia18-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia18

service-facs-si-ps-corrs-c134-ia18-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia18,yml facs-si-ps-corrs-c134-ia18

service-facs-si-ps-corrs-c134-ia19-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia19

service-facs-si-ps-corrs-c134-ia19-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia19,yml facs-si-ps-corrs-c134-ia19

service-facs-si-ps-corrs-c134-ia20-stop:
	cd services; docker stack rm facs-si-ps-corrs-c134-ia20

service-facs-si-ps-corrs-c134-ia20-start:
	cd services; docker stack -c facs-si-ps-corrs-c134-ia20,yml facs-si-ps-corrs-c134-ia20

service-facs-si-ps-trims-m12-ia01t05-stop:
	cd services; docker stack rm facs-si-ps-trims-m12-ia01t05

service-facs-si-ps-trims-m12-ia01t05-start:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-m12-ia01t05.yml facs-si-ps-trims-m12-ia01t05

service-facs-si-ps-trims-m12-ia06t10-stop:
	cd services; docker stack rm facs-si-ps-trims-m12-ia06t10

service-facs-si-ps-trims-m12-ia06t10-start:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-m12-ia06t10.yml facs-si-ps-trims-m12-ia06t10

service-facs-si-ps-trims-m12-ia11t15-stop:
	cd services; docker stack rm facs-si-ps-trims-m12-ia11t15

service-facs-si-ps-trims-m12-ia11t15-start:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-m12-ia11t15.yml facs-si-ps-trims-m12-ia11t15

service-facs-si-ps-trims-m12-ia16t20-stop:
	cd services; docker stack rm facs-si-ps-trims-m12-ia16t20

service-facs-si-ps-trims-m12-ia16t20-start:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-m12-ia16t20.yml facs-si-ps-trims-m12-ia16t20

service-facs-si-ps-trims-c1234-ia01t05-stop:
	cd services; docker stack rm facs-si-ps-trims-c1234-ia01t05

service-facs-si-ps-trims-c1234-ia01t05-start:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-c1234-ia01t05.yml facs-si-ps-trims-c1234-ia01t05

service-facs-si-ps-trims-c1234-ia06t10-stop:
	cd services; docker stack rm facs-si-ps-trims-c1234-ia06t10

service-facs-si-ps-trims-c1234-ia06t10-start:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-c1234-ia06t10.yml facs-si-ps-trims-c1234-ia06t10

service-facs-si-ps-trims-c1234-ia11t15-stop:
	cd services; docker stack rm facs-si-ps-trims-c1234-ia11t15

service-facs-si-ps-trims-c1234-ia11t15-start:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-c1234-ia11t15.yml facs-si-ps-trims-c1234-ia11t15

service-facs-si-ps-trims-c1234-ia16t20-stop:
	cd services; docker stack rm facs-si-ps-trims-c1234-ia16t20

service-facs-si-ps-trims-c1234-ia16t20-start:
	cd services; docker stack deploy -c docker-stack-si-ps-trims-c1234-ia16t20.yml facs-si-ps-trims-c1234-ia16t20

service-facs-as-pu-conv-stop:
	cd services; docker stack rm facs-as-pu-conv

service-facs-as-pu-conv-start:
	cd services; docker stack deploy -c docker-stack-as-pu-conv.yml facs-as-pu-conv

service-facs-as-ti-stop:
	cd services; docker stack rm facs-as-ti

service-facs-as-ti-start:
	cd services; docker stack deploy -c docker-stack-as-ti.yml facs-as-ti

service-facs-bo-ti-bpms-corrs-stop:
	cd services; docker stack rm facs-bo-ti-bpms-corrs

service-facs-bo-ti-bpms-corrs-start:
	cd services; docker stack deploy -c docker-stack-bo-ti-bpms-corrs.yml facs-bo-ti-bpms-corrs

service-facs-si-ti-bpms-corrs-stop:
	cd services; docker stack rm facs-si-ti-bpms-corrs

service-facs-si-ti-bpms-corrs-start:
	cd services; docker stack deploy -c docker-stack-si-ti-bpms-corrs.yml facs-si-ti-bpms-corrs

service-facs-si-ti-trims-skews-stop:
	cd services; docker stack rm facs-si-ti-trims-skews

service-facs-si-ti-trims-skews-start:
	cd services; docker stack deploy -c docker-stack-si-ti-trims-skews.yml facs-si-ti-trims-skews

service-facs-as-ap-posang-stop:
	cd services; docker stack rm facs-as-ap-posang

service-facs-as-ap-posang-start:
	cd services; docker stack deploy -c docker-stack-as-ap-posang.yml facs-as-ap-posang

service-facs-as-ap-opticscorr-stop:
	cd services; docker stack rm facs-as-ap-opticscorr

service-facs-as-ap-opticscorr-start:
	cd services; docker stack deploy -c docker-stack-as-ap-opticscorr.yml facs-as-ap-opticscorr

service-facs-as-ap-currinfo-stop:
	cd services; docker stack rm facs-as-ap-currinfo

service-facs-as-ap-currinfo-start:
	cd services; docker stack deploy -c docker-stack-as-ap-currinfo.yml facs-as-ap-currinfo

service-facs-as-ap-sofb-stop:
	cd services; docker stack rm facs-as-ap-sofb

service-facs-as-ap-sofb-start:
	cd services; docker stack deploy -c docker-stack-as-ap-sofb.yml facs-as-ap-sofb

service-facs-si-ap-sofb-stop:
	cd services; docker stack rm facs-si-ap-sofb

service-facs-si-ap-sofb-start:
	cd services; docker stack deploy -c docker-stack-si-ap-sofb.yml facs-si-ap-sofb

service-facs-as-ap-diag-stop:
	cd services; docker stack rm facs-as-ap-diag

service-facs-as-ap-diag-start:
	cd services; docker stack deploy -c docker-stack-as-ap-diag.yml facs-as-ap-diag

service-facs-li-ap-energy-stop:
	cd services; docker stack rm facs-li-ap-energy

service-facs-li-ap-energy-start:
	cd services; docker stack deploy -c docker-stack-li-ap-energy.yml facs-li-ap-energy

service-facs-si-ap-bl-stop:
	cd services; docker stack rm facs-si-ap-bl

service-facs-si-ap-bl-start:
	cd services; docker stack deploy -c docker-stack-si-ap-bl.yml facs-si-ap-bl

service-facs-si-id-conv-stop:
	cd services; docker stack rm facs-si-id-conv

service-facs-si-id-conv-start:
	cd services; docker stack deploy -c docker-stack-si-id-conv.yml facs-si-id-conv

service-facs-as-ap-machshift-stop:
	cd services; docker stack rm facs-as-ap-machshift

service-facs-as-ap-machshift-start:
	cd services; docker stack deploy -c docker-stack-as-ap-machshift.yml facs-as-ap-machshift

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
	docker stack rm facs-si-ps-dips \
	docker stack rm facs-si-ps-quads \
	docker stack rm facs-si-ps-sexts-sda12b2-sfa0p0-sda0p0 \
	docker stack rm facs-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01 \
	docker stack rm facs-si-ps-sexts-sfb12-sdb3-sfp12-sdp23 \
	docker stack rm facs-si-ps-corrs-c2m12-ia01t05 \
	docker stack rm facs-si-ps-corrs-c2m12-ia06t10 \
	docker stack rm facs-si-ps-corrs-c2m12-ia11t15 \
	docker stack rm facs-si-ps-corrs-c2m12-ia16t20 \
	docker stack rm facs-si-ps-corrs-c134-ia01t05 \
	docker stack rm facs-si-ps-corrs-c134-ia05t10 \
	docker stack rm facs-si-ps-corrs-c134-ia11t15 \
	docker stack rm facs-si-ps-corrs-c134-ia16t20 \
	docker stack rm facs-si-ps-trims-m12-ia01t05 \
	docker stack rm facs-si-ps-trims-m12-ia06t10 \
	docker stack rm facs-si-ps-trims-m12-ia11t15 \
	docker stack rm facs-si-ps-trims-m12-ia16t20 \
	docker stack rm facs-si-ps-trims-c1234-ia01t05 \
	docker stack rm facs-si-ps-trims-c1234-ia05t10 \
	docker stack rm facs-si-ps-trims-c1234-ia11t15 \
	docker stack rm facs-si-ps-trims-c1234-ia16t20 \
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
	docker stack deploy -c docker-stack-as-ps-dclinks-tbts-bodip.yml facs-as-ps-dclinks-tbts-bodip \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia01t10.yml facs-as-ps-dclinks-ia01t10 \
	docker stack deploy -c docker-stack-as-ps-dclinks-ia11t20.yml facs-as-ps-dclinks-ia11t20 \
	docker stack deploy -c docker-stack-li-ps-spect-quads-lens.yml facs-li-ps-spect-quads-lens \
	docker stack deploy -c docker-stack-li-ps-corrs.yml facs-li-ps-corrs \
	docker stack deploy -c docker-stack-li-ps-slnds.yml facs-li-ps-slnds \
	docker stack deploy -c docker-stack-li-ps-conv.yml facs-li-ps-conv \
	docker stack deploy -c docker-stack-li-ps-diag.yml facs-li-ps-diag \
	docker stack deploy -c docker-stack-tb-ps.yml facs-tb-ps \
	docker stack deploy -c docker-stack-bo-ps-dips.yml facs-bo-ps-dips \
	docker stack deploy -c docker-stack-bo-ps-quads.yml facs-bo-ps-quads \
	docker stack deploy -c docker-stack-bo-ps-sexts.yml facs-bo-ps-sexts \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia01t10.yml facs-bo-ps-corrs-ia01t10 \
	docker stack deploy -c docker-stack-bo-ps-corrs-ia11t20.yml facs-bo-ps-corrs-ia11t20 \
	docker stack deploy -c docker-stack-ts-ps.yml facs-ts-ps \
	docker stack deploy -c docker-stack-si-ps-dips.yml facs-si-ps-dips \
	docker stack deploy -c docker-stack-si-ps-quads.yml facs-si-ps-quads \
	docker stack deploy -c docker-stack-si-ps-sexts-sda12b2-sfa0p0-sda0p0 facs-si-ps-sexts-sda12b2-sfa0p0-sda0p0 \
	docker stack deploy -c docker-stack-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01 facs-si-ps-sexts-sfa12-sda3p1-sfb0-sdb01 \
	docker stack deploy -c docker-stack-si-ps-sexts-sfb12-sdb3-sfp12-sdp23 facs-si-ps-sexts-sfb12-sdb3-sfp12-sdp23 \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia01t05.yml facs-si-ps-corrs-c2m12-ia01t05 \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia06t10.yml facs-si-ps-corrs-c2m12-ia06t10 \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia11t15.yml facs-si-ps-corrs-c2m12-ia11t15 \
	docker stack deploy -c docker-stack-si-ps-corrs-c2m12-ia16t20.yml facs-si-ps-corrs-c2m12-ia16t20 \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia01t05.yml facs-si-ps-corrs-c134-ia01t05 \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia06t10.yml facs-si-ps-corrs-c134-ia06t10 \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia11t15.yml facs-si-ps-corrs-c134-ia11t15 \
	docker stack deploy -c docker-stack-si-ps-corrs-c134-ia16t20.yml facs-si-ps-corrs-c134-ia16t20 \
	docker stack deploy -c docker-stack-si-ps-trims-m12-ia01t05.yml facs-si-ps-trims-m12-ia01t05 \
	docker stack deploy -c docker-stack-si-ps-trims-m12-ia06t10.yml facs-si-ps-trims-m12-ia06t10 \
	docker stack deploy -c docker-stack-si-ps-trims-m12-ia11t15.yml facs-si-ps-trims-m12-ia11t15 \
	docker stack deploy -c docker-stack-si-ps-trims-m12-ia16t20.yml facs-si-ps-trims-m12-ia16t20 \
	docker stack deploy -c docker-stack-si-ps-trims-c1234-ia01t05.yml facs-si-ps-trims-c1234-ia01t05 \
	docker stack deploy -c docker-stack-si-ps-trims-c1234-ia06t10.yml facs-si-ps-trims-c1234-ia06t10 \
	docker stack deploy -c docker-stack-si-ps-trims-c1234-ia11t15.yml facs-si-ps-trims-c1234-ia11t15 \
	docker stack deploy -c docker-stack-si-ps-trims-c1234-ia16t20.yml facs-si-ps-trims-c1234-ia16t20 \
	docker stack deploy -c docker-stack-as-pu-conv.yml facs-as-pu-conv \
	docker stack deploy -c docker-stack-as-ti.yml facs-as-ti \
	docker stack deploy -c docker-stack-bo-ti-bpms-corrs.yml facs-bo-ti-bpms-corrs \
	docker stack deploy -c docker-stack-si-ti-bpms-corrs.yml facs-si-ti-bpms-corrs \
	docker stack deploy -c docker-stack-si-ti-trims-skews.yml facs-si-ti-trims-skews \
	docker stack deploy -c docker-stack-as-ap-posang.yml facs-as-ap-posang \
	docker stack deploy -c docker-stack-as-ap-opticscorr.yml facs-as-ap-opticscorr \
	docker stack deploy -c docker-stack-as-ap-currinfo.yml facs-as-ap-currinfo \
	docker stack deploy -c docker-stack-as-ap-sofb.yml facs-as-ap-sofb \
	docker stack deploy -c docker-stack-si-ap-sofb.yml facs-si-ap-sofb \
	docker stack deploy -c docker-stack-as-ap-diag.yml facs-as-ap-diag \
	docker stack deploy -c docker-stack-li-ap-energy.yml facs-li-ap-energy \
	docker stack deploy -c docker-stack-si-ap-bl.yml facs-si-ap-bl \
	docker stack deploy -c docker-stack-si-id-conv.yml facs-si-id-conv \
	docker stack deploy -c docker-stack-as-ap-machshift.yml facs-as-ap-machshift
