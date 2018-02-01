---
layout: post
title: Persistence
description: Nothing can be faster
image: assets/images/pic05.jpg
---

Persistence is the way data is stored in a **permanent** way, as opposed to volatile data in RAM. Persisted data that can be backed up, audited,
restored, traced, verified, etc. Needless to say, choosing a persistence technology is a huge decision and a wrong choice can go *really wrong*.
Luckily, we did not have to compromise on that. We needed an embedded, thread safe, key/value store and we also got: extraordinarily fast,
memory-efficient, transactional and widely tested at the same time.

Our choice is [LMDB](https://symas.com/lightning-memory-mapped-database/). On top of the already mentioned advantages, LMDB provides a set
of command line tools that allow backing up a node even when it is running and basic maintenance tools. Data can be loaded into a node using
either the http API or maintenance tools.

Everything is persisted as a **block**. On top of LMDB, Jazz defines types for blocks such as:
  - Data blocks (including tensors)
  - Metadata (to define instruments for example)
  - Neural networks
  - Web pages
  - Mobile applications
  - Images, video, web resources, etc.

On top of blocks, an **instrument** is an abstraction of many data blocks of the same type. Instruments have IDs and times that define a relation
with other instruments that share a compatible structure. Jazz has native support for time series and key-identified attributes. Oversimplifying, one
can view instruments as something similar to columns in a relational database. Instruments are highly efficient, incrementally updated collections
of blocks distributed in a cluster of Jazz nodes.

Instruments are one of the three input sources a neural network can have. The other two are blocks and **volatiles**. Volatiles are blocks that are
not persisted, not shared across the cluster, they are uploaded by the user to perform computations with them.


*[RAM]: Random Access Memory: The memory where computation takes place.
*[embedded]: A program that can be used inside another program without being a different process.
*[thread safe]: All Jazz modules can use as many threads (CPU cores) as are available on each machine.
*[key/value store]: The internal persisted storage in the Jazz server. It is an extremely fast way to access data (value) given some unique identifier (key).
*[memory-efficient]: The usage of memory is almost exactly the same as the size of the data with a minimum overhead, unlike what is frequent in other systems.
*[transactional]: Any change to the database is, by design: atomic, consistent, isolated and durable.
*[http API]: Application Program Interface: The interface that allows clients (computers and smartphones) to communicate data with Jazz.
*[blocks]: The basic unit of data storage inside Jazz. Blocks have a type, like a raw binary file or a vector of 100 strings.
*[tensors]: A set of data of the same type with a set of dimensions. Examples of tensors include numbers, vectors, matrices, images, videos and more.
*[Metadata]: Data describing how other data has to be interpreted.
*[Neural networks]: Same as "deep neural networks". DNNs are architectures of functions. Typically, these networks are created by "learning" iteratively to do tasks by looking at examples.
*[instruments]: An abstraction over the blocks that can handle large data columns without caring about the internal block details or even in which nodes they are stored.
*[time series]: A series of values of a variable obtained at successive times, possibly with different intervals between them.
*[key-identified]: A series of values of a variable obtained in relation with some unique identifier.
*[incrementally updated]: Modifying an instrument does not need to apply to the whole instrument. I can be just a value or a group of values.
*[Volatiles]: Blocks the user provides for some computation that are local to a Jazz node and not persisted.
*[cluster]: A group of computers running Jazz servers that work together and are aware of each other.
