abspath_to_makefile := $(abspath $(lastword $(MAKEFILE_LIST)))
makefile_dir := $(patsubst %/,%,$(dir $(abspath_to_makefile)))

.PHONY: all
all: build_image install_executable

image := eightycolumns/workspace:1.0.0

.PHONY: build_image
build_image:
	docker build --build-arg user=${USER} --tag $(image) $(makefile_dir)

bin_dir := $(HOME)/bin
executable := work

.PHONY: install_executable
install_executable: | $(bin_dir)
	cp --force $(makefile_dir)/$(executable) $(bin_dir)/$(executable)

$(bin_dir):
	mkdir --parents $@

.PHONY: clean
clean: remove_image uninstall_executable

.PHONY: remove_image
remove_image: remove_containers
	docker rmi --force $(image)

.PHONY: remove_containers
remove_containers:
	docker rm --force --volumes $$(docker ps --all | grep $(image) | awk '{print $$1}')

.PHONY: uninstall_executable
uninstall_executable:
	rm --force $(bin_dir)/$(executable)
