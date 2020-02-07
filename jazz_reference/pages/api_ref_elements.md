---
title: API elements
summary: An explanation of the basic parts of an API call (common to all clients).
sidebar: mydoc_sidebar
permalink: api_ref_elements.html
---

## API elements

{% include important.html content="In version 0.4.1 the API has been redesigned. Details will be updated. This page contains parts of previous specification that have not changed, but is not a complete specification anymore." %}


### `lvalue` and `rvalue`

Take their names from formal language theory. They are the parts of an assignment. The left of the `=` operator is what "is assigned to" is the `lvalue` and the right what "is evaluated" is the `rvalue`.


### REST predicates

<span class="label label-info">REST API</span>

The REST API supports **standard http commands**.

* **GET** with a valid `rvalue`. To read from Jazz.
* **HEAD** with a valid `rvalue`. Internally the same as GET, but returns the header only.
* **PUT** with a valid `lvalue`. To write blocks into a Jazz keepr.
* **DELETE** with a valid `lvalue`. To delete blocks or containers (at any level of the tree).
* **OPTIONS** with a string. Parses the string and returns the commands that would accept that string as a URL.
* **GET** with `lvalue`=`rvalue`. Assignment in the server. Similar to "PUT(lvalue, GET(rvalue))" without traffic.

There is no support for POST or TRACE, any functions other than those mentioned return an error.

Compression is not supported for now. (Will probably change.)

CACHE HEADERS are not supported for now. (Will probably change.)

{% include tip.html content="All reads are safe, all writes are idempotent." %}


### Block names

A block name is a sequence of case-sensitive alphanumeric characters or underscores of maximum length MAX_BLOCK_ID_LENGTH - 1 (actually 31)
starting with a letter.

The regex REGEX_VALIDATE_BLOCK_ID validates a block identifier.


### Block attributes

In some `http` cases, when attributes are relevant to the protocol, they are automatically converted to mime types and urls. In all cases,
attributes of a block can be read using the function get_attributes() and written with set_attributes(). These functions exist
in all APIs.


### Anchor keepers

Three special characters are used to root all blocks in Jazz.

| Character | Name | Description |
|-----------|------|-------------|
| `/` | local root | Is the root keeper of the current node (the only node if a Jazz cluster isn't defined). |
| `@` | forward | Requires forwarding to the appropriate node in the cluster. All `@` requests are transformed to `/` on some node. |
| `$` | ubiquitous | If reading, the resource is everywhere in the cluster like the cluster definition itself or the standard core. If writing, it is broadcasted to the whole cluster. |


## Operators

| Operator | Override | Description |
|-----------|------|-------------|
| `.` | NO | Defines the right argument belonging to the keeper on the left. Is **not** used after `/`, `@` and `$`. E.g., `/fraud.indices.bl001` should be read as: `bl001` is in `indices` which is in `fraud` which is in `/` (local root). |
| `=` | NO | Assignment. |
| `+`, `-`, `*`, `/`, `^` | NO | Arithmetic operators. Defined on numbers only. The `^` has an alternative form, `:pow:` that should be used in urls. |
| `&`, `:and:` | NO | Logic `and` operator (any of the two). |
| `|`, `:or:` | NO | Logic `or` operator (any of the two). The vertical `|` version should not be used in a url. |
| `!`, `:not:` | NO | Logic `negation` operator. |
| `:xor:` | NO | Logic `xor` operator. |
| `:`*name*`:` | YES | User defined operator. In an operator, *name* can only contain lowercase letters avoiding the reserved names in this table. |


### R API

<span class="label label-info">R</span>

The new design goes back to the original concept of `C++` and `http`. An R package to manage the `http` client will still be included.

{% include tip.html content="The R package **rjazz** also includes built-in http client support to use the REST API from R." %}

<br/>

{% include links.html %}
