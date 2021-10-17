---
title: Elements - Containers - One Shot, Channels, Volatile and Persisted
summary: What is Jazz (part 2) Introduction to the different types of containers
sidebar: mydoc_sidebar
permalink: vision_elements_containers.html
---

## Introducing Container

A `Container` is a `Service` to manage Jazz blocks. All Jazz blocks are managed some descendant of the main `Container` class.

`Container` provides a neat API for all descendants, including:

 - Transparent thread safety .enter_read() .enter_write() .leave_read() .leave_write() .lock_container() .unlock_container()
 - Allocation: .new_block(), .destroy_transaction()
 - **CRUD** (Create/Read/Update/Delete): .get(), .locate(), .header(), .new_entity(), .put(), .remove(), .copy()
 - **CORE** (Function execution API): .exec() and .modify()
 - Support for container names in the API .base_names()
 - A configuration style for all descendants

The **CRUD** has two forms, the "easy" API where things are described ina string and the "native" API where that string is parsed into
its constituents. This may include commands and many things that are full described in [API](api_ref_intro.html)

* See C++ ref [Container](/develop_jazz02/classjazz__elements_1_1Container.html)

## Introducing Channels

`Channels` is a container doing block transactions across media (files, folders, the bash shell, http urls and zeroMQ servers). This
includes keeping a cluster of Jazz nodes as a whole where every node is aware of all the others and queries can be forwarded by just
including the node name. Any imaginable communication channel, including writing files and pushing them to github (using git in the bash
shell) is accessible. This includes all protocols supported by zeroMQ and libCURL.

* See C++ ref [Channels](/develop_jazz02/classjazz__elements_1_1Channels.html)

## Introducing Volatile

`Volatile` is a Service to manage data objects in RAM. This includes:

 - A `deque` is a double linked list accessible as a key-value store.
 - `Index` objects that are serialized as tuples and exposed via API to allow connecting everything to everything as a graph.
 - A priority `queue` is implemented as self balanced binary trees with a maximum number of nodes.
 - A `tree` that can be navigated through commands and through keys, that implements pruning and more.

* See C++ ref [Volatile](/develop_jazz02/classjazz__elements_1_1Volatile.html)

## Introducing Persisted

Persisted blocks are blocks stored using LMDB in the Jazz process.

{% include important.html content="LMDB is a Btree-based database management library modeled loosely on the BerkeleyDB API, but much simplified. The entire database is exposed in a memory map, and all data fetches return data directly from the mapped memory, so no malloc's or memcpy's occur during data fetches. As such, the library is extremely simple because it requires no page caching layer of its own, and it is extremely high performance and memory-efficient. It is also fully transactional with full ACID semantics, and when the memory map is read-only, the database integrity cannot be corrupted by stray pointer writes from application code. [LMDB](http://www.lmdb.tech/doc/)." %}

* See C++ ref [Persisted](/develop_jazz02/classjazz__elements_1_1Persisted.html)

<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [Elements - Blocks, Kinds, etc.](vision_elements_block_kind_etc.html) | | | | | [Code Generation - Bebop](vision_code_bebop.html) |

{% include links.html %}
