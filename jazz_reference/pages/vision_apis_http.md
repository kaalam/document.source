---
title: APIs, Jazz as a Server
summary: Introduces the Jazz API model as a server and from the clients.
sidebar: mydoc_sidebar
permalink: vision_apis_http.html
---

## APIs

And finally, **the API**. Thanks for reading this far! The API is a **keepr** named **/** (root in Unix) where all the keeprs and blocks
are linked.

The API is the same for all the languages including REST (where root is **//** since just one / is used in normal urls.)

Any API call can be seen as an assignment. In an assignment, X = Y there are two sides, the left side (X) called **lvalue** and the right
side (Y) called **rvalue**. This is C++ naming.

In Jazz an **lvalue** is one of:

* A chain of keeprs abstracted as block ids starting from root ending with the name of a block. They must all exist except, possibly, the last
name. If the last name is new, it is created, if it exists, overridden.
* A data block that will be returned as a Python object, R object or http (GET) resource.

In Jazz an **rvalue** is one of:

* A block constructor. A constant expression that can be used to build a block from it.
* Chains of keeprs abstracted as existing blocks starting from root. This includes functions and blocks passed as arguments to functions.
* A combination of the previous two.
* A data block that will be passed as a Python object, R object or http (PUT) resource.
* A delete predicate. This deletes the corresponding lvalue.

Since the API has to be REST compatible and is intended for using over a network.

* All rvalue evaluations are **safe**. They cannot have side effects. Function calls cannot have side effects.
* All lvalue assignments are **idempotent**. Assigning twice has the same effect than assigning once. There is no += operator.

Summarizing, there is **one API** not three (R, Python and REST), there are some differences that, for the moment, we will only mention at a
very high level.

### REST

The REST API supports **standard http commands**.

* **GET** with a valid **rvalue**. To read from Jazz.
* **HEAD** with a valid **rvalue**. Internally the same as GET, but returns the header only.
* **PUT** with a valid **lvalue**. To write blocks into a Jazz keepr.
* **DELETE** with a valid **lvalue**. To delete blocks or keeprs (even recursively).
* **OPTIONS** with a string. Parses the string and returns the commands that would accept that string as a URL.
* **GET** with **lvalue=rvalue**. Assignment in the server. Similar to "PUT(lvalue, GET(rvalue))" without traffic.

There is no support for POST or TRACE, any functions other than those mentioned return an error.

### R API

The R API has four methods:

* **jazz_get**(rvalue)
* **jazz_put**(object, lvalue)
* **jazz_delete**(lvalue)
* **jazz_assign**(lvalue, rvalue)

All methods return error codes, except jazz_get() which returns R vectors. R objects are limited to R core vectors, ergo not all the
possible complexity of Jazz types is directly readable or writable to R. It is possible to create complex Jazz objects by "assembling"
them from simple parts using Bebop functions written inside R. Since Jazz is accessible through files and the REST API, this is not a
serious limitation. Other R packages built on top of **rjazz** can make working inside R friendlier.

The R package **rjazz** also includes built-in http client support to use the REST API from R.

### Python API

The Python API is identical to the R API:

* **jazz_get**(rvalue)
* **jazz_put**(object, lvalue)
* **jazz_delete**(lvalue)
* **jazz_assign**(lvalue, rvalue)

Same as before, objects are Python vectors, not numpy or Pandas objects, so similar limitations apply.

Unlike the R package, the Python package does not include an http client, but the Python standard library does and also includes enough
serializing functionality to use the REST API from Python seamlessly.

Again, anything can be created in Bebop, a Bebop function can be a Python string so working with Jazz can be straightforward, but making
it **Pythonic** may require other packages built on top of **pyjazz**.

{% include links.html %}
