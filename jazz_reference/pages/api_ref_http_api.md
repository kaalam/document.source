---
title: API reference - The http API
summary: Http operation supported
sidebar: mydoc_sidebar
permalink: api_ref_http_api.html
---

## HTTP considerations

HTTP-wise, the protocol is very simple. This page describes the basic http model.

### HTTP predicates

The REST API supports **standard http commands**.

  * **GET** with a valid `R-value`. To read from Jazz.
  * **HEAD** with a valid `R-value`. Internally the same as GET, but returns the header only.
  * **PUT** with a valid `L-value`. To write blocks into a Jazz container.
  * **DELETE** with a valid `L-value`. To delete blocks or containers (at any level of the tree).
  * **OPTIONS** with a string. Parses the string and returns the http predicates that would accept that string as a query.
  * Assignment calls (calls doing `L-value = R-value` ) are **GET** calls returning just an answer (some status code).

Basically, you should understand that all calls are either GET, PUT or DELETE (HEAD being a wrapper over GET and OPTIONS a "thing" the API
just tries to parse and if the syntax is correct, it includes the predicate.)

In the rest of this reference, we will use GET, PUT or DELETE upper case to mean http predicates (and get(), put() and remove() for
`Container` methods).

### HTTP error codes

Jazz tries to get most http error codes work as canonically as possible. The internal information about errors is much richer. Many
error conditions are logged. The verbosity of the logs also depends on the Jazz compilation (release of debug). The logger output is
defined in the configuration. The C++ API also has a much richer set of return codes. In general, the http code should make it easy
to differentiate between malformed calls HTTP_BAD_REQUEST, wrong predicates HTTP_NOT_ACCEPTABLE, inexistent resources HTTP_NOT_FOUND,
lack of authorization HTTP_UNAUTHORIZED or HTTP_FORBIDDEN, failed forwards across the cluster HTTP_BAD_GATEWAY, internal problems e.g.,
HTTP_INSUFFICIENT_STORAGE, etc. [List of HTTP status codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes).

### Things not supported

  * No support for **POST** or **TRACE**.
  * Compression is not supported.
  * CACHE HEADERS are not supported.

{% include tip.html content="All reads are safe, all writes are idempotent." %}

<br/>

{% include links.html %}
