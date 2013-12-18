all:
	vagrant up
update:
	git pull && git submodule init && git submodule update && git submodule status
