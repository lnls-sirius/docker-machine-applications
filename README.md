## Introduction

This repository contains files used to create docker images and to manage FAC services that use these images.

## Docker images

There are five docker images for creating the final image for FAC services:

1. _fac-python_: Python3 image based on debian:$(IMG_DEBIAN_TAG) image
2. _fac-epics_: _fac-python_ and epics base package defined in $(EPICS_BASE_TAG)
3. _fac-apps_: _fac-epics_ and IOC packages dependencies
4. _fac-iocs_: _fac-apps_ and sirius packages for IOCs and bash script entry-points
5. _fac-iocs-li-ps_: linac power supply IOC images.
## Build

Image tags and package versions can be edited in files _tags.mk_ and _pkg-versionx.txt_. 

Docker images can be built locally with makefile targets:
1. image-build-fac-python
2. image-build-fac-epics
3. image-build-fac-apps
4. image-build-fac-iocs (IOC image)
5. image-build-fac-iocs-li-ps (IOC image)

IOC docker images can be built from ansible running the following makefile target, with DEPLOY_TAG provided as argument:
1. deploy

Note: at this point _fac-iocs-li-ps_ is not yet configured to be build and updated with ansible.



## Examples of docker commands:

* List running services in a docker node:
    docker node ps IA-14RaDiag03-CO-IOCSrv | grep Running | grep fac | grep trims-qs-c123

* Add constraint to a service:
    docker service update --constraint-add "node.hostname == lnlsfac-srv2" facs-si-ps_trims-qs-c1234-ia10

* Remove constraint to a service:
    docker service update --constraint-rm "node.hostname == lnlsfac-srv2" facs-si-ps_trims-qs-c1234-ia10

* watch dell servers load:
    https://10.0.38.46:20093/zabbix.php?action=dashboard.view&dashboardid=73
