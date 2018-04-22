#!/bin/bash

repo=gopikrishna19
image=my-job-queue

npm pack
tar -xvf $image-*
cp package-lock.json package/
docker image build -t $repo/$image package

rm -rf package $image-*
