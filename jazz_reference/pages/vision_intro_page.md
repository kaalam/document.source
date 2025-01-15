---
title: What is the Vision?
summary: What is Jazz - Introduction
sidebar: mydoc_sidebar
permalink: vision_intro_page.html
---

## The executive summary:

Why Jazz?

We built Jazz because we need it. We needed it to do research, but also as platform that can be used to write insanely efficient
http backend servers do anything present AI can do and can be used to explore new ideas current platforms would be too inefficient to do.


What is Jazz?

 - Jazz uses tensors and tuples of tensors as its binary native data storage.
 - Efficiently retrieves data in RAM including structures like: maps, deques, trees, etc.
 - Efficiently communicates data though multiple channels including: bash, zeroMQ, REST, etc.
 - Efficiently stores data in disk using memory mapped files (LMDB).
 - Abstracts data blocks using Spaces, supporting: large clusters, key/value, embeddings, search by embedding and time series.
 - Can use all that data using ONNX pipelines created or downloaded with any modern deep learning framework such as Keras, PyTorch, etc.
 - Can also define new pipelines in Bebop, a language that compiles to ONNX.
 - Can create Bebop code by composing concepts.
 - Can search in that conceptual program space using Models that generate code, run it and evaluate the result.
 - Is a monolith written in C++ that is the only necessary process for everything on this list. I can also "talk to other processes".
 - Can be customized using uplifts.
 - It is an http server and can also store static content including its own frontend.

It is **open source** and **free software**

It is free software created on top of third party free software. It is written in C++, extends in C++, communicates over any imaginable
channel and is also available through a REST API. The framework is Linux only, but, since it is an http back-end, Jazz consumers include
all devices and operating systems. Jazz is designed for millions of users interacting concurrently with large clusters. It also delivers
the front-end code built with in your favorite language like Flutter/Dart, Angular/Ionic, etc.

{% include tip.html content="For the final user, Jazz is just a website or mobile app that does \"AI Magic\" very fast." %}

Now, let's dive a little bit over each of these features [Blocks, Kinds, Tuples](vision_elements_block_kind_etc.html).


See also:

* [Bebop Fundamentals](bop_introduction.html)
* [Models Fundamentals](models_introduction.html)
* [APIs](api_ref_intro.html)

<br/>

| <span class="label label-info">Next ...</span> |
| [Blocks, Kinds, Tuples](vision_elements_block_kind_etc.html) |

{% include links.html %}
