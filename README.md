## Introduction

This repository contains files used to create docker images and to manage FAC services that use these images.

## Docker images

There are four docker images for creating the final image for FAC services:

1. _fac-base_: official debian, a few aditional at packages and ansible.
2. _fac-epics_: _fac-base_ and python and epics packages
3. _fac-apps_: _fac-epics_ and FAC python packages (siriuspy, machine-applications)
4. _fac-iocs_: _fac-apps_ and applications (IOCs) implemented as bash script entry-points
## Build

Makefile targets can be used to build docker images:
1. image-build-fac-base
2. image-build-fac-epics
3. image-build-fac-apps
4. image-build-fac-iocs

## Services

All FAC services were implemented in two partition sets of stack services: a _highstack_ set and a _lowstack_ set.
_highstack_ set is composed of stack services gathered in larger IOC groups. for example, BO power supply IOCs are grouped as a single stack service in the _highstack_ set called *facs-bo-ps*, whereas in the _lowstack_ set these IOCs are implemented with many service stacks, *facs-bo-ps-dips*, *facs-bo-ps-quads*, and so on.

For all stack services, either of _highstack_ or _lowstack_ type, there are Makefile targets for stopping service stacks and another one
for starting them.

## Image tags

Tags for the our docker images are defined in images/.env file. Service targets take these tags from this file and replace in docker-stack service definition files defore starting services. (see targets tags-* in Makefile)
## Estimate of CPU usage

For better splitting of IOCs into containers/services an estimate of CPU usage of IOCs was perfomed:

* There are currently 306 FAC IOCs partitioned in 145 services
* 1 SOFB-SI and 20 PSCorrs were not computed 
* All services run in identical Dell servers
* All IOCs sum up to 2563 % of CPU (ps aux) - 2021-
* Ideally each service should then use 17.7%

## Moving services around:

* List running services in a docker node:
    docker node ps IA-14RaDiag03-CO-IOCSrv | grep Running | grep fac | grep trims-qs-c123

* Add constraint to a service:
    docker service update --constraint-add "node.hostname == lnlsfac-srv2" facs-si-ps_trims-qs-c1234-ia10

* Remove constraint to a service:
    docker service update --constraint-rm "node.hostname == lnlsfac-srv2" facs-si-ps_trims-qs-c1234-ia10

* watch dell servers load:
    https://10.0.38.46:20093/zabbix.php?action=dashboard.view&dashboardid=73
