---
title: Fundamental Jazz Concepts
tags: [Jazz, Basics]
keywords:
summary: "Introduction to basic Jazz Concepts"
sidebar: mydoc_sidebar
permalink: basics_fundamental.html
folder: basics
---

Thank you for wanting to know more on Jazz! This is the place to start. In your first reading, feel safe to skip all the links to
"more on xxx". The content is self contained and hopefully will raise questions that can be answered following the links or contacting
the authors.

## From 20,000 feet:

Before a detailed introduction, in case you feel the need to put a label on Jazz or want to pitch it in 10 seconds, you may ask...

### Is it a distributed data platform, a language, a no-sql database, an http server, a deep learning framework?

Jazz is a new kind of data product. It combines all these things plus some others (like being an automated creator of APIs or an abstraction
over many data sources) while being **just one** extremely lightweight process. It is free software created on top of third party free software.
It is written in C/C++, available through R and Python packages and also through a REST API. The framework is Linux only, but since it is an http
back-end, Jazz consumers include all kinds of devices and operating systems. Jazz is designed for millions of users interacting concurrently
with large clusters.

Now, let's start the description.


## Introducing Blocks

In Jazz **everything is a block**. As you keep reading, you will see how strictly this is meant. Let's start with the simplest blocks.

{% include image.html file="jazz_block.png" caption="A jazz block" %}

### A Block is a tensor

