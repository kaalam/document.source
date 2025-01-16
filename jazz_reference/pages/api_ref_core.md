---
title: API Reference - Core API
summary: Running code using the REST API
sidebar: mydoc_sidebar
permalink: api_ref_core.html
---

## The Container `Core`

`Core` is the only container doing code execution. Also `ModelsAPI` uses the `Core` container to execute the code. The core may
compile if necessary and create a runtime session if necessary.

* See C++ ref [Core](/develop_jazz02/classjazz__bebop_1_1Core.html)


## Calling Core

Calling `Core` has four possible forms as explained in [Function calls](api_ref_fun_calls.html). Two forms for getting the result from
either calling exec from a block or a query (a constant included in the API call). Also, the same two forms but assigning the result to a
block in a container.

{% include tip.html content="In a call, the `base` is `bop` (also `bebop` or `compile`) the `entity` is a space, the `key` is a snippet
name and the block (or constant) passed are the arguments, possibly a tuple." %}


### Bases in Core

Bop has four bases, three of them are the same `bebop`, `bop` and `compile`. The fourth is `onnx` that tells the Core that the snippet has
no source code, it is just an ONNX model created with any tool that can export to ONNX. In that case, the snippet can be just a block
with a vector of bytes (a file).


### Spaces in Core

The `Core` uses a Space (that supports basic persisted key/value functionality) to store the snippets. These spaces are persisted in a
configurable database. You create a new space with `//bop/space_name.new` like in any other container.


### Snippets in Core

Snippets are persisted as a `Snippet` object and either compiled or decompiled at creation. From source (compiled), just use the `bebop`,
`bop` or `compile` and pass the source as text as a const or in a block. From an ONNX model (decompiled), use the `onnx` base and pass
the model as a block containing a vector of bytes (a file).


## ONNX-runtime session management

A call that runs a snippet is using an ONNX runtime session. Sessions are created and destroyed as needed. The number of sessions is
limited by a configurable parameter. From inside Bebop, it is possible to control how a function call is executed (use/deploy a session
or merge the source code of the function with the caller). From the API, it is always using a session, creating it if necessary.


### Configuring Core

Core has two configurable parameters:

| Property | description |
|-------|--------|
| `SNIPPETSPACE_STORAGE_ENTITY` | The database entity name where the snippets are stored. |
| `ONNXRT_MAX_NUM_SESSIONS` | The maximum number of simultaneously open ONNX runtime sessions. |

<br/>

{% include links.html %}
