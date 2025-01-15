---
title: Basic Types - Blocks, Kinds, Tuples
summary: What is Jazz (part 1) - Introduction to blocks, kinds, and tuples as the basement for the "Jazz Magic"
sidebar: mydoc_sidebar
permalink: vision_elements_block_kind_etc.html
---

## Introducing Blocks

<span class="label label-info">Block</span>

In Jazz **everything is stored as** `Block`. That includes simple structures: tensor, tuple, kind and index. Also complex structures
to run code, formal fields or implement algorithms are stored as blocks. Blocks are stored in containers.

{% include image.html file="jazz_block.png" caption="A jazz block" max-width=540 %}

### A tensor is a block

A tensor is just a vector of vectors of vectors of ... **one type**. E.g., a video is a tensor of rank 4 (frame #, x, y, rgb). Types
include what you expect in any language: Boolean, integer, float, string of different sizes. Data blocks are typically small, as
in tenths of thousands of cells, but can be bigger to avoid cross-block boundaries when processing bigger objects (e.g. high resolution
video). Also, rigorous data analytics is supported: All types (except byte) support a NA (Not Available) logic. There are **sorted factor**,
**unsorted factor** and **strings as factor** types. Bear in mind that **any file** is a `Block`, since it is a vector (tensor or rank 1)
of bytes. Besides that, there are multi-block abstractions which are, again, implemented as blocks.

### A Block has attributes

Blocks have attributes as first class citizen. Attributes are maps from integer to string. Attributes are contained inside the
`Block`. Possible attributes are:

* **Urls**. This automatically exposes the object under that url in the http server.
* Http **mime types**. How should a browser treat this thing? What is the language of the content? ...
* **File system** attributes. E.g., what software can compress/decompress this.
* **Media** attributes. This is a compressed video of: running time, x, y, codec, ...
* **Jazz fields**. Possibly used by algorithms.

{% include note.html content="Since any resource is a `Block` and blocks can have urls. A Jazz server is the only http server you need
to support any web technology, from static webpages to Typescript and JS frameworks such as Angular and Ionic or Flutter and Dart." %}

{% include tip.html content="For the final user, Jazz is just a website or mobile app that does \"AI Magic\" very fast." %}

### A Block has an owner

A `Block` is binary moveable, quasi-immutable and has an owner, called a `Container`. This means:

* **Binary moveable** - It can be copied "as is" because it has no pointers.
* **Quasi-immutable** - Via the API, it appears as immutable. Of course, in C++ you can still change its content for performance reasons
and provide an interface that abstracts that out.
* **Owner** - A `Block` can be: **one shot**, **volatile**  or **persisted**, in any case, it still has an owner which is a `Container`.
Blocks "move" with a `Transaction` and usually a `Locator`. It can "move" across any channel (run as a bash script, read/write to the file
system, transmitted through zMQ, libCURL, persisted or stored in many efficient structures).
**One shot** is a block linked to a transaction (typically as the result of some query, that will be destroyed as the transaction is
destroyed). **Volatile** is a block in RAM inside some efficient structure, queue, deque, tree, index, all of them possibly accessed as
a key/value store. **Persisted** is a block stored on a memory mapped file to/from which it can be saved/loaded using LMDB technology.
Of course, you can also save blocks to a file, in Jazz terminology the file system is a channel whose base is "file", not a "persisted"
block.

* See C++ ref [Block](/develop_jazz02/classjazz__elements_1_1Block.html)

## Introducing Kinds

A `Kind` is a type definition for Jazz Blocks and Tuples. `Kind` objects contain the metadata only. A `Tuple` is a data object of a `Kind`.
Kinds define more complex types than (raw) Blocks, even if they are blocks. E.g., A Block can store a video of a fixed shape (image only
or soundtrack only). A Kind can store both and have **dimensions** defining things like: image_width, image_height, number_of_frames and,
possibly, a subtitle track as another vector of strings. `image_width`, etc. would have different values in the Tuples of the same `Kind`,
but all of them satisfy the is_a(Video) Tuple->Kind relation.

* See C++ ref [Kind](/develop_jazz02/classjazz__elements_1_1Kind.html)

## Introducing Tuples

A `Tuple` is a Jazz Block with multiple Tensors. It could be simplified as "An instance of a **Kind**" although that is not exactly what it
is. It is an array of Tensors and it can match one or more Kinds if its .is_a(<kind>) method returns true.

* See C++ ref [Tuple](/develop_jazz02/classjazz__elements_1_1Tuple.html)

<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [What is the vision?](vision_intro_page.html) | | | | | [Elements - Containers](vision_elements_containers.html) |

{% include links.html %}
