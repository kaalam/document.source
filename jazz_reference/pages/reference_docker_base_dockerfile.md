---
title: Jazz (BASE) Base Dockerfile
summary: How the image in which the others are based is processed
sidebar: mydoc_sidebar
permalink: reference_docker_base_dockerfile.html
---

{% include callout.html content="**Jazz à la carte** is intended to be a series of Jazz servers maintained as Docker images through
continuous integration including such things as \"voice recognition\", \"text to speech\", etc. For the moment, the neat LSS and The
Tangle server are the only members." %}
{% include tip.html content="**kaalam** maintains an updated Jazz server (without any application) in Docker Hub." %}


## What is this?

This is the base image that is used by all the other images. It is basically a complete server with all its dependencies that does not
expose any port, expect any mounted folder nor runs a starting script.

To use it, you can start your Dockerfile as:

```
FROM jazz_base_stable

 ... whatever you add here ...

EXPOSE 8899

CMD ["/home/jazz/start.sh"]
```

For `jazz_base_stable` to exist as a local image, you must have `git clone`-d the Jazz repository, configured successfully so that you
can [compile](using_compile_jazz.html), installed docker and run the `build_upload_all.sh` in the Jazz `docker` folder.




## How to check for the latest version?

Follow [this link](https://hub.docker.com/r/kaalam/jazz_base/tags) and note the version number.


<br/>

{% include links.html %}
