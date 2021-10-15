---
title: API reference - Block serialization calls
summary: Understanding and specifying how blocks have to be serialized and deserialized
sidebar: mydoc_sidebar
permalink: api_ref_serialization.html
---

## What is serialization and deserialization

In Jazz, all blocks are binary movable objects: A tensor of double is literally a grid of 8-byte values in a format directly understood
by the CPU, a tuple has metadata and tensors that are binary too. Some formats are easier to interpret "as text" than others. A vector
of byte is the closest thing to a 0-ended C string, and a vector (of possibly just one) string resembles the string types of higher
level languages.

Except for software designed to understand the internals of Jazz (C++ code that uses jazz_elements) or among Jazz servers sharing data
in a cluster, you will probably want to manage data as text in a format that is similar to JSON and is described
[here](api_ref_const_encoding.html) The exception to this is using blocks that are either strings (stored as a vector of one string) or
vectors of byte (E.g., a file read). Occasionally, when you read a vector of byte that should be a string, it will have a trailing 0
that you can remove doing something like `s = a.text[:-1]` in Python assuming `a = requests.get(...)`.


## How does implicit deserialization work?

Each time Jazz reads a constant via the http API, it will try to deserialize it. E.g., GET
`//lmdb/base/key=("weights":[[17,170],[112,54],[207,149]],"author":["Billy"],"score":[0.95])` will write a Tuple with item names, types,
shapes and data. But GET `//lmdb/base/key=(weights:[[17,170],[112,54],[207,149]],"author":["Billy"],"score":[0.95])` (note the missing
double quotes) will write a vector of bytes ended with a final 0, just because parsing the tuple failed.

Note that PUT `//lmdb/base/key` sending `("weights":[[17,170],[112,54],[207,149]],"author":["Billy"],"score":[0.95])` will store it
as a string (technically, a vector of just one string). In this case it is **not** a constant, it is the content of a block and the
previous paragraph does not apply.


## How does explicit serialization and deserialization work?

You can add the suffix `.raw` to the query to deserialize or `.text` to serialize. In the example of the previous paragraph where the block
has a Tuple, you can serialize it with GET `//lmdb/base/key.text` and you will get the text serialization rather than the raw data.

In the previous PUT example, where implicit deserialization does not apply, you can force it with `//lmdb/base/key.raw` sending
`("weights":[[17,170],[112,54],[207,149]],"author":["Billy"],"score":[0.95])`.


## How can I combine deserialization with other incompatible features?

If the API does not support both, E.g. you can either `//lmdb/base/key.text` or `//lmdb/base/key[@[3,5]]` but
not `//lmdb/base/key[@[3,5]].text`. You may need to create an intermediate volatile block. Assuming you created a deque named `my_stack`,
you can GET `//deque/m_stack/~last=//lmdb/base/key[@[3,5]]` and GET `//deque/m_stack/~plast.text`. Note that you have created a volatile
block in the deque (giving it a new name automatically using the `~last` command to avoid possibly replacing an existing block) and then,
you have **deleted** it as you read it (`~last` would have read it without deleting it, `~plast` stands for pop last).

<br/>

{% include links.html %}
