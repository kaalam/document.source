---
title: APIs, Jazz as a server or a package
summary: What is Jazz (part 5) Introducing the Jazz API model as a server and from the clients.
sidebar: mydoc_sidebar
permalink: vision_apis_http.html
---

{% include callout.html content="And finally, **the API**. Thanks for reading this far !!" %}
{% include note.html content="The API is a **keepr** named **/** (root in Unix) where all the keeprs and blocks are linked." %}

{% include important.html content="Jazz can be used as a server, a cluster of servers or just an R or Python package. As packages, Jazz can
have its own resource allocation or even access the persistence of a running server." %}

## APIs

The API is the same for all the languages including REST (where root is **//** since just one / is used in normal urls.)

Any API call can be seen as an assignment. In an assignment, X = Y there are two sides, the left side (X) called **lvalue** and the right
side (Y) called **rvalue**. This is C++ naming.

<span class="label label-info">lvalue</span>

{% include tip.html content="You can view a **get** operation as an assignment to a new block that is returned via some API." %}

{% include callout.html content="In Jazz an **lvalue** is a chain of keeprs abstracted as block ids starting from root ending with the
name of a block. They must all exist except, possibly, the last one. This is a `set` assignment. Attributes `only_if_exists` and
`only_if_new` may apply." %}

<span class="label label-info">rvalue</span>

{% include tip.html content="You can view a **put** operation as an assignment from a block passed via some API. You can also view a
**delete** operation as a special kind of assignment that \"assigns destroying\" to an existing block." %}

{% include note.html content="A **block constructor** is a short constant expression that can be used to build a block from it like
\"repeat 1,2,3 thousand times\"." %}

{% include callout.html content="In Jazz an **rvalue** is a block constructor, a chain of blocks starting from root including function
calls with other rvalues as arguments for the function calls." %}

<span class="label label-warning">safe and idempotent</span>

Since the API is intended for using over a network:

* All rvalue evaluations are **safe**. They cannot have side effects. Function calls cannot have side effects.
* All lvalue assignments are **idempotent**. Assigning twice has the same effect than assigning once. There is no += operator.

{% include important.html content="There is **one API** not three (R, Python and REST), there are some differences, especially in the
supported internal types that are mentioned in the R and Python package references." %}

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

The R API has four methods: jazz_get(rvalue), jazz_put(object, lvalue), jazz_delete(lvalue) and jazz_assign(lvalue, rvalue).

{% include callout.html content="All methods return error codes, except jazz_get() which returns R vectors. R objects are limited to R core
vectors, so not all the possible complexity of Jazz types is directly usable from R. It is possible to create complex Jazz objects by
\"assembling\" them from parts using **Bebop functions written inside R**. Other R packages built on top of **rjazz** can make working
inside R friendlier." %}

{% include tip.html content="The R package **rjazz** also includes built-in http client support to use the REST API from R." %}

A simple R snippet could be:

```R
# Assuming '/.a_class.attrib' exists and contains something that can be returned as a Python object
a <- jazz_get('/.a_class.attrib')       # a is a Python object, eg. a list of strings.

b <- c('Monday', 'Tuesday', 'Whatever')
jazz_put(b, '/.a')                      # '/.a' (which is a valid lvalue) is created as a vector of 3 strings

jazz_assign('/.b', '/.a')               # '/.b' is a copy of '/.a'
jazz_delete('/.a')                      # deletes '/.a'
```

### Python API

<span class="label label-info">Python</span>

The Python API is identical to the R API:

```python
# Assuming "/.a_class.attrib" exists and contains something that can be returned as a Python object
a = jazz_get("/.a_class.attrib")      # a is a Python object, eg. a list of strings.

b = ["Monday", "Tuesday", "Whatever"]
jazz_put(b, "/.a")                    # "/.a" (which is a valid lvalue) is created as a vector of 3 strings

jazz_assign("/.b", "/.a")             # "/.b" is a copy of "/.a"
jazz_delete("/.a")                    # deletes "/.a"
```

Same as before, objects are Python vectors, not numpy or Pandas objects, so similar limitations apply.

Unlike the R package, the Python package does not include an http client, but the Python standard library does and also includes enough
serializing functionality to use the REST API from Python seamlessly.

{% include note.html content="Anything can be created in **Bebop**, a Bebop function can be a Python string. Working with Jazz can be
straightforward, but making it **Pythonic** may require other packages built on top of **pyjazz**." %}

<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [Bebop](vision_bebop.html) | | | | | [Jazz today](basics_jazz_today.html) |

{% include links.html %}
