---
title: Language basics
summary: Current consensus on how Bebop has to be implemented in terms of the language itself and support for automatic programming.
sidebar: mydoc_sidebar
permalink: reference_bop_basics.html
---

## Language basics

{% include warning.html content="Designing the language while implementing it using **flex** and **bison** is not a good idea.
For the moment, this page only defines \"where to go\" but finding some elegant \"how to do it\" should be given some thoughts." %}

## Bebop allows inclusion and aliases

  * There must be some support for modules: E.g., "import rnn"
  * Aliases and other syntactic sugar: E.g., **using** /xxx.yy.zz **as** _z_

## Bebop makes things easy

  * There is a clear **type inference** mechanism. Primitive types meet on the minimum common enclosing type (bool -> int -> double). Classes meet on the closest ancestor if a->b->c and a->b->d  c and d meet on b.
  * There is a clear **shape inference** mechanism. We make things simple by translating ideas like "with the dimensions of", "with the number of rows of" or "repeated as necessary", etc. into code, like "a + 2" meaning, as expected, element-wise addition of 2 to any tensor of any shape and numeric type.

## Bebop is functional

  * Functions can be arguments of functions.
  * Functions can return functions.
  * Operators are defined as functions (core or Bebop).
  * Functions cannot have side effects. More explicitly: Everything a function reads is either an argument or a public member of one of its parent classes. Everything a function uses can be a cached value which is indistinguishable from the "real" value and cannot be modified by design.
  * **Maintainers** are functions that, unlike ordinary functions, can create/update/delete class members. Constructors are maintainers. Maintainers should be avoided when possible because they will interfere with automatic optimization.
  * Blocks are immutable.
  * Reads are safe.
  * Writes are idempotent.

## Bebop is object oriented

  * Classes are keeprs.
  * Multiple inheritance is possible.
  * For starters: All members are public, there are no virtual methods or implicit calling, parent classes are referred by name.

## Bebop supports automatic programming

### Object forking

This gives natural support for (Lamarckian) evolution. A new trait competes with an existing trait, it is some minor mutation ceteris
paribus. This is efficient in speed and resources. The object searches all its "404s" in his parent and uses the "lowest hanging"
implementation of every member.

### Pattern matching

Selecting methods by type as in overloading, but done with type pattern matching. Again, naturally supporting ideas like "executing"
could be "making happen" when applied to "business plan", "running" when applied to "program" and "killing" when applied to "prisoner".

### Alternative function

It should be natural for mutated functions to fail gracefully. One option is calling the "non mutated" function when a function fails and
using its result instead. Even having non informative completely failsafe functions as the last resource make sense. E.g., the function
i_dont_know() returning (boolean) NA for all yes/no questions.

## Automatic parallelization

Automatic parallelization is not as hard as it looks. The thread pool in the server and the server's reentrant code already guarantees that
any n functions can run concurrently in isolation. Making it happen, both locally and globally is just a matter of triggering computation
using the appropriate abstractions:

  * **Locally** (explicitly): Implementing primitives like **map** to functions.
  * **Locally** (implicitly): Classes like JazzColumn, JazzDataframe and JazzFileSystem should use distributing primitives under the hood.
  * **Globally**: JazzCluster, JazzClusterFileSystem, JazzDataframe ...
  * **Cron jobs**: JazzRemoteSource and other classes should be able to "compute on schedule" in parallel with "on demand".

<br/>

| <span class="label label-default">See also ...</span> | | | | | <span class="label label-info">Previous ...</span> |
| [Bebop's vision](vision_bop_fields_contexts.html) | | | | | [Bebop reference main page](reference_bop_top.html) |

{% include links.html %}
