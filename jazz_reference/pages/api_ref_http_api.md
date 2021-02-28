---
title: API reference - The http API
summary: Http API operation
sidebar: mydoc_sidebar
permalink: api_ref_http_api.html
---

{% include important.html content="Jazz is still under development to produce the first Minimum Viable Product (MVP) after the original 0.1.7.
This is incomplete, but what is here is up to date." %}

### REST predicates
<br/>

| <span class="label label-info">Next ...</span> |
| [API reference](api_ref_details.html) |



<span class="label label-info">REST API</span>

The REST API supports **standard http commands**.

* **GET** with a valid `rvalue`. To read from Jazz.
* **HEAD** with a valid `rvalue`. Internally the same as GET, but returns the header only.
* **PUT** with a valid `lvalue`. To write blocks into a Jazz keepr.
* **DELETE** with a valid `lvalue`. To delete blocks or containers (at any level of the tree).
* **OPTIONS** with a string. Parses the string and returns the commands that would accept that string as a URL.
* **HEAD** with `lvalue`=`rvalue`. Assignment in the server. Similar to "PUT(lvalue, GET(rvalue))" without traffic.

#### Limitations in version 0.5.x

  * No support for POST or TRACE.
  * Compression is not supported.
  * CACHE HEADERS are not supported.

{% include tip.html content="All reads are safe, all writes are idempotent." %}

<br/>

{% include links.html %}
