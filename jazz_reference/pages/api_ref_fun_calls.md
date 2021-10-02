---
title: API reference - Function calls
summary: Making function calls via the rest API
sidebar: mydoc_sidebar
permalink: api_ref_fun_calls.html
---

## Making function calls via the rest API

{% include important.html content="These operations only apply to GET (and therefore HEAD) calls." %}

## What is treated as a function call

Besides the Jazz 0.6.x (Bebop) calls, which include executing Bop code at any structure level, calls to the methods named `.translate()`
in some of the bases are managed as API function calls too.

See

* Executing [bash calls](api_ref_channel_bash.html)
* Executing [zeroMQ client calls](api_ref_channel_zmq.html)

### Function call syntax from the rest API

Can be done by either an existing block or a constant. E.g.,

* `//0-mq/speech2text/(//lmdb/sound/voice_one)`
* `//bash/exec/(#ls%20-la;)`

**Note**: These calls follow the final `/` immediately, since they refer to an entity (//0-mq/speech2text or //bash/exec), not a key.

Function calls done by `Bebop` (Jazz 0.6x) do use keys:

* `//core/field/opcode(//lmdb/sound/voice_one)`
* `//core/field/opcode(#ls%20-la;)`

<br/>

{% include links.html %}
