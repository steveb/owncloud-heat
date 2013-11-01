
IMAGE_BASE=ubuntu
IMAGE_NAME=$(IMAGE_BASE)-owncloud
IMAGE_ELEMENTS=$(IMAGE_BASE) vm owncloud heat-cfntools
IMAGE_ARCH=i386
image-all: image image-upload

image:
	disk-image-create -a $(IMAGE_ARCH) -o $(IMAGE_NAME) $(IMAGE_ELEMENTS)

image-upload:
	glance image-create --name $(IMAGE_NAME) --disk-format=qcow2 --container-format=bare --file $(IMAGE_NAME).qcow2
