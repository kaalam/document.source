---
title: API reference - Volatile base queue
summary: Api Reference for the base "queue" inside the container Volatile
sidebar: mydoc_sidebar
permalink: api_ref_volatile_queue.html
---

## The Container `Volatile`

`Volatile` is a Service to manage data objects in RAM. This includes:

 - A `deque` is a double linked list accessible as a key-value store.
 - `Index` objects that are serialized as tuples and exposed via API to allow connecting everything to everything as a graph.
 - A priority `queue` is implemented as self balanced binary trees with a maximum number of nodes.
 - A `tree` that can be navigated through commands and through keys, that implements pruning and more.

* See C++ ref [Volatile](/develop_jazz02/classjazz__elements_1_1Volatile.html)

## The base `queue`

A priority queue is implemented as self balanced binary trees with a maximum number of nodes. The nodes can also be accessed by key.
Each time you push a block, you must put() to a key with a priority by putting to `//queue/name/key~0.977` (where 0.977 is a double).
The queue is created by new_entity() `//queue/name/~5000` (where 5000 is a mandatory maximum number of nodes). When the queue fills, lower
priority nodes are discarded. You can also get() to `//queue/name/~xhighest` (extracting it), `//queue/name/~highest` (leaving it),
equivalently: `//queue/name/~xlowest`, `//queue/name/~lowest`. And you can get() nodes by key as in a deque (if they haven't been pop()ed
or been discarded).

## In terms of the Jazz server API

A queue is created by GET `//queue/name/~5000.new` and destroyed with DELETE `//queue/name`.

Anything else is just GET, PUT or DELETE calls as in the previous description.

Volatile Blocks support everything described in this reference: slicing, being used in calls, attributes, constant assignment,
forwarding, ...

<br/>

{% include important.html content="The commands only require the first two characters. ~lo is the same as ~lowest, ~xh is ~xhigh, etc." %}

{% include links.html %}
