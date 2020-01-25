---
title: Blocks, Filestores and Containers
summary: What is Jazz (part 1) Introduction to blocks, filestores and containers. These classes are the basement for all the Jazz magic.
sidebar: mydoc_sidebar
permalink: vision_blocks_containers.html
---

## Introducing Blocks

<span class="label label-info">JazzBlock</span>

In Jazz **everything is a block**. This means all the classes, data, functions, Bop programs and static objects that make a system are
stored as blocks. Even the block containers are stored as blocks. Let's start with what blocks are made of.

{% include image.html file="jazz_block.png" caption="A jazz block" max-width=540 %}

### A Block is a tensor

A tensor is just a vector of vectors of vectors of ... **one type**. E.g., a video is a tensor of rank 4 (frame #, x, y, rgb). Types
include what you expect in any language: Boolean, integer, float, string of different sizes. Data blocks are typically small, as
in tenths of thousands of cells, but can be bigger to avoid cross-block boundaries when processing bigger objects (e.g. high resolution
video). Also, rigorous data analytics is supported: All types (except byte) support a NA (Not Available) logic. There are **sorted factor**,
**unsorted factor** and **strings as factor** types. Bear in mind that **any file** is a block, since it is a vector (tensor or rank 1)  of
bytes. Besides that, there are multi-block abstractions (columns, tables, etc.), which are, again, implemented as blocks.

### A Block has attributes

Blocks have attributes as first class citizen. Attributes are maps from integer to string. Attributes are contained inside the
block. Possible attributes are:

* **Urls**. This automatically exposes the object under that url in the http server.
* Http **mime types**. How should a browser treat this thing? What is the language of the content? ...
* **File system** attributes. E.g., what software can compress/decompress this.
* **Media** attributes. This is a compressed video of: running time, x, y, codec, ...
* **Jazz classes**. Last but not least: Functions are blocks, classes are blocks, more on that in a moment.

{% include note.html content="Since any resource is a block and blocks can have urls. A Jazz server is the only http server you need
to support any web technology, from static webpages to Typescript and JS frameworks such as Angular and Ionic." %}
{% include tip.html content="For the final user, Jazz is a website or mobile app that does \"AI magic\"." %}

### A Block has an owner

A block is binary moveable, quasi-immutable and has an owner, called a **container**.
This means:

* **Binary moveable** - It can be copied "as is" because it has no pointers.
* **Quasi-immutable** - Via the API, it appears as immutable. Of course, in C++ you can still change its content for performance reasons and
provide an interface that abstracts that out.
* **Owner** - According to the owner, a block can be: **one shot**, **volatile** or **persisted**. **One shot** is possible only in C++, it
means the creator owns the block. All other blocks have a **container**. Via the API, blocks can only be created inside `Container` descendants. Some containers have a `Filestore`. In that case their blocks are **persisted**, i.e., they exist on a memory mapped file to/from which they can be saved/loaded. Other containers, e.g., a tree used in a tree search, do not need to be persisted. Their blocks are named **volatile** in this case.


## Introducing Filestores

The class `Filestore` implements persistence of all Jazz objects using **LMDB**. Therefore, a Jazz file is an LMDB file of persisted blocks.
You can even use command line LMDB utilities to backup a Jazz server while running or access the same file from more than one process.

{% include important.html content="Because LMDB is a transactionally consistent key/value store, Jazz is \"out of the box\" **a distributed
key/value store second to none in terms of efficiency**." %}

{% include image.html file="jazz_filestores.png" caption="Filestores class" %}

### Filestores can contain any number of containers

`Filestore` is not inherited. Instead, all `Container` descendants can be grounded in a `Filestore`, when they do, they inherit the store's Get/Put API. This design allows any number of containers being stored in any number of filestores, of course, each one belonging to just one filestore.


## Introducing Containers

The class `Container`is an abstract class. It defines an API to manage blocks (possibly persisted) with a consistent interface. The containers themselves are just efficient data structures required by different algorithms. You can think of it as the C++ STL. Actually,
some containers are just wrappers around STL containers, others are implemented from scratch or using more than one STL container.

{% include image.html file="jazz_container.png" caption="Containers class" %}

### Blocks and containers have identifiers, Jazz clusters have global paths

Jazz blocks have identifiers. Identifiers are unique in the context of their container. Containers themselves, since they are blocks, have identifiers. Adding `Filestore` IDs and even Jazz node IDs we get "global" distributed paths (valid over a cluster of Jazz nodes).

<br/>

{% include note.html content="You can create **trees of containers** of any complexity using the API. The only limitation is: Once any container is grounded in a `FileStore`, all its descendants can only be grounded in the same `FileStore`. This behavior is handled by the class automatically." %}

<br/>

{% include tip.html content="Since containers are efficient data structures, many Jazz classes inherit them. E.g., The Finder is a Chart." %}

### Container descendent reference

{% include important.html content="The reference for each Container descendant is included in its source code and available via the [developer documentation](/develop/). At least until definitions are so stable that we consider backward compatibility a priority, there is no other reference." %}

<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [What is the vision?](vision_intro_page.html) | | | | | [Bebop, Fields and Contexts](vision_bop_fields_contexts.html) |

{% include links.html %}
