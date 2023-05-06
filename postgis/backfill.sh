#!/bin/bash

versions=(
	14-master
	15-master
	15-3.3-alpine
	14-3.3-alpine
)

for version in "${versions[@]}"; do
    echo "Building and pushing version $version..."
    DOCKER_BUILDKIT=1 docker build -t mplibunao/postgis:$version \
        --build-arg POSTGRES_VERSION=$version .
    docker push mplibunao/postgis:$version
done