A tensor is just a vector of vectors of vectors of ... **one type**. E.g., a video is a tensor of rank 4 (frame #, x, y, rgb). Types
include what you expect in any language: Boolean, integer, float, string of different sizes. Data blocks are typically small, as
in tenths of thousands of cells, but can be bigger to avoid cross-block boundaries when processing bigger objects (e.g. high resolution
video). Also, rigorous data analytics is supported: All types (except byte) support a NA (Not Available) logic. There are **sorted factor**,
**unsorted factor** and **strings as factor** types. Bear in mind that **any file** is a block, since it is a vector (tensor or rank 1)  of
bytes. Besides that, there are multi-block abstractions (columns, dataframes, etc.), which are, you guessed, implemented as blocks too.

### A Block has attributes

Blocks have attributes as first class citizen. Attributes are maps from integer to string. Attributes are contained inside the
block. Possible attributes are:

* **Urls**. This automatically exposes the object under that url in the http server.
* Http **mime types**. How should a browser treat this thing? What is the language of the content? ...
* **File system** attributes. E.g., what software can compress/decompress this.
* **Media** attributes. This is a compressed video of: running time, x, y, codec, ...
* **Jazz classes**. Last but not least: Functions are blocks, classes are blocks, more on that in a moment.

{% include note.html content="Since any resource is a block and blocks can have urls. A Jazz server is the only http server you need
to support any web technology, from static webpages to Typescript and JS frameworks such as Angular and Ionic. For a user, Jazz is a
website that does AI magic." %}


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
* **Local** - Blocks that **could** be persisted locally. Will be persisted if owned by a source, will not if owned by some in-RAM owner.
* **Distributed** - Blocks that contain data distributed and persisted (sharded and replicated) across a Jazz cluster.
* **Ubiquitous** - Blocks that are everywhere in a cluster (like methods and variables of a distributed table).


### Simple volatile containers

Volatile containers are RAM-only JazzBlockKeepr descendants. They are efficient data structures including: double linked lists, balanced
binary trees, any trees, stacks and priority queues. Using the API, you will create keeprs by abstracting them as blocks and without caring
about the details see [...Bebop reference]. For a detailed use in C++ see [...reference].
{% include note.html content="You can create **graphs of keeprs** of any complexity using the API. E.g., a queue of trees of models belonging
to a class written in Bebop. (**A class is a keepr itself**, it contains variables and methods, and is **abstracted as a block**.)" %}

### Persistence and sources

Jazz has two more important local classes:

* **JazzPersistence** - Is an abstract class that provides a **file saving** interface and a **pipeline interface** to read/write to/from
other keeprs any number of blocks in one call.
* **JazzSource** - Is the implementation of JazzPersistence using **LMDB**. See [...LMDB]. Therefore, a Jazz file is an LMDB file of
persisted blocks. You can even use command line LMDB utilities to backup a Jazz server while running or access the same file from more than
one process. E.g., Open a **source in a running http server** from a Python interpreter to see/fix what is running.


## Distributed containers

Jazz has support for distribution. A Jazz cluster is just a **network of Linux boxes running Jazz** and sharing a configuration that includes
the cluster definition. All Jazz nodes understand where (in possibly more than one node) every block of a distributed keepr **should be**.

{% include note.html content="When used via a REST API, **all nodes support all queries**. A query directed to the wrong node will simply be
redirected to a node that should be able to handle it." %}


### Columns and dataframes

In Jazz, the first dimension of any block has a special meaning and is called **a row**. All tensors have rows that can be anything. If a block
is a vector of videos, a row is a video, in an image a row is a row of pixels, in a file a row is a byte. Jazz supports **selecting rows** and
**identifying rows** in a tensor as a first class citizen.

A "vertical" chain of blocks of any type can be abstracted as a **column**, and therefore distributed across a cluster, given:

* All blocks have the **same type and dimensions**.
* There is an explicit or implicit **unique identifier for each row** (existing or not).

Examples of **explicit identifiers** include all kind of numeric or string codes, also Unix time is an example of identifier to store time
series and events. An **implicit identifier** is something created automatically similar to an index in a relational db.

A column is created by defining either a **DenseMapping** or a **SparseMapping** over the identifier. As you correctly guessed, the mapping
defines what (existent or not) block contains each identifier (== each row) and where it is.

{% include note.html content="A **dataframe is a list of columns** that share the same mapping. Since columns are tensors, it is perfectly
normal in Jazz to have a dataframe where a row is E.g., a video, a sound track, a unique label, a multiple choice of tags and a free arbitrary
text description. The **video and the soundtrack are raw data cells**, not links to external files." %}


### Filesystems, remote sources, distributed filesystems

A **JazzFileSystem** is an abstraction to manage files in the Linux box running Jazz as JazzBlocks without necessarily copying their content.
Since blocks have attributes, we can tag them to specify what services can do what on each file. This typically includes decompressing,
compressing, scaling, etc.

{% include note.html content="Given a **tar.gz** file containing 10K **jpeg** images with different sizes and a **csv** file with labels
corresponding to them, we want to build a dataframe with two columns: **image** (with identical dimensions) and **label** for training a
deep learning model. With appropriate tar.gz, jpeg and image scaling support this can be defined **inside Jazz**. Jazz extracts, decodes
and scales images on demand. An the same applies to creating a synthetic video and delivering it coded with as **mp4** and tagged with
a **mime type**." %}

A **JazzRemoteSource** is an http client connecting to a REST API and storing the result as a block. The connection can be initiated
periodically or on demand. The result is typically filtered by a validation function written in Bebop.

A **JazzClusterFileSystem** is a JazzFileSystem interface that uses a DenseMapping to shard the file names across a cluster. This can be
used to keep data as raw files across a cluster. E.g,, media file uploaded by users. These files can later be converted into more efficient
representations (blocks in JazzSources).


## Bebop: Classes and functions

Jazz has a programming language called **Bebop** (or simply **bop**). Bebop compiles into **bytecode** automatically. Actually, a Bebop function
is a block of compiled bytecode with its source code stored as an attribute. Bebop is a rather low level language (think of the bytecode as
a programmable calculator doing logic and arithmetic operations on blocks), but has some abstractions that make it human friendly.

* Bebop source code uses **operators** (both in the **standard core** or defined in Bebop) to support natural expressions.
* Bebop has aliases and other syntactic sugar. E.g., **using** /xxx.yy.zz **as** _z_
* Bebop is **functional**, blocks are immutable, reads are safe, writes are idempotent, side effects are not possible.
* Bebop is **object oriented**. Objects can be forked from other objects. A **forked object** points to its ancestor and is initialized with
its state without using extra storing space (until its state changes from that of its ancestor).
* Bebop supports **match** for type checking, switching (as in Rust) and managing errors.

Of course, Bebop is thread safe and parallels automatically both locally and across a cluster. As the standard core gets optimized for SIMD,
GPU, etc. Bebop can become as fast in logic and arithmetic processing as the fastest language. Given a sufficient block size, most computing
time will be in doing tensor logic/arithmetic.

### Operators

Operators are just functions than have nicer way to be written. They are defined in the standard core or created in Bebop and declared with
a "using" clause in other Bebop functions.

### Classes

Everything done through the API is a block stored in a keepr. A class is a keepr that has variables and functions. A class can be inherited
from another class using **class inheritance** which is copying the parent class and adding/modifying variables and methods. An object can
be created from a class or another object using **object forking** which produces a second object that only uses new storing space as it
diverges from its parent.

### Automatic programming

Jazz is created with the intention to push AI research forward. Even if theoretically some neural networks are Turing complete, that is
normally useless both theoretically, since architectures are limited and practically, since they are algorithmically inefficient by design.
Bebop is a Turing complete language almost perfectly efficient (assuming reasonable block sizes and optimized standard core implementations).
Bebop is also born with the intention of being a **machine written language** and not just by a compiler. Bebop functions have such things
as **object forking**, **matching** and pattern based error handling that are intended to support creating functions using machine learning,
especially with genetic algorithms. Introducing mutations on Bebop functions has a small cost, both in terms of forking and handling errors
by defaulting to the parent function.


## APIs

And finally, the API. Thanks for reading this far! The API is a keepr named / (root in Unix) where all the keeprs and blocks are linked.

The API is the same for all the languages including REST (where root is // since just one / is used in normal urls.)

Any API call can be seen as an assignment. In an assignment, X = Y there are two sides, the left side (X) called **lvalue** and the right
side (Y) called **rvalue**. This is C++ naming.

In Jazz an **lvalue** is one of:

* A chain of keeprs abstracted as block ids starting from root ending with the name of a block. They must all exist except (maybe) the last
name. If the last name is new, it is created, if it exists, overridden.
* A data block that will be returned as a Python object, R object or http (GET) resource.

In Jazz an **rvalue** is one of:

* A block constructor. A constant expression that can be used to build a block from it.
* Chains of keeprs abstracted as existing blocks starting from root. This includes functions and blocks passed as arguments to functions.
* A combination of the previous two.
* A data block that will be passed as a Python object, R object or http (PUT) resource.
* A delete predicate. This deletes the corresponding lvalue.

Since the API has to be REST compatible and is intended for using over a network.

* All rvalue evaluations are **safe**. They cannot have side effects. Function calls cannot have side effects.
* All lvalue assignments are **idempotent**. Assigning twice has the same effect than assigning once. There is no += operator.

### REST

The REST API is one of the following http commands.

* **GET** with a valid **rvalue**.
* **HEAD** with a valid **rvalue**. Internally the same, but returns the header only.
* **PUT** with a valid **lvalue**.
* **DELETE** with a valid **lvalue**.
* **OPTIONS** with a string. Parses the string and returns the possible functions.
* **GET** with **lvalue=rvalue**. Assignment in the server (similar to GET and PUT without the traffic).

There is no support for POST or TRACE, any function other than those mentioned returns an error.

### R API

The R API has four methods:

* **jazz_get**(rvalue)
* **jazz_put**(object, lvalue)
* **jazz_delete**(lvalue)
* **jazz_assign**(lvalue, rvalue)

All methods return error codes, except jazz_get() which returns R vectors. R objects are limited to R core vectors, ergo not all the
possible complexity of Jazz types is directly readable or writable to R. It is possible to create complex Jazz objects by "assembling"
them from simple parts using Bebop function created from R. Since Jazz is still accessible through files and the REST API, this is not a
serious limitation. Other R packages built on top of **rjazz** can make working inside R friendlier.

The R package **rjazz** also includes built-in http support evolved from the original rjazz package.


### Python API

The Python API is identical to the R API:

* **jazz_get**(rvalue)
* **jazz_put**(object, lvalue)
* **jazz_delete**(lvalue)
* **jazz_assign**(lvalue, rvalue)

Same as before, objects are Python vectors, not numpy or Pandas objects, so similar limitations apply. Again other Python packages built
on top of **pyjazz** can make working from Python friendlier.

Again, anything can be created in Bebop, a Bebop function can be a Python string so working with Jazz can be straightforward, but it is
definitely not Pythonic. (Why should it, in the end when you are done creating a Jazz based solution, you have a production ready system
that does not depend on Python in any way.)

