---
title: What simple Proof of Concept can I do using pre-built packages?
summary: Starting with Jazz (the simplest option) How to run a simple Proof of Concept using prebuilt binaries.
sidebar: mydoc_sidebar
permalink: starting_trying_out_poc.html
---

## Trying out Jazz 0.4+

{% include important.html content="Jazz is still under development to create the first Jazz 0.4.1 MVP. There is no PoC for the latest
version." %}

## Trying out Jazz 0.3+

{% include important.html content="Versions 0.2.x and 0.3.x are deprecated." %}

## Trying out Jazz 0.1.7

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
