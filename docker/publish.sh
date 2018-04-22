#!/bin/bash

repo=gopikrishna19
image=my-job-queue

version=v$(node -e 'console.log(require("./package.json").version)')

echo Publishing image $version

docker tag $repo/$image $repo/$image:$version
docker tag $repo/$image $repo/$image:latest
docker push $repo/$image:$version
docker push $repo/$image:latest
