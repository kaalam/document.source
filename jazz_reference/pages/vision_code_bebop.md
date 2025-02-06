---
title: Code Execution - Onnx and Bebop
summary: What is Jazz (part 4) - Introduction to Bebop and code execution
sidebar: mydoc_sidebar
permalink: vision_code_bebop.html
---

## What is that "Jazz Magic"?

The Jazz [purpose](/kaalam/2018/10/04/why_jazz.html) and how it a [solution](/kaalam/2018/10/01/how_is_jazz_a_solution.html) has been
introduced in the kaalam blog. In this page, we just outline a few traits of Bebop (aka. Bop) that make it a unique programming language.

{% include note.html content="In the past, Bebop has been different experimental things, from now on, by Bebop we mean Bebop-25 and that
refers to any modern version of the language."%}


### Jazz with ONNX

On one side, we want to do computation using Jazz, the most efficient possible data storage, we want that computation to be the most
efficient possible, maintained by a huge team (including Microsoft, Facebook, IBM, Intel, AMD and Nvidia) to optimize for any platform.
We want to support any deep learning framework, via ONNX, to support anything written in PyTorch, TensorFlow, Keras, MXNet, SciKit-Learn
and hundreds of other frameworks. And we want to do that using the tensors stored in Jazz and be able to serve the service (or even compile
Bop on the fly) via API. Well Bebop does that in a **clean and simple way**.

On another side, we want `DataSpaces` to provide spaces to make our models use data abstractions that support such things as embeddings,
nearest neighbors, and other things that are not supported by ONNX, in a seamless way.

That, on itself is a reason big enough to use Jazz. We get rid of any scripting language in favor of a concurrent, controllable monolithic
server written in C++ to put machine learning in production.


### ONNX is designed to be written by machines

To support automatic programming, typically from natural language, in a way in which a text description follows a model of the world and
that world can be used to explain and predict outcomes, we need to generate massive amounts of candidate programs efficiently. How to do
that with Jazz/Bebop is explained in the [next page](vision_models.html).

{% include important.html content="Automatic programming has been the holy grail of AI since the times of <b>von Neumann</b>. Also,
<b>Minsky</b> stated that von Neumann's architecture was created with the intention to do automatic programming <i>(previous architectures
had a hard code/data separation and code was not modifiable while running)</i>. Other languages, including Lisp, clearly had automated
programming in mind when designed."%}


### Bebop is made of computation graphs

A computation in Bebop is a graph of graphs of graphs, ... of graphs. Each edge is either an ONNX operator or a Bebop function. When
running, the function calls can be replaced by the code of the function.


### Bebop is object oriented

In Bebop and object is a private namespace with attributes and methods defined in a class. The attributes have constructors may be
read-only or read-write. The methods are functions with access to the attributes. The object support multiple inheritance.
Via introspection, at any time what part of an object is used is known and construction will operate in a lazy way.


### Bebop is functional

In the sense that functions can be passed as arguments to functions and returned by functions. Also, blocks are immutable, reads are safe,
writes are idempotent. It is not purely functional since side effects are possible since objects have read-write attributes.
It is up to the user to decide to make it purely functional or not.


### Bebop does introspection

Any Bebop code being a graph of graphs, ... which is a graph, makes it possible to introspect the code at any level and always know
the flow of dependencies. This is used to optimize the code, to generate the code. Also, since ONNX runtime has a cost for creating
sessions, we have the option to call code that is already in memory, and that is a huge advantage.


## Bebop Reference

The Bebop-25 Reference source is [Bebop Reference](bop_reference.html) page.


<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [APIs and Spaces](vision_apis_spaces.html) | | | | | [Code Automation](vision_models.html) |

{% include links.html %}
