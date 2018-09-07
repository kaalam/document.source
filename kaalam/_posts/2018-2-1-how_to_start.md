---
layout: post
title: How Can I Start Using Jazz?
description: Jazz world
image: assets/images/pic04.jpg
---

<h2>How to start?</h2>

If you are not a developer, but do know how to run a docker image, you may have a look at the demos in [Jazz à la carte](https://kaalam.github.io/jazz_reference/docker_jazz_a_la_carte.html).

If you want to try R or Python, you don't need a server to practice. In the case of Jazz, "client" is a little bit of a misnomer
since it can be used to connect to a (REST) server, but it also includes the Jazz platform and can be used to do everything Jazz
can do locally. You do need a server in each node to use Jazz in a distributed way.

You can try the R client, by just installing the rjazz package as explained in [R walkthrough](https://kaalam.github.io/jazz_reference/rjazz_walkthough_client_only.html).

You can try the Python client, by just installing the pyjazz package as explained in [Python walkthrough](https://kaalam.github.io/jazz_reference/pyjazz_walkthough_client_only.html).

If you need a server, you can [compile it from source](https://kaalam.github.io/jazz_reference/setup_compiling_from_source.html) or run a docker image of [the latest stable reference server](https://kaalam.github.io/jazz_reference/docker_last_stable_reference.html).

If you are a front-end developer and want to use Jazz creating everything from just the REST API, lucky you, that is also possible. What you need is, once you have a running server, [REST API how to](https://kaalam.github.io/jazz_reference/rest_api_how_to.html) and [the Jazz REST API reference](https://kaalam.github.io/jazz_reference/rest_reference.html).

If you want to set up a cluster, you can follow [setting up a Jazz cluster](https://kaalam.github.io/jazz_reference/setup_cluster.html).
