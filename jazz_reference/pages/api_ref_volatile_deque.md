---
title: API Reference - Volatile base deque
summary: Api Reference for the base "deque" inside the container Volatile
sidebar: mydoc_sidebar
permalink: api_ref_volatile_deque.html
---

## The Container `Volatile`

`Volatile` is a Service to manage data objects in RAM. This includes:

 - A `deque` is a double linked list accessible as a key-value store.
 - `Index` objects that are serialized as tuples and exposed via API to allow connecting everything to everything as a graph.
 - A priority `queue` is implemented as self balanced binary trees with a maximum number of nodes.
 - A `tree` that can be navigated through commands and through keys, that implements pruning and more.

* See C++ ref [Volatile](/develop_jazz02/classjazz__elements_1_1Volatile.html)

## The base `deque`

A deque is a double linked list with a key-value store. It is created empty via new_entity() and you can just get(), header(), put(),
remove() or copy() by key. You can also put to both `//deque/entity/~first` and `//deque/entity/~last` and the nodes will be pushed
to either side of the deque with automatically created keys. Keys can be found using locate() and any node relation command.
The first and last can be peeked by get()ting `//deque/entity/~first` and `//deque/entity/~last` or popped with
`//deque/entity/~pfirst` and `//deque/entity/~plast`. Also the list supports `//deque/entity/key~next` and
`//deque/entity/key~prev` for get(), header() and locate() or as the what of copy(), but not for put(), remove() or as the where of
copy().

You can also PUT a block into a deque without giving it a name by putting to `//deque/entity/~last`. The container will give it a new
name automatically. This way you avoid finding a name that does not match existing blocks in the deque. You can use `~last` and `~plast`
combined to use the deque just as a LIFO stack or `~last` and `~pfirst` as a FIFO queue.

## In terms of the Jazz server API

A deque is created by GET `//deque/ent_name.new` and destroyed with DELETE `//deque/ent_name`.

Anything else is just GET, PUT or DELETE calls as in the previous description.

Volatile Blocks support everything described in this reference: slicing, being used in calls, attributes, constant assignment,
forwarding, ...

<br/>

{% include important.html content="The commands only require the first two characters. ~fi is the same as ~first, ~pr is ~prev, etc." %}

{% include links.html %}
