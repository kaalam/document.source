---
title: Introduction to Jazz
tags: [Jazz, Basics]
keywords:
summary: "Introduction to Jazz"
sidebar: mydoc_sidebar
permalink: basics_fundamental.html
folder: basics
---

Thank you for wanting to know more about Jazz! This is the place to start. The content is self contained and hopefully will raise questions
that can be answered later navigating the Jazz Reference or contacting the authors.

## From 20,000 feet:

Before a detailed introduction, in case you feel the need to put a label on Jazz or want to pitch it in 10 seconds, you may ask...

### Is it a distributed no-sql database, a language, an http server, a deep learning framework?

Jazz is a new kind of data product. It combines all these things and some others (an automated creator of APIs, an abstraction over data
sources, ...) while being **just one** extremely lightweight process. It is free software created on top of third party free software.
It is written in C/C++, available through R and Python packages and also through a REST API. The framework is Linux only, but, since it is
an http back-end, Jazz consumers include all devices and operating systems. Jazz is designed for millions of users interacting concurrently
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


## Distributed containers

Jazz has support for distribution. A Jazz cluster is just a **network of Linux boxes running Jazz** and sharing a configuration that includes
the cluster definition. All Jazz nodes understand where (in possibly more than one node) every block of a distributed keepr **should be**.

