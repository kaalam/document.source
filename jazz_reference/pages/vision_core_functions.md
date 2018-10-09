---
title: Core functions
summary: What is Jazz (part 2) Introducing Jazz's core functions.
sidebar: mydoc_sidebar
permalink: vision_core_functions.html
---

## What are core functions?

**Jazz** does not prioritize being a Deep Learning framework. The authors of Jazz believe that the next step of AI applications will use
DL, but requires a lot more than DL. To do DL we would not have created a new tool. [More on that ...](https://kaalam.github.io/kaalam/)
Jazz still needs all the "boring" functions applied to blocks (tensors) including serializing binaries to/from strings, doing arithmetic,
logic, statistics, and, of course, Neural Networks. All these functions collectively are referred to as the **standard core** are written in
C++. The standard core can only be extended in C++.

{% include tip.html content="The standard core functions have names that can be called from the APIs or inside Bebop functions. Some of
them can be used as operators to make Bebop source code more human readable." %}


## Deep Neural Networks

Where are all the **layer-types**, **activation functions** and **optimization algorithms**? If Jazz wants to become the primary framework
for a large community, they will have to be implemented. For a framework that still **has to build a community**, competing against TensorFlow
in what TF is best, is probably not the smartest move. If Jazz succeeds, we may have all these things in due time. Simple frameworks (like
tiny-dnn) have implemented enough DL functions to compute most state-of-the-art solutions. The code and the license are in some cases
"clean" enough to make refactoring third-party code into Jazz an option.

{% include note.html content="Complete RNNs architectures implemented in other platforms could be refactored as core functions." %}

<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [Blocks and keeprs](vision_blocks_keeprs.html) | | | | | [Distributed containers](vision_distributed_containers.html) |

{% include links.html %}
