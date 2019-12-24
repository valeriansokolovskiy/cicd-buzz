#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS docker.io
#docker login -u "valerians777" -p "Valerian301331" docker.io

if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi

docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
#docker build -f Dockerfile -t valerians777/cicd-buzz:$TAG .
#docker push valerians777/cicd-buzz
docker push $TRAVIS_REPO_SLUG
