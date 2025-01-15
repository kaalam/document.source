---
title: API Reference - Channel base bash
summary: Api Reference for the base "bash" inside the container Channels
sidebar: mydoc_sidebar
permalink: api_ref_channel_bash.html
---

## The Container `Channels`

`Channels` is a container doing block transactions across media (files, folders, the bash shell, http urls and zeroMQ servers). This
includes keeping a cluster of Jazz nodes as a whole where every node is aware of all the others and queries can be forwarded by just
including the node name. Any imaginable communication channel, including writing files and pushing them to github (using git in the bash
shell) is accessible. This includes all protocols supported by zeroMQ and libCURL.

* See C++ ref [Channels](/develop_jazz02/classjazz__elements_1_1Channels.html)

## The base `bash`

This is, like 0-mq, also a modify() call, the difference is you don't create the pipeline, it always exists and is called "//bash/exec".
The Tuple is an array of byte, both ways "input" and "result". If the size of the "result" buffer is too small for the answer it will be
filled up to the available size and something will be lost. The answer includes whatever a popen("bash script.sh") writes to stdout/stderr
(where script.sh is the content of the "input" tensor).

## In terms of the Jazz server API

This is a function call: either GET `//bash/exec/(//lmdb/stuff/script)` or GET `//bash/exec/(&ls%20-la)` the argument can be anything in
Persisted, Volatile, even a file or an //http get or a (%-encoded) constant as in the second example.

{% include note.html content="In a function call (or a filter), constants are not terminated by a `;` but by the closing bracket." %}

{% include note.html content="API-wise, this is a modify() call (instead of an exec() call) because the key is empty." %}

{% include note.html content="Note that when you call it with a constant, it automatically creates a Tuple with a 4Kb vector of byte
reserved for the answer. Anything longer than that will be cut off. That Tuple will be returned by the GET call." %}

<br/>

{% include important.html content="bash operation must be enabled via configuration by setting ENABLE_BASH_EXEC to something non-zero.
There is no security check: it can be used for pushing AI creations to github or kill the server." %}

{% include links.html %}
