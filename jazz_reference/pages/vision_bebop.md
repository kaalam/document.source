---
title: Bebop, Classes, Functions and Operators
summary: What is Jazz (part 4) Introducing Bebop, Jazz's language to make efficient bytecode human-friendly while introducing functions for automatic programming.
sidebar: mydoc_sidebar
permalink: vision_bebop.html
---

## Bebop: Classes and functions

Jazz has a programming language called **Bebop** (or simply **bop**). Bebop compiles into **bytecode** automatically. Actually, a Bebop function
is a block of compiled bytecode with its source code stored as an attribute. Bebop is a rather low level language (think of the bytecode as
a programmable calculator doing operations on blocks), but has some abstractions that makes it "human friendly".

* Bebop source code uses **operators** (both in the **standard core** or defined in Bebop) to support "natural expressions".
* Bebop has aliases and other syntactic sugar. E.g., **using** /xxx.yy.zz **as** _z_
* Bebop is **functional**, blocks are immutable, reads are safe, writes are idempotent, side effects are not possible.
* Bebop is **object oriented**.
* Bebop supports **multiple inheritance** using **combined classes** of any number of parents.
* Objects can be forked from other objects. A **forked object** points to its ancestor and is initialized with its state without using extra
storing space (until its state changes from that of its ancestor).
* Bebop supports **match** for type checking. This provides some metaprogramming, like defining math over many types in one declaration.
* Bebop supports **match** for switching (as in Rust).
* Bebop supports **alternative functions** for managing errors.

Of course, Bebop is **thread safe** and **parallels automatically** both **locally** and **across a cluster**. As the standard core gets
optimized for SIMD, GPU, etc. Bebop can become as fast in logic and arithmetic processing as the fastest language. Given a sufficient
block size, most computing time will be in tensor logic/arithmetic.

### Operators

Operators are just functions than can be written "nicely". They are defined in the standard core or created in Bebop.

### Classes

A class is internally a **keepr** that contains variables and functions. A class can be inherited from another or many classes. An object
can be created from a class or another object using **object forking** which produces a second object that only uses new storing space as it
diverges from its parent.

### Automatic programming

Jazz is created with the intention to push AI research forward. Even if theoretically some neural networks are Turing complete, that is
normally useless both theoretically, since architectures are limited and practically, since they are inefficient by design.
Bebop is a Turing complete language almost perfectly efficient (assuming reasonable block sizes and optimized standard core implementations).
Bebop is also born with the intention of being a **machine written language** and not just by a compiler. Bebop functions have such things
as **object forking**, **pattern matching** and **alternative function** for error handling that are intended to support creating functions
using machine learning, especially with genetic algorithms. Introducing mutations on Bebop functions has a small cost, both in terms of
forking and handling errors. Errors in a wrong mutation can be handled by the ancestor function. Since functions have no side effects,
failing functions "never existed" like dead mice in a clinical trial ;-)

### Automatic function result caching

Jazz is intended for millions of users (tenths of thousands per node) in applications where the numbers of users requiring the same queries
can be potentially huge. The cleanness of the functional dependencies (no side effects, etc.) and the efficiency of the volatile structures
makes caching simple, reliable and potentially hugely profitable. Function caching can also be used as a algorithmic strategy as in **dynamic**
**programming**.

<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [Distributed containers](vision_distributed_containers.html) | | | | | [APIs](vision_apis_http.html) |

{% include links.html %}
