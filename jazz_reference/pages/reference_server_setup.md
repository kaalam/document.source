---
title: Server internals and setup
summary: Some extra materials for Jazz developers besides the doxygen website with some explanations and references
sidebar: mydoc_sidebar
permalink: reference_server_setup.html
---

## Jazz internals

Jazz internals is meant as: **How do I start if I want to use the source code in a C++ project?**

{% include important.html content="We are not yet providing examples on extending Jazz in C++." %}

Instead, you should see the [development documentation](/develop/).


## Setting up a Jazz server

{% include note.html content="This page does not include experience with different environments and settings. Please, help us
improving it by providing [feedback](contributing_welcome_all.html)" %}


### Building and installing Jazz

First you should build Jazz as described [here](using_compile_jazz.html). Then, run `make install` to install it as a service.
That requires being a sudoer.

### Configuring

The server configuration is stored in `config/jazz_config.ini`. The file is later copied to `/etc/jazz-server/config/` when Jazz is
installed via `make install`. Edit the former file for a change applicable to all nodes, the latter to configure just the current node.
The file is self explanatory both about edition procedures and about the function of each variable.

You may need additional reference found at:

 * [LMDB](http://www.lmdb.tech/doc/)
 * [libmicrohttpd](https://www.gnu.org/software/libmicrohttpd/manual/libmicrohttpd.html)
 * [CURL](https://curl.se/libcurl/c/libcurl-tutorial.html)
 * [ZeroMQ](https://zeromq.org/languages/c/)
 * [Catch2](https://github.com/catchorg/Catch2/blob/devel/docs/Readme.md#top)

<br/>

{% include links.html %}
