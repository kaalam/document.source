---
title: APIs, Jazz as a server or a package
summary: What is Jazz (part 5) Introducing the Jazz API model as a server and from the clients.
sidebar: mydoc_sidebar
permalink: vision_apis_http.html
---

{% include callout.html content="And finally, **the API**. Thanks for reading this far !!" %}
{% include note.html content="The API is a **keepr** named **/** (root in Unix) where all the keeprs and blocks are linked." %}

## APIs

{% include important.html content="In version 0.4.1 the API has been redesigned. Details will be updated." %}

### REST

<span class="label label-info">REST API</span>

The REST API supports **standard http commands**.

* **GET** with a valid **rvalue**. To read from Jazz.
* **HEAD** with a valid **rvalue**. Internally the same as GET, but returns the header only.
* **PUT** with a valid **lvalue**. To write blocks into a Jazz keepr.
* **DELETE** with a valid **lvalue**. To delete blocks or keeprs (at any level of the tree).
* **OPTIONS** with a string. Parses the string and returns the commands that would accept that string as a URL.
* **GET** with **lvalue=rvalue**. Assignment in the server. Similar to "PUT(lvalue, GET(rvalue))" without traffic.

There is no support for POST or TRACE, any functions other than those mentioned return an error.

### R API

<span class="label label-info">R</span>

{% include tip.html content="The R package **rjazz** also includes built-in http client support to use the REST API from R." %}

<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [Bebop](vision_bop_fields_contexts.html) | | | | | [Jazz today](using_jazz_today.html) |

{% include links.html %}
