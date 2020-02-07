---
title: Jazz (LSS) Latest Stable Server
summary: Where can I find the latest Jazz server?
sidebar: mydoc_sidebar
permalink: reference_docker_latest_server.html
---

{% include callout.html content="**Jazz à la carte** is intended to be a series of Jazz servers maintained as Docker images through
continuous integration including such things as \"voice recognition\", \"text to speech\", etc. For the moment, the neat LSS is the only
member." %}
{% include tip.html content="**kaalam** maintains an updated Jazz server (without any application) in Docker Hub." %}

## How to check for the latest version?

Follow [this link](https://hub.docker.com/r/kaalam/jazz_neat/tags/) and note the version number.

## How to run it

Using the right version number, and assuming you have docker installed, type:

  docker run -p8888:8888 kaalam/jazz_neat:0.2.1.99

## Can I build applications on top of it?

Yes. That is the intention. Just start your Dockerfile with:

```docker
FROM kaalam/jazz_neat:latest

```

<br/>

{% include links.html %}
