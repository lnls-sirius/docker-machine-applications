# tag for lnls-ansible repo from which package versions are to be taken
LNLS_ANSIBLE_TAG ?= master

# tag with EPICS base version
EPICS_BASE_TAG ?= base-3.15.6

# DEPLOY_TAG used for all docker images
DEPLOY_TAG ?= 2021-10-18_test

# tags of docker images that are used by other images or used in deploy
IMG_DEBIAN_TAG ?= bullseye-20211011
IMG_IOCS_LI_PS_TAG ?= 2021-10-18_test

IMG_PYTHON_TAG ?= 2021-10-18_test
IMG_EPICS_TAG ?= 2021-10-18_test
IMG_APPS_TAG ?= 2021-10-18_test

IMG_IOCS_TAG ?= $(DEPLOY_TAG)
