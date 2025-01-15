---
title: API Reference - Function calls
summary: Making function calls via the rest API
sidebar: mydoc_sidebar
permalink: api_ref_fun_calls.html
---

## Making function calls via the rest API

{% include important.html content="These operations only apply to GET (and therefore HEAD) calls." %}

## What is treated as a function call

Internally, Containers have two execution methods `exec()` and `modify()`. The difference is the former always creates a new Tuple with the
result, while the latter modifies (like in a call by reference) the Tuple passed as an argument. Any container could in principle have
any method, if they don't, it will default to the root method that just returns an error code.

In `jazz_elements` (anything complete in Jazz 0.5.x) only Channel implements `modify()` and nothing implements `exec()`. In Jazz 1.25.x
(with Bebop and Models(), both the `Core` and the `ModelsAPI` container use `exec()` execute code [Core API](api_ref_core.html) and use
models [Model API](api_ref_model.html).

{% include important.html content="API-wise function calls are translated to `modify()` calls when the key is empty and to `exec()`
when it is not." %}

See

* Executing [bash calls](api_ref_channel_bash.html)
* Executing [zeroMQ client calls](api_ref_channel_zmq.html)

### Function call syntax from the rest API

Can be done by either an existing block or a constant. E.g.,

* `//0-mq/speech2text/(//lmdb/sound/voice_one)`
* `//bash/exec/(&ls%20-la)`

**Note**: These calls follow the final `/` immediately, since they refer to an entity (//0-mq/speech2text or //bash/exec), not a key.

{% include note.html content="In a function call (or a filter), constants are not terminated by a `;` but by the closing bracket." %}

Function calls done by `Bebop` (Jazz 0.6x) do use keys:

* `//core/field/opcode(//lmdb/sound/voice_one)`
* `//core/field/opcode(&ls%20-la)`

<br/>

{% include links.html %}
