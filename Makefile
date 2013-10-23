
IMAGE_BASE=fedora
IMAGE_NAME=$(IMAGE_BASE)-owncloud
IMAGE_ELEMENTS=$(IMAGE_BASE) vm owncloud selinux-permissive heat-cfntools
IMAGE_ARCH=i386
IMAGE_ELEMENTS_PATH=elements
image-all: image image-upload

image:
	ELEMENTS_PATH=$(IMAGE_ELEMENTS_PATH) \
	disk-image-create -a $(IMAGE_ARCH) -o $(IMAGE_NAME) $(IMAGE_ELEMENTS)

image-upload:
	glance image-create --name $(IMAGE_NAME) --disk-format=qcow2 --container-format=bare < $(IMAGE_NAME).qcow2


