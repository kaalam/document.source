---
title: How to build your own Jazz Docker image
summary: A few clues on creating a Jazz on Docker image.
sidebar: mydoc_sidebar
permalink: reference_docker_how_to_build.html
---

## Links on Docker and Docker Hub

<span class="label label-info">Getting started with Docker</span>

You can check these links if you need to know about Docker.

 * [What is a Docker container?](https://www.docker.com/resources/what-container)
 * [Starting with Docker](https://docs.docker.com/get-started/)
 * [What is Docker Hub](https://docs.docker.com/docker-hub/)


## Building by example

<span class="label label-info">Building your image</span>

This example taken from the LSS shows how to build a Docker image and update it to Docker Hub.

{% include tip.html content="**Prerequisites** This assumes that you have Docker installed, the Jazz repository cloned and ./config.sh
was run successfully. You should start inside the docker folder." %}

{% include note.html content="Of course, you should own a Docker Hub account, modify paths and use your credentials when asked." %}


```bash
#!/bin/bash

docker_pwd=$(pwd)

cd ../server || return 1

make jazz
cp jazz ../docker
make clean

cd "$docker_pwd" || return 1

cp ../server/config/jazz_config.ini .

docker build -t jazz_ref_stable .

docker login

docker tag jazz_ref_stable kaalam/jazz_neat:0.3.1
docker push kaalam/jazz_neat:0.3.1

rm jazz
rm jazz_config.ini
```

You can use this to run the docker image in debug mode (allowing login into the Linux image).

```bash
docker run -p8888:8888 -ti kaalam/jazz_neat:0.2.0.99 /bin/bash
```

Use this to run the image you just created.

```bash
docker run -p8888:8888 kaalam/jazz_neat:0.2.0.99
```

This example (implicitly) refers to a Dockerfile that tell Docker how to build the image

```docker
FROM ubuntu

MAINTAINER kaalam.ai

WORKDIR /home/jadmin

RUN apt-get update && apt-get install -y libmicrohttpd-dev

RUN ln -s /usr/lib/x86_64-linux-gnu/libmicrohttpd.so.10 /usr/lib/x86_64-linux-gnu/libmicrohttpd.so.12

RUN mkdir /home/jadmin/mdb

ADD ./start.sh /home/jadmin
ADD ./jazz /home/jadmin
ADD ./jazz_config.ini /home/jadmin/config/jazz_config.ini

EXPOSE 8888

CMD ["/home/jadmin/start.sh"]
```

{% include tip.html content="To make it more efficient, you can group all the ADD commands into one joining them with \"+\"." %}

The start.sh file is found in the docker folder, but it's just a call to `jazz start`.

{% include important.html content="The previous example does not include loading anything into the Jazz server. For a more realistic
application, you should develop using a development server. Then, persist the state of the JazzSource object containing all the magic
and make a copy of that file into your Docker image. To tell Jazz to open that JazzSource, you can simply use the http interface.
Even if the JazzSource is on the server, you have to open it to make the server learn all the urls in order to have your application
working." %}

{% include links.html %}
