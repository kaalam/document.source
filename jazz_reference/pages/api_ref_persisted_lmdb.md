---
title: API Reference - Persisted base lmdb
summary: Api Reference for the base "lmdb" inside the container Persisted
sidebar: mydoc_sidebar
permalink: api_ref_persisted_lmdb.html
---

## The Container `Persisted`

Persisted blocks are blocks stored using LMDB in the Jazz process.

{% include important.html content="LMDB is a Btree-based database management library modeled loosely on the BerkeleyDB API, but much simplified. The entire database is exposed in a memory map, and all data fetches return data directly from the mapped memory, so no malloc's or memcpy's occur during data fetches. As such, the library is extremely simple because it requires no page caching layer of its own, and it is extremely high performance and memory-efficient. It is also fully transactional with full ACID semantics, and when the memory map is read-only, the database integrity cannot be corrupted by stray pointer writes from application code. [LMDB](http://www.lmdb.tech/doc/)." %}

* See C++ ref [Persisted](/develop_jazz02/classjazz__elements_1_1Persisted.html)

## The base `lmdb` through the Jazz server API

The entity is always a database. A database is created by GET `//lmdb/base_name.new` and destroyed with DELETE `//lmdb/base_name`.
The special database `www` is used to store the blocks exposed via the [static API](api_ref_serving_frontend.html)

The key is always an identifier inside the database, there are no commands.

## Serializing blocks

Both the input and the output of binary blocks can be serialized as text or from text. To do this you can GET using `//lmdb/db/key.text`
and PUT a block of text using `//lmdb/db/key.raw` into a binary block. You can also store the text version and read it as binary by just
switching .raw and .text. See [more](api_ref_serialization.html)

<br/>

Lmdb Blocks support everything described in this reference: slicing, being used in calls, attributes, constant assignment, forwarding, ...

<br/>

{% include links.html %}
