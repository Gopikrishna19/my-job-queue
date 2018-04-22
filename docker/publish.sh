#!/bin/bash

image=my-job-queue
repo=gopikrishna19

docker tag $image $repo/$image:$1
docker push $repo/$image:$1
