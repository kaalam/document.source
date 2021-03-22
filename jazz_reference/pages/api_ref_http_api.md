---
title: API reference - The http API
summary: Http API operation
sidebar: mydoc_sidebar
permalink: api_ref_http_api.html
---

## HTTP considerations

HTTP-wise, the protocol is very simple. This page describes the basic http model. Wherever syntax are discussed, what http predicate apply
will also be described.

### HTTP predicates

The REST API supports **standard http commands**.

  * **GET** with a valid `R-value`. To read from Jazz.
  * **HEAD** with a valid `R-value`. Internally the same as GET, but returns the header only.
  * **PUT** with a valid `L-value`. To write blocks into a Jazz container.
  * **DELETE** with a valid `L-value`. To delete blocks or containers (at any level of the tree).
  * **OPTIONS** with a string. Parses the string and returns the http predicates that would accept that string as a query.
  * Assignment calls (calls doing `L-value = R-value` ) are **GET** calls returning just an answer (some status code).

### Limitations in version 0.5.x

  * No support for **POST** or **TRACE**.
  * Compression is not supported.
  * CACHE HEADERS are not supported.

{% include tip.html content="All reads are safe, all writes are idempotent." %}

<br/>

{% include links.html %}
