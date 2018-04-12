#!/bin/bash -e

docker run \
	--rm \
	-v $PWD/strace:/strace \
	--cap-add SYS_PTRACE \
	node-tracer:latest \
	-f \
	-o node-tracer-${date}.strace \
	npm i -g petermbenjamin
