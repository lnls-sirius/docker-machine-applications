# tag for lnls-ansible repo from which package versions are to be taken
LNLS_ANSIBLE_TAG ?= master
VERSION_FILE ?= https://raw.githubusercontent.com/lnls-sirius/lnls-ansible/$(LNLS_ANSIBLE_TAG)/inventories/sirius/group_vars/all

# Local file server URL
FILES_SERVER_URL ?= http://10.0.38.42/download/lnls-ansible

# tag with EPICS base version
EPICS_BASE_TAG ?= base-3.15.6

# tags used for creating docker images
IMG_DEBIAN_TAG ?= bullseye-20211011
#DEPLOY_TAG ?= 2025-04-23
DEPLOY_TAG ?= 2025-04-28_16-00-00

# image tags used for starting docker services
IMG_IOCS_LI_PS_TAG ?= 2025-04-23
IMG_PYTHON_TAG ?= 2025-04-23 # also used as base image for fac-epics
IMG_EPICS_TAG ?= 2025-04-23
IMG_DEPS_TAG ?= 2025-04-23
IMG_IOCS_TAG ?= $(DEPLOY_TAG)
