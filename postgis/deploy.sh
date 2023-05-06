#!/bin/bash

echo What postgres version would you like to build?
read VERSION

DOCKER_BUILDKIT=1 docker build -t mplibunao/postgis:$VERSION \
	--build-arg POSTGRES_VERSION=$VERSION .

docker push mplibunao/postgis:$VERSION
