---
title: Bebop, Classes, Functions and Operators
summary: What is Jazz (part 4) Introducing Bebop, Jazz's language to make efficient bytecode human-friendly while introducing functions for automatic programming.
sidebar: mydoc_sidebar
permalink: vision_bebop.html
---

## Bebop: Classes and functions

<span class="label label-info">Bebop</span>

Jazz has a programming language called **Bebop** (or simply **bop**). Bebop compiles into **bytecode** automatically.

{% include note.html content="Actually, a Bebop function is a block of compiled bytecode with its source code stored as an attribute." %}
{% include callout.html content="Bebop is a rather low level language. You can think of bytecode as a set of instructions operating on
blocks performing basic things like calling functions in the standard core. Bebop uses types, names, operators and some abstractions to
write \"human friendly\" source code that is compiled very straightforwardly into bytecode without requiring any understanding of it." %}

* Uses **operators** (both in the **standard core** or defined in Bebop) to support "natural expressions".
* Has aliases and other syntactic sugar. E.g., **using** /xxx.yy.zz **as** _z_
* Is **functional**, blocks are immutable, reads are safe, writes are idempotent, side effects are not possible.
* Is **object oriented**.
* Has **multiple inheritance** using **combined classes** of any number of parents.
* Uses **match** for switching (as in Rust).

It also includes some support for automatic programming, including:

* Supports **match** for type checking. This provides some metaprogramming capabilities, like overloading with exploration on the types.
* Objects can be forked from other objects. A **forked object** points to its ancestor and is initialized with its state without using extra
storing space (until its state changes from that of its ancestor).
* Bebop supports **alternative functions** for managing errors.

Of course, Bebop is **thread safe** and **parallels automatically** both **locally** and **across a cluster**. As the standard core gets
optimized for SIMD, GPU, etc. Bebop can become as fast in logic and arithmetic processing as the fastest language. Assuming sufficient
block size, when processing "big data", most computing time will be inside tensor logic/arithmetic. As a consequence, computation time
will essentially be determined by the efficiency of these critical parts.

### Operators

<span class="label label-info">Operators</span>

Operators are just functions than can be written "nicely". They are defined in the standard core or created in Bebop.

### Classes

<span class="label label-info">Classes</span>

A class is internally a **keepr** that contains variables and functions. An object can be created from a class or another object
using **object forking** which produces a second object that only uses new storing space as it diverges from its parent.

### Automatic programming

Jazz is created with the intention to push AI research forward. Even if theoretically some neural networks are Turing complete, that is
normally useless both theoretically, since architectures are limited and practically, since they are extremely inefficient for general
purpose computation. A simple 32 bit multiplication can cost over ten orders of magnitude more time*resources using NN than using a single
CPU multiplication.
Bebop is a Turing complete language almost perfectly efficient (assuming reasonable block sizes and optimized standard core implementations).
Bebop is also born with the intention of being a **machine written language** and not just by a compiler.

{% include tip.html content=" Bebop functions have such things as **object forking**, **pattern matching** and **alternative function**
for error handling that are intended to support creating functions using machine learning, especially with genetic algorithms." %}

{% include callout.html content="Introducing mutations on Bebop functions **has a small cost**, both in terms of forking and handling errors.
Errors in a wrong mutation can be **handled by the ancestor function**. Since functions have no side effects, failing functions \"never
existed\" *(like dead mice in a clinical trial ;-))*." %}

### Automatic function result caching

Jazz is intended for millions of users (tenths of thousands per node) in applications where the numbers of users requiring the same queries
can be potentially huge. The **cleanness of the functional dependencies** (no side effects, etc.) and the efficiency of the volatile structures
makes caching simple, reliable and potentially hugely profitable. Function caching can also be used as a algorithmic strategy as in **dynamic**
**programming**.

<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [Distributed containers](vision_distributed_containers.html) | | | | | [APIs](vision_apis_http.html) |

{% include links.html %}
