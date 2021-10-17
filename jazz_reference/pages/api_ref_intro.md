---
title: API reference - Introduction
summary: An introduction to the API basics
sidebar: mydoc_sidebar
permalink: api_ref_intro.html
---

## How it works (short intro)

Jazz is designed for performance. It is a server that can use as much CPU and RAM as available with near 100% efficiency serving thousands
of concurrent API calls. This comes with some strict architectural decisions that are better kept in mind to understand how the APIs work.
Blocks, which are everything (data, metadata, indices, code, etc.), and are possibly persisted, are just binary movable structures
(structures that do not contain pointers). Most things are made of just one Block.

{% include note.html content="<b>First thing</b>: Blocks cannot allocate RAM. Only Services can. In our case, <b>Containers</b>, which are
Services allocate RAM!" %}

Note that even simple operations like slicing a block as `/lmdb/my_table/my_block[&[1,2,3]]` requires converting the string `[1,2,3]` into
a (one shot) block and using that block to select rows inside `/lmdb/my_table/my_block`, the result being another block. This block needs
some RAM allocation and only a Container can do that.

When you are using the C++ API you talk to the Containers directly. Via http the petitions you are doing to blocks are served by one or
more containers and put together by a special `API` Service, which is also a `Container`.

## The different APIs

### The C++ API

The C++ API is designed, for the moment, to just merge the source code in another project, using the three different namespaces, each one
containing the previous ones.

- **jazz_elements** (all the pieces: blocks, tuples, storage, fluxes, communication, services, ...)
- **jazz_bebop** (everything to create bebop code, run it and expand Formal Fields)
- **jazz_agency** (agency as automating code generation over graphs of fields)

See technical documentation [here](/develop/)

### The Bebop API

{% include important.html content="Bebop, of course, also has access to the API. This is under current implementation in Jazz 0.6.x." %}

### The http API

The http API is what this documentation is about. It has two parts, one defining general ideas: http commands, constants, slicing, function
calls, assignment and attributes. The second part is dedicated to describing the operation of each of the `bases` in each of the Containers.

### Python and R APIs

To focus on the important parts and advance AI research without the overhead of creating tools we do not need, Jazz dropped the
implementation of native R and Python packages that existed in Jazz 0.2x. The native APIs (c++ and Bebop) are orders of magnitude more
efficient than anything that can be implemented in scripting languages.

With the release of The Tangle (a docker image of Jazz 0.5.2 containing large curated NLP datasets). A python http client is provided, but
it is just intended to serve as an example on how to access Jazz from Python to be extended by the user, it does not cover most of the
functions.

<br/>

{% include links.html %}
