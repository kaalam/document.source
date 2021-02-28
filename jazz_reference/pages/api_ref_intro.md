---
title: API reference - Introduction
summary: An introduction to the API basics, storage details, function calls and the http REST API.
sidebar: mydoc_sidebar
permalink: api_ref_intro.html
---

{% include important.html content="In version 0.5+ the API is full redesigned. This frequently updated document is the reference
on what is currently being implemented." %}

## API introduction: the different APIs

### The C++ API

Direct linking of C++ objects into scripting languages has been abandoned. Now Jazz is a C++ framework that can be (and usually is)
implemented as an http server. You can use any of the levels of the C++ framework (jazz_elements, jazz_bebop and jazz_agency) that
exist below the http server and create unlimited Jazz applications. This is the C++ API. The reference are the methods of the main
classes as found in the [programming documentation ](develop_jazz02/index.html).

### The BEAT API

The classes used to handle data and code, are `Block`, `Tuple`, `Kind` and `Field`. They all inherit from `Block`, so we will
refer to them generically as blocks. Blocks require some `Container` (which is a `Service`) to keep them. At the minimum, they will be
just memory blocks allocated by a service. The four services providing different functionality: allocation, persistence, networking and
streaming are known respectively as: `Volatile`, `Persisted`, `Cluster` and `Flux`. They all inherit from the one to their left, so the
service `Flux` can provide the whole block management API.

The http server has an instance of a `Flux` object known as `BEAT` (Capitalized since it is a global variable in the C++ server).

The BEAT API contains everything required to create, (complete or partial) read, (complete or partial) update and delete blocks of data
and code. It does not include running, linking nor compiling opcodes or Bebop functions.

#### Using BEAT in Bebop


#### Using BEAT from the REST API

blocks ()


### The REST API

<br/>

| <span class="label label-info">Next ...</span> |
| [API reference](api_ref_details.html) |

{% include links.html %}
