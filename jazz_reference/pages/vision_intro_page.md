---
title: What is the vision? What does Jazz want to be?
summary: What is Jazz becoming?
sidebar: mydoc_sidebar
permalink: vision_intro_page.html
---

## From 20,000 feet:

Before a detailed introduction, in case you feel the need to put a label on Jazz or want to pitch it in 10 seconds, you may ask...

### Is it a distributed no-sql database, a language, an http server, a machine learning framework?

Jazz is a new kind of data product. It combines all these things and some others: a programming language that extends by learning, an
automated creator of APIs, efficient communications and in-RAM storage, etc. Everything done by **just one** extremely lightweight process.
While being a production quality server, on which you can completely write the code of your backend logic, it focuses on researching AI.
Especially, automated code generation using [formal fields](https://arxiv.org/abs/2007.14075) and lifelong learning.

There is no other platform with that focus, alternatives would be: 1. Using a deep learning platform and failing because anything other
than deep learning is orders of magnitude inefficient and the platforms lack most tools needed for our vision, coding them in scripting
languages is, in our opinion, a path to certain failure. 2. Doing experiments with "one use only" C++ code that easily becomes impossible
to control and insure the required quality and reliability to build on top of it.

In a way, Jazz is something that need to be built to do the research, but also a platform that can be used to write insanely efficient
http backend servers that do anything AI and data related.

It is free software created on top of third party free software. It is written in C++, extends in C++, communicates over any imaginable
channel and is also available through a REST API. The framework is Linux only, but, since it is an http back-end, Jazz consumers include
all devices and operating systems. Jazz is designed for millions of users interacting concurrently with large clusters. It also delivers
the front-end code built with in your favorite language like Flutter/Dart, Angular/Ionic, etc.

{% include tip.html content="For the final user, Jazz is just a website or mobile app that does \"AI Magic\" very fast." %}

Now, let's explain the main ideas:

* [Blocks, Storage and Containers](vision_elements_block_kind_etc.html)
* [Bebop, Formal Fields and Code Generation](vision_code_bebop.html)
* [Lifelong-learning and agency](vision_agency_code.html)

See also:

* [Bebop](bop_elements.html)
* [Agency](agency_elements.html)
* [APIs](api_ref_intro.html)

<br/>

| <span class="label label-info">Next ...</span> |
| [Blocks, Storage and Containers](vision_elements_block_kind_etc.html) |

{% include links.html %}
