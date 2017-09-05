#!/bin/bash

echo "Logging into Docker Hub"
docker login -u $HUB_USER -p $HUB_PASSWORD

echo "Building latest image"
docker build \
	-t gomicro/goose:latest .
if [ "$TRAVIS_BRANCH" == "master" ]; then
	echo "Pushing image to Docker Hub"
	docker pull gomicro/goose:latest
	docker push gomicro/goose:latest
	docker rmi gomicro/goose:latest
fi
