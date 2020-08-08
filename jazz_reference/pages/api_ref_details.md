---
title: API details
summary: The precise API implementation details, syntax, encoding, etc.
sidebar: mydoc_sidebar
permalink: api_ref_details.html
---

## API reference

{% include important.html content="In version 0.4.1 the API has been redesigned. This is updated frequently." %}


### REST predicates

<span class="label label-info">REST API</span>

The REST API supports **standard http commands**.

* **GET** with a valid `rvalue`. To read from Jazz.
* **HEAD** with a valid `rvalue`. Internally the same as GET, but returns the header only.
* **PUT** with a valid `lvalue`. To write blocks into a Jazz keepr.
* **DELETE** with a valid `lvalue`. To delete blocks or containers (at any level of the tree).
* **OPTIONS** with a string. Parses the string and returns the commands that would accept that string as a URL.
* **HEAD** with `lvalue`=`rvalue`. Assignment in the server. Similar to "PUT(lvalue, GET(rvalue))" without traffic.

#### Limitations in version 0.4.x

  * No support for POST or TRACE.
  * Compression is not supported.
  * CACHE HEADERS are not supported.

{% include tip.html content="All reads are safe, all writes are idempotent." %}


### Anchors

Three special characters (the anchor) start every `lvalue` and `rvalue`.

| Character | Name | Description |
|-----------|------|-------------|
| `/` | local root | Is the root container of the current node (the only node if a Jazz cluster isn't defined). |
| `@` | forward | Requires forwarding to the appropriate node in the cluster. All `@` requests are transformed to `/` of some node. |
| `$` | ubiquitous | If reading, the resource is everywhere in the cluster (like the cluster definition itself). If writing, it is broadcasted to the whole cluster. |


### Block names

A block name is a sequence of case-sensitive alphanumeric characters or underscores of maximum length MAX_BLOCK_ID_LENGTH - 1 (actually 31)
starting with a letter.

The regex REGEX_VALIDATE_BLOCK_ID validates a block identifier.

## R API

<span class="label label-info">R</span>

The new design goes back to the original concept of `C++` and `http`. An R package to manage the `http` client will still be included.

{% include tip.html content="The R package **rjazz** also includes built-in http client support to use the REST API from R." %}

<br/>

| <span class="label label-default">Previous ...</span> |
| [API introduction](api_ref_intro.html) |

{% include links.html %}
