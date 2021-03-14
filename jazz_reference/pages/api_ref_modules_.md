---
title: API reference - How it works
summary: API terminology and how the different services work to serve API calls and how it works in Bebop and C++.
sidebar: mydoc_sidebar
permalink: api_ref_modules_.html
---

{% include important.html content="Jazz is still under development to produce the first Minimum Viable Product (MVP) after the original 0.1.7.
This is incomplete, but what is here is up to date." %}

## The different APIS /, // and ///

### The / API

The / API refers to the storage in Jazz of static objects used to build webpages. It is a standard http API supporting anything starting
with just one / after the host name: (E.g., `http://kaalam.ai/kaalam/). This Api just delivers static content via GET for convenience.

There are two ways to upload that content:

1. The content of the folder configured as STATIC_HTML_AT_START will be uploaded automatically. The mime type will be guessed from the
file extension.
2. Uploading a block (as raw binary) with the content to //static/ with the attributes BLOCK_ATTRIB_URL, BLOCK_ATTRIB_MIMETYPE and BLOCK_ATTRIB_LANGUAGE set to match the desired url.

### The /// API

Is not really a different API, it is just a call to the // API with an empty base. That call will be returned by the API object itself
returning things like: build versions, statistics, configuration settings, etc.

### The // API

Is the real http API for anything (GET, PUT, DELETE, OPTIONS, HEAD) with blocks, contracts, function calls and event handling.


## How modules fit together

### All the API is steered by an instance of the class Api

You can see how containers inherit each other [here](/develop_jazz02/classjazz__elements_1_1Container.html). There is one instance of
each of these services. The API is called by the http server's callback function and "distributes the game".

### API is a container

The API inherits from Container (which is the one shot container) and, therefore, can allocate one shot blocks (used in constant
conversion, etc.). Executing an API query has two parts, **parsing** and **executing** (getting, locking, unlocking, running a contract,
etc.). The API parses the queries and forwards the execution to the appropriate container. In the case of the `///` API, that container
is the API itself.

### How things are forwarded

There are two mechanisms by which a container is implicitly specified in an API query: **reserved contracts** and **reserved base names**.
Priority-wise, reserved contracts have higher priority. E.g., A function call will always be forwarded to **Bebop** and Bebop may use
reserved base names to locate the data.

There are only two reserved contracts: **function calls** and **event connections**. Function calls are identified by the enclosing
brackets `(` and `)`. Function calls are forwarded to `Bebop`. Event connections are identified by the `@` (connect), `!@` (disconnect)
and `?` (send a constant value into a connection) and forwarded to `Agency`.

Reserved base names can be found in this table. Anything that is not in the list of reserved names will be forwarded to `Persisted`
assuming it is a database name. The reserved names from `Persisted` are also database names, but those databases are special and managed
by the Jazz node.

Container | Reserved base names
--------- | ----------------------------------------------------------------
API | `<empty>` is the empty base name. As a consequence `///` calls are executed in the API itself.
Volatile | `deque`, `map`, `tree`, `queue`. <br/>E.g., (GET) `//deque.new("waiting_list")` <br/>followed by (PUT) `//deque/waiting_list.l_push([1,2])`
Persisted | `sys`, `group`, `kind`, `field`, `flux`, `agent` and `static`. Are special databases to keep system config and all the groups, kinds, fields, fluxes, agents and static http served objects.
Remote | `jazz_get` and `jazz_put` are the normal way to address sharded resources. <br/>`jazz_broadcast` is generated automatically to keep cluster level synchronization, <br/>`http_get` and `http_put` allow accessing REST APIs or resources outside the Jazz cluster.


## API terminology:

### Names

A name is a string of letters, numbers and underscores, starting with a letter, up to 31 characters long. Names are used to identify:
containers, sub-containers, blocks and contracts.

### Answers

An answer is a string (up to 4K characters long) built by the API to return, usually metadata. Some contracts return blocks, others
return answers. E.g., .as_json() will always return a block (of text) since the result may not fit in an answer. Metadata contracts like:
.columns(), .dimensions(), .size(), .type(), etc. always return answers.

### Locators

Locators are sequences of names identifying blocks, selections inside blocks, contracts, etc. Locators can be **L-values** (as the the left
part of an assignment statement) that identify a complete block only or **R-values** that identify a block and possibly some operations
that we want to apply to it (slicing, calling it as a function, serializing it as json, etc.)

### Constants

Constants are small (limited by the query size) blocks that we create for the purpose of the query, to pass as arguments to a function,
slice blocks, or even store as blocks.

### Slicing

Slicing is filtering parts of a block. We use the term block in its most general sense (since everything is a block). It can be selecting
rows from a tensor, fields from a tuple, columns from a table, etc. More than one slicing contracts. Slices **are contracts**, there is
just some syntactic sugar to write `a[4]` instead of `a.slice(new_block_from_constant(4))`.

### Contracts

Are similar to methods of an object. Blocks are not objects, they are just moveable data structures and, therefore, have no methods.
Something (either some block class or some container, that is irrelevant for the API) fulfills the contract of delivering what a method
would. E.g., .as_json()

### Function calls

Bebop function are just blocks. Function calls are (API-wise) contracts. As you probably expect, there is syntactic sugar involved
in the **only** use of round brackets in this API: `a(4)` rather than `a.call(new_block_from_constant(4))`. In Bebop, all functions
take a tuple as an argument and return a tuple. Since a tuple **is** a sequence of anything (including tuples), that is not a limitation.

### GET and HEAD calls

Are calls returning something (a block, or possibly an answer) from an **R-value**.

### PUT calls

Are calls assigning a block identified by an **L-value** from something uploaded, possibly involving a format change or setting attributes.

### Assignment calls

Are GET calls assigning a block identified by an **L-value** from an **R-value** without the data being communicated.

### Fluxes

Are endpoints for event driven data streaming. API-wise they are just tuples with specific item names to define the interface.

### Event handlers and agency

Agents are graphs of functions that connect to events in fluxes. API-wise the connection to agents will be done by reading/writing
in their fluxes, but there is also an agency interface to manually, connect `@`, disconnect `!@` and query `?` agents that will be
directed to the agency service.

<br/>

{% include links.html %}
