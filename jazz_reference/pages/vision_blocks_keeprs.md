---
title: Blocks and keeprs
summary: What is Jazz (part 1) Blocks and Keeprs
sidebar: mydoc_sidebar
permalink: vision_blocks_keeprs.html
---

## Introducing Blocks

In Jazz **everything is a block**. As you keep reading, you will see how strictly this is meant. Let's start with the simplest blocks.

{% include image.html file="jazz_block.png" caption="A jazz block" %}

### A Block is a tensor

A tensor is just a vector of vectors of vectors of ... **one type**. E.g., a video is a tensor of rank 4 (frame #, x, y, rgb). Types
include what you expect in any language: Boolean, integer, float, string of different sizes. Data blocks are typically small, as
in tenths of thousands of cells, but can be bigger to avoid cross-block boundaries when processing bigger objects (e.g. high resolution
video). Also, rigorous data analytics is supported: All types (except byte) support a NA (Not Available) logic. There are **sorted factor**,
**unsorted factor** and **strings as factor** types. Bear in mind that **any file** is a block, since it is a vector (tensor or rank 1)  of
bytes. Besides that, there are multi-block abstractions (columns, dataframes, etc.), which are, again, implemented as blocks.

### A Block has attributes

Blocks have attributes as first class citizen. Attributes are maps from integer to string. Attributes are contained inside the
block. Possible attributes are:

* **Urls**. This automatically exposes the object under that url in the http server.
* Http **mime types**. How should a browser treat this thing? What is the language of the content? ...
* **File system** attributes. E.g., what software can compress/decompress this.
* **Media** attributes. This is a compressed video of: running time, x, y, codec, ...
* **Jazz classes**. Last but not least: Functions are blocks, classes are blocks, more on that in a moment.

{% include note.html content="Since any resource is a block and blocks can have urls. A Jazz server is the only http server you need
to support any web technology, from static webpages to Typescript and JS frameworks such as Angular and Ionic. For the final user, Jazz is a
website or mobile app that does AI magic." %}

### A Block has an owner

A block is binary moveable, quasi-immutable and has an owner, called a **keepr** (or more precisely a JazzBlockKeepr descendant).
This means:

* **Binary moveable** - It can be copied "as is" because it has no pointers.
* **Quasi-immutable** - Via the API, it appears as immutable. Of course, in C++ you can still change its content for performance reasons and
provide an interface that abstracts that out.
* **Owner** - According to the owner, a block can be: **one shot**, **volatile** or **persisted**. **One shot** is possible only in C++, it
means the creator owns the block. All other blocks have a **keepr**. Via the API, blocks can only be created inside JazzBlockKeepr descendants.
For now, just note that some keeprs handle **volatile** blocks (like data passed in a url or intermediate results of functions) and others
handle **persisted** blocks that can be: saved, backed-up, moved across nodes, etc.

{% include image.html file="jazz_block_keeper.png" caption="Some important JazzBlockKeepr descendants" %}


## Keeprs: JazzBlockKeepr descendants

Jazz blocks have identifiers. Identifiers are unique in the context of their owner. Since Jazz is cluster aware, identifiers by their first
character can be classified as:

* **Volatile** - Temporary blocks that are always local. There is no way to reference them across nodes.
* **Local** - Blocks that **could** be persisted locally. They **will** if owned by a **source** (or any JazzPersistence).
* **Distributed** - Blocks distributed and persisted (sharded and replicated) across a **Jazz cluster**.
* **Ubiquitous** - Blocks that are **everywhere** in a cluster (like methods and variables of distributed tables).

### Simple volatile containers

Volatile containers are RAM-only JazzBlockKeepr descendants. They are efficient data structures including: double linked lists, balanced
binary trees, any trees, stacks and priority queues. Using the API, you will create keeprs by abstracting them as blocks and without caring
about the details.
{% include note.html content="You can create **graphs of keeprs** of any complexity using the API. E.g., a queue of trees of models belonging
to a class written in Bebop. (**A class is a keepr itself**, it contains variables and methods, and is **abstracted as a block**.)" %}

### Persistence and sources

Jazz has two more important local classes:

* **JazzPersistence** - Is an abstract class that provides a **file saving** interface and a **pipeline interface** to read/write to/from
other keeprs any number of blocks in one call.
* **JazzSource** - Is the implementation of JazzPersistence using **LMDB**. Therefore, a Jazz file is an LMDB file of persisted blocks.
You can even use command line LMDB utilities to backup a Jazz server while running or access the same file from more than one process.
E.g., Open a **source in a running http server** from a Python interpreter to see/fix it while running.
{% include note.html content="Since **LMDB is a transactionally consistent key/value store** using a memory mapped file as a persistence, Jazz,
at its minimum, is a distributed key/value store second to none in terms of efficiency." %}

{% include links.html %}
