## Note

* This README is incomplete

## Estimate of CPU usage

* There are currently 306 FAC IOCs partitioned in 145 services
* 1 SOFB-SI and 20 PSCorrs were not computed 
* All services run in identical Dell servers
* All IOCs sum up to 2563 % of CPU (ps aux) - 2021-
* Ideally each service should then use 17.7%

## Build
It is important to use different tags when building docker images in order to avoid unintended use of out-of-date images. Different tags also allow for restoring previously used images.


## Makefile
There are targets that can be used to build, pull and run services
