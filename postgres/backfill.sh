#!/bin/bash

versions=(
	15.0
	15.0-bullseye
	15.1-alpine3.16
	15.1-alpine3.17
	15.1-alpine
	15.1
	15.1-bullseye
	15.2-alpine
	15.2-alpine3.17
	15.2-bullseye
	15.2
	15.0-alpine3.16
)

for version in "${versions[@]}"; do
    echo "Building and pushing version $version..."
    DOCKER_BUILDKIT=1 docker build -t mplibunao/postgres:$version \
        --build-arg POSTGRES_VERSION=$version .
    docker push mplibunao/postgres:$version
done

