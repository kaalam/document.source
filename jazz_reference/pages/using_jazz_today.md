---
title: What is the usable part of Jazz today?
summary: Some clues about what is complete, under development and to be done
sidebar: mydoc_sidebar
permalink: using_jazz_today.html
---

{% include image.html file="jazz_modules.png" caption="Jazz modules for version 0.6.x" max-width=880 %}


## Jazz 0.5.3: The Tangle Server

The last 0.5.x series version is the fist real world application of the modern Jazz versions. It contains **The Tangle**
a curated entangled dataset of English language.

In 40 Gb of text, it contains many important English datasets that can be navigated at high speed (millions of jumps per seconds
per thread) built on top of Jazz. It is the present and future of Jazz development. All the data provisioning processes are fully
automated.

It will be maintained and used as the base of **our language as code** approach to AI.


### The reason to create The Tangle: Building on the Shoulders of Linguists

{% include image.html file="tangle_motive.png" caption="Join the team" %}


### Some links:

  * The tangle [poster](https://raw.githubusercontent.com/kaalam/kaalam/master/the_tangle.pdf)
  * Presentation [slides](https://www.slideshare.net/SantiagoBasalda/slsp-2021)
  * How to [run it](reference_docker_tangle_server.html)


## What is complete (Jazz 0.5.2)?

This page is a snapshot of the current state of development in terms of Jazz modules. It is updated after the completion (meaning
implementation, documentation and testing) of modules and the percentages of executions are rough estimates, except for complete. The
details of development are updated in the [developer's reference](/develop/)

| Group | Module | Description | Complete |
|-------|--------|-------------|----------|
| elements | types | Block types and fundamental definitions (C++ interface) | <span class="label label-success">100%</span> |
| elements | utils | Miscellaneous utilities including config and log (C++ interface) | <span class="label label-success">100%</span> |
| elements | block | All Block (Tensor and Index) implementation (C++ interface) | <span class="label label-success">100%</span> |
| elements | kind | All Kind implementation (C++ interface) | <span class="label label-success">100%</span> |
| elements | tuple | All Tuple implementation (C++ interface) (C++ interface) | <span class="label label-success">100%</span> |
| elements | container | The ancestor of all Containers (C++ interface) | <span class="label label-success">100%</span> |
| elements | channel | All the Channels (a Container) (C++ interface) | <span class="label label-success">100%</span> |
| elements | volatile | A container including all structures in RAM (C++ interface) | <span class="label label-success">100%</span> |
| elements | persisted | A container including all persisted structures (C++ interface) | <span class="label label-success">100%</span> |
| main | api | The implementation of the http responses at server level. | <span class="label label-success">100%</span> |
| main | server | Http server specifics. | <span class="label label-success">100%</span> |
| main | instances | Instantiation of the classes for the server and the clients. | <span class="label label-success">100%</span> |
| main | main | Http server implementation. | <span class="label label-success">100%</span> |


## What is still refactoring from Jazz 0.3.x?

Nothing.


## What is under development?

| Group | Module | Description | Complete |
|-------|--------|-------------|----------|
| bebop | core | The logic to run code. | <span class="label label-warning">30%</span> |
| bebop | field | The higher level organization as languages. | <span class="label label-warning">20%</span> |


## What is to be done?

| Group | Module | Description | Complete |
|-------|--------|-------------|----------|
| agency | agency | Automating code generation. | <span class="label label-danger">5%</span> |


## What can I try out from the original Jazz 0.1.7?

You can run a Jazz 0.1.7 server (still implemented as legacy in Jazz 0.2.x) using Docker from Docker Hub.

```bash
docker run -p8888:8888 kaalam/jazz_neat:0.2.1.99
```

Check [docker hub](https://hub.docker.com/r/kaalam/jazz_neat/tags/) to find the name of the latest image.

Point a browser to http://localhost:8888/// to see if the server is running, you should get a page similar to

    Jazz

     version : 0.1.07
     build   : RELEASE
     artifact: Ubuntu_04.1
     myname  : Jazz1
     sysname : Linux
     hostname: j424x4
     kernel  : 4.15.0-36-generic
     sysvers : #39-Ubuntu SMP Mon Sep 24 16:19:09 UTC 2018
     machine : x86_64

You can install the R package from CRAN ...

```R
install.packages('rjazz')
```

... and play with some example (Edit the line with set_jazz_host() as necessary.)
```R
set_jazz_host('127.0.0.1:8888')
page <- '<html>\n<body>\n<br/>Hello world!\n</body>\n</html>'
create_web_resource('my_test',
                    '/my_test/hello.html',
                    type_const[['BLOCKTYPE_RAW_MIME_HTML']],
                    page)
# See http://127.0.0.1:8888/my_test/hello.html with a browser.

list_web_sources()
delete_web_source('my_test')
set_jazz_host(host)
```


## A real world use of Jazz as an http server

The manual you are just reading, Jazz's developer's website, kaalam's website, the package reference and more are developed using Jazz
as the development server. You can find the source code of the automation on github.

{% include note.html content="The website automation is intended of internal use even if it is OSS. There is no support for it, but if
you feel comfortable with R, you can probably make it work or ping the author." %}

<br/>

{% include links.html %}
