---
title: Elements - Blocks, Kinds, Tuples, Tables and Fluxes
summary: What is Jazz (part 1) Introduction to blocks, kinds, etc. These classes are the basement for the "Jazz Magic".
sidebar: mydoc_sidebar
permalink: vision_elements_block_kind_etc.html
---

## Introducing Blocks

<span class="label label-info">Block</span>

In Jazz **everything is stored as** `Block`. That includes simple structures: tensor, tuple, kind and flux. Also complex structures
that point to other blocks: index, column, table, and, of course, code and formal fields. Blocks are stored in containers.

{% include image.html file="jazz_block.png" caption="A jazz block" max-width=540 %}

### A tensor is a block

A tensor is just a vector of vectors of vectors of ... **one type**. E.g., a video is a tensor of rank 4 (frame #, x, y, rgb). Types
include what you expect in any language: Boolean, integer, float, string of different sizes. Data blocks are typically small, as
in tenths of thousands of cells, but can be bigger to avoid cross-block boundaries when processing bigger objects (e.g. high resolution
video). Also, rigorous data analytics is supported: All types (except byte) support a NA (Not Available) logic. There are **sorted factor**,
**unsorted factor** and **strings as factor** types. Bear in mind that **any file** is a `Block`, since it is a vector (tensor or rank 1)
of bytes. Besides that, there are multi-block abstractions (columns, tables, etc.), which are, again, implemented as blocks.

### A Block has attributes

Blocks have attributes as first class citizen. Attributes are maps from integer to string. Attributes are contained inside the
`Block`. Possible attributes are:

* **Urls**. This automatically exposes the object under that url in the http server.
* Http **mime types**. How should a browser treat this thing? What is the language of the content? ...
* **File system** attributes. E.g., what software can compress/decompress this.
* **Media** attributes. This is a compressed video of: running time, x, y, codec, ...
* **Jazz fields**. Last but not least: Functions are blocks, fields are blocks, ... More on that on the next page.

{% include note.html content="Since any resource is a `Block` and blocks can have urls. A Jazz server is the only http server you need
to support any web technology, from static webpages to Typescript and JS frameworks such as Angular and Ionic." %}
{% include tip.html content="For the final user, Jazz is a website or mobile app that does \"AI Magic\"." %}

### A Block has an owner

A `Block` is binary moveable, quasi-immutable and has an owner, called a `Container`.
This means:

* **Binary moveable** - It can be copied "as is" because it has no pointers.
* **Quasi-immutable** - Via the API, it appears as immutable. Of course, in C++ you can still change its content for performance reasons
and provide an interface that abstracts that out.
* **Owner** - According to the owner, a `Block` can be: **one shot**, **volatile**, **remote** or **persisted**. **One shot** is internal
to C++ mostly required by intermediate operations. All other blocks have a **locator**. Via the API, blocks can only be created inside a
`Container`. Some containers have a `Storage`. In that case their blocks are **persisted**, i.e., they exist on a memory mapped file
to/from which they can be saved/loaded. Other containers, e.g., a tree used in a tree search, do not need to be persisted. Their blocks are
named **volatile** in this case.

## Introducing Kinds

* See C++ ref [Kind](/develop_jazz02/classjazz__elements_1_1Kind.html)

## Introducing Tuples

* See C++ ref [Tuple](/develop_jazz02/classjazz__elements_1_1Tuple.html)

## Introducing Tables

* See C++ ref [Table](/develop_jazz02/classjazz__elements_1_1Table.html)

## Introducing Fluxes

* See C++ ref [Flux](/develop_jazz02/classjazz__elements_1_1Flux.html)

<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [What is the vision?](vision_intro_page.html) | | | | | [Bebop, Formal Fields and Code Generation](vision_elements_containers.html) |

{% include links.html %}
