---
title: API reference - Volatile base tree
summary: Api Reference for the base "tree" inside the container Volatile
sidebar: mydoc_sidebar
permalink: api_ref_volatile_tree.html
---

## The Container `Volatile`

`Volatile` is a Service to manage data objects in RAM. This includes:

 - A `deque` is a double linked list accessible as a key-value store.
 - `Index` objects that are serialized as tuples and exposed via API to allow connecting everything to everything as a graph.
 - A priority `queue` is implemented as self balanced binary trees with a maximum number of nodes.
 - A `tree` that can be navigated through commands and through keys, that implements pruning and more.

* See C++ ref [Volatile](/develop_jazz02/classjazz__elements_1_1Volatile.html)

## The base `tree`

A tree is created empty, new_entity() `//tree/name/` Nodes are pushed with their parent key by put()ing to `//tree/name/key~parentname`
(where parentname must exist). The only exception is the empty tree, it can be started by either a push with just a key or a push
with a parent name that will be ignored. E.g., `//tree/name/key~void`. All nodes support get()/header()/locate() by `//tree/name/key` or by
`//tree/name/key~parent`, `//tree/name/key~next`, `//tree/name/key~child`. The root node can be get()/header()/locate() by
`//tree/name/~first`. put() only supports an existing parent. Remove `//tree/name/key` removes a whole subtree, all the descendants and the
node itself. Remove `//tree/name` removes the whole entity.

## In terms of the Jazz server API

A tree is created by GET `//tree/name.new` and destroyed with DELETE `//tree/name`.

Anything else is just GET, PUT or DELETE calls as in the previous description.

Volatile Blocks support everything described in this reference: slicing, being used in calls, attributes, constant assignment,
forwarding, ...

<br/>

{% include important.html content="The commands only require the first two characters. ~ch is the same as ~child, ~fi is ~first, etc." %}

{% include links.html %}