{% include note.html content="When used via a REST API, **all nodes support all queries**. A query directed to the wrong node will simply be
redirected to a node that should be able to handle it." %}


### Columns and dataframes

In Jazz, the first dimension of any block is special and divides the tensor in **rows**. Rows that can be anything. In a vector of videos,
a row is a video, in an image, a row is a row of pixels, in a file, a row is a byte. Jazz supports **selecting rows** and operating on
row selections as a first class citizen. (E.g., It can return a selection from a persisted block without ever copying the block or
accessing any non selected elements.)

A "vertical" chain of blocks of any type can be abstracted as a **column** (JazzColumn), and therefore distributed across a **cluster**
(JazzCluster), given:

* All blocks have the **same type and dimensions**.
* There is an explicit or implicit **unique identifier for each row**.

Examples of **explicit identifiers** include all kind of numeric or string codes, also Unix time is an example of identifier to store time
series and events. An **implicit identifier** is something created automatically similar to an index in a relational db.

A column is created by defining either a **DenseMapping** or a **SparseMapping** over the identifier. A **DenseMapping** will allocate
a row for any existing value of the identifier, which may contain NA values if not informed. A **SparseMapping** is a more efficient way
to represent sparse data where only exiting rows are stored together with an index identifying each row.

{% include note.html content="A **dataframe (JazzDataframe) is a list of columns** that share the same mapping. Since columns are tensors,
it is possible to have a five columns dataframe where a row is: 1. a video, 2. a sound track, 3. a label, 4. a multiple choice of tags, 5.
a free text description. The **video and the soundtrack are tensors of raw data**, not links to external files." %}


### Filesystems, remote sources, distributed filesystems

A **JazzFileSystem** is an abstraction to manage files in the Linux box running Jazz as JazzBlocks without necessarily copying their content.
Since blocks have attributes, we can tag them to specify what functions can be applied to each file. This typically includes decompressing,
compressing, scaling images, etc.

{% include note.html content="Given a **tar.gz** file containing 10K **jpeg** images with different sizes and a **csv** file with labels
corresponding to them, we want to build a dataframe with two columns: **image** (with identical dimensions) and **label** for training a
deep learning model. With appropriate tar.gz, jpeg and image scaling support this can be defined **inside Jazz**. Jazz extracts, decodes
and scales images on demand. The same applies to **creating a synthetic video** and delivering it coded with as **mp4** and tagged with
a **mime type** as an http resource." %}

A **JazzRemoteSource** is an http client connecting to a REST API and storing the result as a block. The connection can be initiated
periodically or on demand. The result is typically filtered by a validation function written in Bebop.

A **JazzClusterFileSystem** is a JazzFileSystem interface that uses a DenseMapping to shard the file names across a cluster. This can be
used to keep data as raw files across a cluster. E.g,, media file uploaded by users. These files can later be converted into more efficient
representations (blocks in JazzSources).


## Bebop: Classes and functions

Jazz has a programming language called **Bebop** (or simply **bop**). Bebop compiles into **bytecode** automatically. Actually, a Bebop function
is a block of compiled bytecode with its source code stored as an attribute. Bebop is a rather low level language (think of the bytecode as
a programmable calculator doing operations on blocks), but has some abstractions that makes it "human friendly".

* Bebop source code uses **operators** (both in the **standard core** or defined in Bebop) to support "natural expressions".
* Bebop has aliases and other syntactic sugar. E.g., **using** /xxx.yy.zz **as** _z_
* Bebop is **functional**, blocks are immutable, reads are safe, writes are idempotent, side effects are not possible.
* Bebop is **object oriented**.
* Bebop supports **multiple inheritance** using **combined classes** of any number of parents.
* Objects can be forked from other objects. A **forked object** points to its ancestor and is initialized with its state without using extra
storing space (until its state changes from that of its ancestor).
* Bebop supports **match** for type checking. This provides some metaprogramming, like defining math over many types in one declaration.
* Bebop supports **match** for switching (as in Rust).
* Bebop supports **alternative functions** for managing errors.

Of course, Bebop is **thread safe** and **parallels automatically** both **locally** and **across a cluster**. As the standard core gets
optimized for SIMD, GPU, etc. Bebop can become as fast in logic and arithmetic processing as the fastest language. Given a sufficient
block size, most computing time will be in tensor logic/arithmetic.

### Operators

Operators are just functions than can be written "nicely". They are defined in the standard core or created in Bebop and declared with
a "using" clause in other Bebop functions.

### Classes

A class is internally a **keepr** that contains variables and functions. A class can be inherited from another or many classes. An object
can be created from a class or another object using **object forking** which produces a second object that only uses new storing space as it
diverges from its parent.

### Automatic programming

Jazz is created with the intention to push AI research forward. Even if theoretically some neural networks are Turing complete, that is
normally useless both theoretically, since architectures are limited and practically, since they are algorithmically inefficient by design.
Bebop is a Turing complete language almost perfectly efficient (assuming reasonable block sizes and optimized standard core implementations).
Bebop is also born with the intention of being a **machine written language** and not just by a compiler. Bebop functions have such things
as **object forking**, **pattern matching** and **alternative function** for error handling that are intended to support creating functions
using machine learning, especially with genetic algorithms. Introducing mutations on Bebop functions has a small cost, both in terms of
forking and handling errors. Errors in a wrong mutation can be handled by the ancestor function. Since functions have no side effects,
failing functions "never existed" like dead mice in a clinical trial ;-)

### Automatic function result caching

Jazz is intended for millions of users (tenths of thousands per node) in applications where the numbers of users requiring the same queries
can be potentially huge. The cleanness of the functional dependencies (no side effects, etc.) and the efficiency of the volatile structures
makes caching simple, reliable and potentially hugely profitable. Function caching can also be used as a algorithmic strategy as in **dynamic**
**programming**.


## Deep Neural Networks

Where are all the **layer-types**, **activation functions** and **optimization algorithms**? If Jazz wants to become the primary framework
for a large community, they will have to be implemented. For a framework that still **has to build a community**, competing against TensorFlow
in what TF is best, is probably not the smartest move. If Jazz succeeds, we may have all these things in due time. The following is a list
of what is already implemented in **tiny-dnn** that could be used as a reference implementation.

### Layer-types (to be implemented)

core, fully-connected, dropout, linear operation, power, convolution, convolutional, average pooling, max pooling, deconvolutional,
average unpooling, max unpooling, normalization, contrast normalization (only forward pass), batch normalization, split/merge, concat,
slice, elementwise-add

### Activation functions (to be implemented)

tanh, asinh, sigmoid, softmax, softplus, softsign, rectified linear(relu), leaky relu, identity, scaled tanh, exponential linear units(elu),
scaled exponential linear units (selu), loss functions, cross-entropy, mean squared error, mean absolute error,
mean absolute error with epsilon range

### Optimization algorithms (to be implemented)

stochastic gradient descent (with/without L2 normalization), momentum and Nesterov momentum, adagrad, rmsprop, adam, adamax

### Open Source Bebop DL Libraries

Summarizing, Jazz would not be necessary if, like some people seem to think, AI is DL. Jazz is about providing efficient solutions to do
everything in AI, from which DL is just a part.

And once DL is written in Bebop, you get:

* **Automatic abstraction**: The same code works on small things or automatically paralleled on distributed dataframes.
* **Easy access to details**: You can experiment with variations without having to recompile a platform that requires months of dedication
to understand assuming you have the time and the skills. Or even automate that.
* **Efficiency**, **persistence**, a **production-level API** for your project, **error management**, result **caching**, integration with
other **AI** (tree search, RL, etc.), reading/writing to files in **common binary formats**, what else?


## APIs

And finally, **the API**. Thanks for reading this far! The API is a **keepr** named **/** (root in Unix) where all the keeprs and blocks
are linked.

The API is the same for all the languages including REST (where root is **//** since just one / is used in normal urls.)

Any API call can be seen as an assignment. In an assignment, X = Y there are two sides, the left side (X) called **lvalue** and the right
side (Y) called **rvalue**. This is C++ naming.

In Jazz an **lvalue** is one of:

* A chain of keeprs abstracted as block ids starting from root ending with the name of a block. They must all exist except, possibly, the last
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

Summarizing, there is **one API** not three (R, Python and REST), there are some differences that, for the moment, we will only mention at a
very high level.

### REST

The REST API supports **standard http commands**.

* **GET** with a valid **rvalue**. To read from Jazz.
* **HEAD** with a valid **rvalue**. Internally the same as GET, but returns the header only.
* **PUT** with a valid **lvalue**. To write blocks into a Jazz keepr.
* **DELETE** with a valid **lvalue**. To delete blocks or keeprs (even recursively).
* **OPTIONS** with a string. Parses the string and returns the commands that would accept that string as a URL.
* **GET** with **lvalue=rvalue**. Assignment in the server. Similar to "PUT(lvalue, GET(rvalue))" without traffic.

There is no support for POST or TRACE, any functions other than those mentioned return an error.

### R API

The R API has four methods:

* **jazz_get**(rvalue)
* **jazz_put**(object, lvalue)
* **jazz_delete**(lvalue)
* **jazz_assign**(lvalue, rvalue)

All methods return error codes, except jazz_get() which returns R vectors. R objects are limited to R core vectors, ergo not all the
possible complexity of Jazz types is directly readable or writable to R. It is possible to create complex Jazz objects by "assembling"
them from simple parts using Bebop functions written inside R. Since Jazz is accessible through files and the REST API, this is not a
serious limitation. Other R packages built on top of **rjazz** can make working inside R friendlier.

The R package **rjazz** also includes built-in http client support to use the REST API from R.


### Python API

The Python API is identical to the R API:

* **jazz_get**(rvalue)
* **jazz_put**(object, lvalue)
* **jazz_delete**(lvalue)
* **jazz_assign**(lvalue, rvalue)

Same as before, objects are Python vectors, not numpy or Pandas objects, so similar limitations apply.

Unlike the R package, the Python package does not include an http client, but the Python standard library does and also includes enough
serializing functionality to use the REST API from Python seamlessly.

Again, anything can be created in Bebop, a Bebop function can be a Python string so working with Jazz can be straightforward, but making
it **Pythonic** may require other packages built on top of **pyjazz**.
