#!/bin/bash

repo=gopikrishna19
image=my-job-queue
WEB1=$(docker ps -aq -f name=web1)

if [ -z $WEB1 ]; then
  echo No existing node found;
  docker container run -d --name web1 -p 8081:8080 $repo/$image;
else
  echo Found existing node $WEB1;
  echo Creating a new image web2 from volume web1 ...;
  docker create --volumes-from web1 --name web2 -p 8081:8080 $repo/$image;
  echo Stopping:;
  docker stop web1;
  echo Starting:;
  docker start web2;
  echo Removing:;
  docker rm web1;
  echo Renaming web2 back to web1;
  docker rename web2 web1;
fi
