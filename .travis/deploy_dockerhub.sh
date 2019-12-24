#!/bin/sh
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS docker.io
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi

#docker build -f Dockerfile -t $TRAVIS_REPO_SLUG:$TAG .
docker build -f Dockerfile -t valerians777/cicd-buzz:$TAG .
docker push valerians777/cicd-buzz
