
DOCKER_USERNAME ?= username
APPLICATION_NAME ?= hello-world

_BUILD_ARGS_TAG ?= ${GIT_HASH}
_BUILD_ARGS_RELEASE_TAG ?= latest
_BUILD_ARGS_DOCKERFILE ?= Dockerfile
 
_builder:
         docker build --tag ${DOCKER_USERNAME}/${APPLICATION_NAME}:${_BUILD_ARGS_TAG} -f ${_BUILD_ARGS_DOCKERFILE} .
 
_pusher:
         docker push ${DOCKER_USERNAME}/${APPLICATION_NAME}:${_BUILD_ARGS_TAG}
 
_releaser:
         docker pull ${DOCKER_USERNAME}/${APPLICATION_NAME}:${_BUILD_ARGS_TAG}
         docker tag  ${DOCKER_USERNAME}/${APPLICATION_NAME}:${_BUILD_ARGS_TAG} ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest
         docker push ${DOCKER_USERNAME}/${APPLICATION_NAME}:${_BUILD_ARGS_RELEASE_TAG}

build_%:
         $(MAKE) _builder \
                     -e _BUILD_ARGS_TAG="$*-${GIT_HASH}" \
                     -e _BUILD_ARGS_DOCKERFILE="Dockerfile.$*"
 
push_%:
         $(MAKE) _pusher \
                     -e _BUILD_ARGS_TAG="$*-${GIT_HASH}"
 
release_%:
         $(MAKE) _releaser \
                     -e _BUILD_ARGS_TAG="$*-${GIT_HASH}" \
                     -e _BUILD_ARGS_RELEASE_TAG="$*-latest"

## make build push