---
title: Jazz (LSS) Latest Stable Server
summary: Where can I find the latest Jazz server?
sidebar: mydoc_sidebar
permalink: reference_docker_latest_server.html
---

{% include callout.html content="**Jazz à la carte** is intended to be a series of Jazz servers maintained as Docker images through
continuous integration including such things as \"voice recognition\", \"text to speech\", etc. For the moment, the neat LSS and The
Tangle server are the only members." %}
{% include tip.html content="**kaalam** maintains an updated Jazz server (without any application) in Docker Hub." %}

## How to check for the latest version?

Follow [this link](https://hub.docker.com/r/kaalam/jazz_lss/tags) and note the version number.

## How to run it

Using the right version number, and assuming you have docker installed, type:

```bash
  docker run -p8899:8899 kaalam/jazz_lss:0.5.3
```

## Can I build applications on top of it?

No. Use [this](reference_docker_base_dockerfile.html) instead.


<br/>

{% include links.html %}
