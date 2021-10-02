---
title: API reference - Volatile base index
summary: Api Reference for the base "index" inside the container Volatile
sidebar: mydoc_sidebar
permalink: api_ref_volatile_index.html
---

## The Container `Volatile`

`Volatile` is a Service to manage data objects in RAM. This includes:

 - A `deque` is a double linked list accessible as a key-value store.
 - `Index` objects that are serialized as tuples and exposed via API to allow connecting everything to everything as a graph.
 - A priority `queue` is implemented as self balanced binary trees with a maximum number of nodes.
 - A `tree` that can be navigated through commands and through keys, that implements pruning and more.

* See C++ ref [Volatile](/develop_jazz02/classjazz__elements_1_1Volatile.html)

## The base `index`

Index both exposes and serializes Index type blocks. An entity inside index is **one single** Index. When get()ting them by key, you get
the value stored in the Index. To put a new one, just new_entity() //index/name. To populate one, just put() to //index/name/~put
with a Tuple of the appropriate Kind. To save one, just get() //index/name/~get. Since Index only stores strings, at the levels at which
the interface expects a block, it must be a block containing just one string.

## In terms of the Jazz server API

A deque is created empty by GET `//index/ent_name.new` and destroyed with DELETE `//index/ent_name`.

You can populate it (PUT `//index/name/~put`) or save it (GET `//index/name/~get`) with an appropriate Tuple (A Tuple of two string vectors
of the same length named "key" and "value").

Anything else is just GET, PUT or DELETE calls to the keys in the index.

Volatile Blocks support everything described in this reference: slicing, being used in calls, attributes, constant assignment,
forwarding, ...

<br/>

{% include important.html content="The commands only require the first two characters. ~ge is the same as ~get, ~pu is ~put, etc." %}

{% include links.html %}
