PWD := $(shell pwd)
NAME := dina/openjdk-biobox:v0
XSOCK := /tmp/.X11-unix/X0

build:
	docker-compose build ui

debug:
        xhost +local:
	docker run --rm -it \
		-v $(XSOCK):$(XSOCK) -e DISPLAY=$${DISPLAY} \
		${NAME}

up:
	@echo "Launching Intellij"
	xhost +local:
	docker-compose up ui
