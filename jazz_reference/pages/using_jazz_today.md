---
title: What is the usable part of Jazz today?
summary: Some clues about what is complete, under development and to be done.
sidebar: mydoc_sidebar
permalink: using_jazz_today.html
---

## What is complete?

This page is a snapshot of the current state of development in terms of Jazz modules. It is updated after the completion (meaning
implementation, documentation and testing) of modules and the percentages of executions are rough estimates, except for complete. The
details of development are updated in the [developer's reference](/develop/)

{% include image.html file="jazz_modules.png" caption="Jazz modules" max-width=880 %}

| Group | Module | Description | Complete |
|-------|--------|-------------|----------|
| elements | jazz_datablocks | Block types and fundamental definitions (C++ interface) | <span class="label label-success">100%</span> |
| elements | jazz_utils | Many utilities to support configuration, logging, etc. | <span class="label label-success">100%</span> |
| elements | jazz_containers | All the fundamental (non persisted) keepers. | <span class="label label-success">100%</span> |
| main | jazz_instances | Instantiation of the classes for the server and the clients. | <span class="label label-success">100%</span> |
| main | jazz_main | Http server implementation. | <span class="label label-success">100%</span> |

## What is still refactoring from Jazz 0.3.x?

These modules include code that supports most or all the necessary functionality, but still requires refactoring to the new structures.

| Group | Module | Description | Complete |
|-------|--------|-------------|----------|
| elements | jazz_persistence | The fundamental persisted keepers. | <span class="label label-info">80%</span> |
| main | jazz_restapi | The implementation of the http responses at server level. | <span class="label label-info">60%</span> |

## What is under development?

| Group | Module | Description | Complete |
|-------|--------|-------------|----------|
| elements | jazz_classes | An interface simplifying the keeprs for the high level APIs. | <span class="label label-warning">60%</span> |
| elements | jazz_httpclient | Petitions across a Jazz cluster (Jazz calling Jazz). | <span class="label label-warning">40%</span> |
| elements | jazz_stdcore | Arithmetic and logic functions on tensors. | <span class="label label-warning">20%</span> |
| functional | jazz_api | The common part of all (high level) APIs. | <span class="label label-warning">60%</span> |

## What is to be done?

| Group | Module | Description | Complete |
|-------|--------|-------------|----------|
| functional | jazz_cluster | Classes related with Jazz clusters. | <span class="label label-danger">5%</span> |
| functional | jazz_filesystem | A class implementing distributed collections of files. | <span class="label label-danger">5%</span> |
| functional | jazz_column | Distributed (replicated) data columns of tensors. | <span class="label label-danger">5%</span> |
| functional | jazz_dataframe | Distributed (replicated) list of data columns. | <span class="label label-danger">5%</span> |
| functional | jazz_bebop | Extending the standard core with oop and support for automation. | <span class="label label-danger">5%</span> |

## What can I try out from Jazz 0.4+?

{% include important.html content="Jazz is still under development to create the first Jazz 0.4.1 MVP. There is no PoC for the latest
version." %}

## What can I try out from Jazz 0.2+ & 0.3+?

{% include important.html content="Versions 0.2.x and 0.3.x are deprecated." %}

## What can I try out from Jazz 0.1.7?

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

{% include links.html %}
