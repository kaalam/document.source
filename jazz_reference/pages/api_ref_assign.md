---
title: API Reference - Assignment calls
summary: Making assignments via the rest API
sidebar: mydoc_sidebar
permalink: api_ref_assign.html
---

## Making assignments via the rest API

{% include important.html content="An assignment is performed as a GET call, but the returned value is just a confirmation or error code.
Internally, an assignment does GET and PUT calls." %}

## What is an assignment?

An assignment is a GET and a PUT executed inside a node without the data of the blocks being uploaded or downloaded, but network traffic
can be generated depending on the bases involved.

Additionally, `node` names can be given to copy blocks across a Jazz cluster.

### Assignment syntax from the rest API

Can be done by either an existing block or a constant. E.g.,

* `//lmdb/base17/key55=///tokyo_node//lmdb/base17/key55`
* `//lmdb/base17/key55=&[1,5,6];`
* `//lmdb/base17/key55=//bash/exec/(&ls%20-la)`
* `///tokyo_node//lmdb/base17/key55=//0-mq/speech2text/(//lmdb/sound/voice_one)`
* `///tokyo_node//tree/this/that=///anchorage_node//lmdb/base17/key55`

The important syntax rule is: The term to the left of the `=` is an `L-value` (something valid for PUT and DELETE) and the term to the
right and `R-value` (something valid for GET and HEAD).

<br/>

{% include links.html %}
