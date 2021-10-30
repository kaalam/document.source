---
title: How to build your own Jazz Docker image
summary: A few clues on creating a Jazz Docker image
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
cp -r ../server/config/www www

docker build -t jazz_ref_stable .
docker login

docker tag jazz_ref_stable kaalam/jazz_neat:0.5.3
docker push kaalam/jazz_neat:0.5.3

rm jazz
rm jazz_config.ini
rm -rf www
```

Use this to run the image you just created.

```bash
docker run -p8888:8888 kaalam/jazz_neat:0.5.3
```

You can use this to run the docker image in debug mode (allowing login into the Linux image).

```bash
docker run -p8888:8888 -ti kaalam/jazz_neat:0.5.3 /bin/bash
```

This example (implicitly) refers to a Dockerfile to tell Docker how to build the image. Note that as Jazz's requirements have grown,
the dockerfile has become longer, especially, because there is no simple `apt-get` installation of `zeroMQ`. It contains the sources of
zeroMQ, install development tools, compiles it and install it.


```docker
FROM ubuntu

LABEL author=kaalam.ai

WORKDIR /home/jazz

COPY zeromq-4.3.4.tar.gz /home/jazz

RUN tar -xvf zeromq-4.3.4.tar.gz
RUN apt-get update --fix-missing
RUN apt-get install -y libmicrohttpd-dev
RUN apt-get install -y libcurl4-gnutls-dev

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y g++
RUN apt-get install -y make
RUN apt-get install -y xutils-dev
RUN apt-get install -y libtool
RUN apt-get install -y automake
RUN apt-get install -y pkg-config

WORKDIR /home/jazz/zeromq-4.3.4

RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
RUN ln -s /usr/local/lib/libzmq.so.5 /usr/lib/x86_64-linux-gnu/

WORKDIR /home/jazz

RUN mkdir /home/jazz/jazz_dbg_mdb

ADD ./start.sh /home/jazz
ADD ./jazz /home/jazz
ADD ./jazz_config.ini /home/jazz/config/jazz_config.ini
ADD ./www /home/jazz/config/www/

EXPOSE 8899

CMD ["/home/jazz/start.sh"]
```

{% include tip.html content="All this files can be found in the `/docker` folder of the Jazz repository." %}

The start.sh file is found in the docker folder, but it's just a call to `jazz start`.

{% include important.html content="The previous example does not include loading anything into the Jazz server. For a more realistic
application, you should develop using a development server. Then, persist the state of the JazzSource object containing all the magic
and make a copy of that file into your Docker image. To tell Jazz to open that JazzSource, you can simply use the http interface.
Even if the JazzSource is on the server, you have to open it to make the server learn all the urls in order to have your application
working." %}

<br/>

{% include links.html %}
