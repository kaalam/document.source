---
title: API reference - Introduction
summary: An introduction to the API basics and the ToC.
sidebar: mydoc_sidebar
permalink: api_ref_intro.html
---

## API introduction: the different APIs

{% include important.html content="Jazz is still under development to produce the first Minimum Viable Product (MVP) after the original 0.1.7.
This is incomplete, but what is here is up to date." %}

### How it works (brief intro)

Jazz is designed for performance. It is a server that can use as much CPU and RAM as available with near 100% efficiency serving thousands
of concurrent API calls. This comes with some strict architectural decisions that are better kept in mind to understand how the APIs work.
Blocks, which are everything (data, metadata, indices, code, etc.), and are possibly persisted, are just binary movable structures
(structures that do not contain pointers). Most things (everything except Columns and Tables) are made of just one Block.

{% include note.html content="<b>First thing</b>: Blocks cannot allocate RAM. Only Services can. In our case, <b>Containers</b>, which are
Services allocate RAM!" %}

Note that even simple operations like slicing a block as `my_block[1,2,3]` require converting the string `[1,2,3]` into a (one shot) block
and using that block to select rows inside `my_block`, the result being another block. This block needs some RAM allocation and only a
Container can do that.

So unless you are using the C++ API only (which works as you probably expect), the petitions you are doing to blocks are served by one or
more containers and put together by a special API Service.

{% include note.html content="What looks to the user like a method of a block, is called <b>a contract</b> and it is computed
inside a Service. The reason behind the word contract is, all Block descendants are entitled to provide the same service, with the same
name and coherent behavior. Besides block contracts, Services have contracts too." %}

See more details [here](api_ref_modules_.html)

### The C++ API

The C++ API is designed, for the moment, to just merge the source code in another project, using the three different namespaces, each one
containing the previous ones.

- **jazz_elements** (all the pieces: blocks, tuples, storage, fluxes, communication, services, ...)
- **jazz_bebop** (everything to create bebop code, run it and expand Formal Fields)
- **jazz_agency** (agency as graphs of fields)

See technical documentation [here](/develop/)

### The Bebop API

{% include important.html content="Bebop implementation in C++ will start with Jazz version 0.6.x. For the moment, consider the bebop API
just like the current http API without the restrictions of http predicates and with function calls. Functions are just Blocks and
function arguments are Tuples." %}

### The http API

The http API is what this documentation is about. It has two parts, one http specific (http predicates and encoding specifics) and a
general syntax of queries with is defined by its parts (names, locators, constants, slicing and contracts). Before that, it is important
to read how the different modules fit together and what the different APIS /, // and /// are.

### Python and R APIs

To focus on the important parts and advance AI research without the overhead of creating tools we do not need, Jazz dropped the
implementation of native R and Python packages that existed in Jazz 0.2x. The native APIs (c++ and Bebop) are orders of magnitude more
efficient than anything that can be implemented in scripting languages. Nevertheless, both projects (rjazz and pyjazz) will be converted
(by the end of 0.5.xx, before 0.6.1) into http clients that provide the minimum functionality (API calls exchanging data serialized as
JSON) as clients of a Jazz server.

Ideally, both projects find enough traction to be taken over by groups with some stake in them and become more that just minimum
functionality clients. Ideally, also a Javascript client joins the project someday.

<br/>

See also:

* [How modules work to serve API calls](api_ref_modules_.html)
* [http API](api_ref_http_api.html)
* [Names](api_ref_names.html)
* [Locators](api_ref_locators.html)
* [Constants](api_ref_const.html)
* [Slicing](api_ref_slicing.html)
* [Contracts](api_ref_contracts.html)

<br/>

{% include links.html %}
