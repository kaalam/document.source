---
title: API Reference - Channel base 0-mq
summary: Api Reference for the base "0-mz" inside the container Channels
sidebar: mydoc_sidebar
permalink: api_ref_channel_zmq.html
---

## The Container `Channels`

`Channels` is a container doing block transactions across media (files, folders, the bash shell, http urls and zeroMQ servers). This
includes keeping a cluster of Jazz nodes as a whole where every node is aware of all the others and queries can be forwarded by just
including the node name. Any imaginable communication channel, including writing files and pushing them to github (using git in the bash
shell) is accessible. This includes all protocols supported by zeroMQ and libCURL.

* See C++ ref [Channels](/develop_jazz02/classjazz__elements_1_1Channels.html)

## The base `0-mz`

The 0-mq implementation in jazz_elements is only a zeroMQ client, not a server. The only operation it supports is a modify() call.
For a modify() call to succeed, you must first have created a pipeline using a put call with a string. E.g,
put("//0-mq/pipeline/speech2text") with a block containing a string like "tcp://localhost:5555" creates a pipeline named speech2text.

Outside Jazz, you set up a zeroMQ server that listens to tcp://localhost:5555 and does speech to text, expecting, say 32-bit int vectors
as input and returning a buffer of char as output. In your modify() call you must provide a tuple with two Tensors with item names "input"
and "result". The modify() call will send the raw tensor of the item "input" to the server and write whatever the server answers into
the tensor named "result", just overriding the tensor without any dimension change.

This operation expects the tensor to be binary (i.e., no variable length strings) and their shapes and types known by both parts.

When using modify() as the method of Channel, you should omit the "pipeline" part, `just modify({"0-mq", "speech2text", ""}, p_tuple);`.

Besides this, `get("//0-mq/pipeline/speech2text")` will return just a block with "tcp://localhost:5555" and
`remove("//0-mq/pipeline/speech2text")` will destroy the pipeline. Any other call using "0-mq" returns SERVICE_ERROR_NOT_APPLICABLE.

## In terms of the Jazz server API

This is a function call: either GET `//0-mq/speech2text/(//lmdb/stuff/my_tensor)` or GET `//0-mq/speech2text/(&[1,2,3])` the argument
can be anything in Persisted, Volatile, even a file or an //http get or a (%-encoded) constant as in the second example.

{% include note.html content="In a function call (or a filter), constants are not terminated by a `;` but by the closing bracket." %}

{% include note.html content="API-wise, this is a modify() call (instead of an exec() call) because the key is empty." %}

{% include note.html content="Note that when you call it with a constant, it automatically creates a Tuple with a 4Kb vector of byte
reserved for the answer. Anything longer than that will be cut off. That Tuple will be returned by the GET call." %}

<br/>

{% include important.html content="0-mq operation must be enabled via configuration by setting ENABLE_ZEROMQ_CLIENT to something
non-zero." %}

{% include links.html %}
