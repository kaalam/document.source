---
title: Bebop, Fields and Contexts
summary: What is Jazz (part 2) Introduction to Bebop, fields and contexts.
sidebar: mydoc_sidebar
permalink: vision_bop_fields_contexts.html
---

## What is that "Jazz Magic"?

Until now, we introduced blocks, storage and containers that somehow (we will get there) are accessed via http. That part is just a very efficient and hopefully simple way to manage already known things. The basement of Jazz so to say. The question is still: "why bother using Jazz instead of any other platform with more traction that implements these things?" Hint: Efficiency and simplicity alone are not good enough reasons.

Before we talk about `Field`, `Relation`,`Context` and some other classes, we need to explain where we want to go. What we want to build is a platform that does distributed computation building on top of simple programs (functions).

You can look at artificial neurons as programs, they are, and at deep learning (DL) as "software 2.0", that has been said already. Does that mean we will never need anything other than DL? DL can find incredible functions matching images into labels, text into sound waves, ... what not.

But, imagine for now we just want to code a known equation, say the fundamental equation of thermodynamics. Given enough data, we can get an acceptable approximation with millions of parameters. Aside from size and efficiency, the model comes with absolutely no warranty, especially for out of distribution data and no interpretability. Each time we have to introduce any change and train again, we have to "rediscover thermodynamics". Actually, a less general, less precise and less computationally efficient version of it.

Of course, we don't need to use deep learning for that, we can use any back-end programming language and have a human code the equation for us. Nothing new under the sun.

Why choose? **That's the point**. We want to build a computing framework that can be coded by humans, thus creating simple and efficient programs. But we want these programs to also be learned. We want a framework that can be coded, in a language that is **safe enough to explore automatic programming** while being **extensible enough to use natural language as code**.

In the outworn debate between "symbolic" and "connectionist", again: why choose? Knowledge can be built as networks of symbols, but not symbols that only have meaning for humans, grounded symbols, **symbols that can be executed as code** and queried. Because growing as networks of programs is the natural way, this is connectionism. In fact, it extends connectionism beyond deep learning since the architecture is also learned. Let's assume that "deep learning" is defined as "anything based on differentiable end-to-end learning", which of course is an objectionable definition, but allow us to oversimplify for now. The reason why DL needs being differentiable is because anything that cannot do gradient based optimization is too slow to work. And that is true, but only if you need to train millions (or billions) of parameters from scratch each time you train. Living systems don't do that.

Until now, **"lifelong learning"** is just an aspiration with no real content. Maybe, that's what we should learn from living things.

We want to learn these programs, which is why we need efficient persistence to support their lifecycle. But we do not want to learn them through SGD, that's why we don't need the differentiable part. We want to learn few parameters at a time.

**Caveat**: Automatic programming has been the holy grail of AI since the times of von Neumann. Minsky even stated that von Neumann's architecure was created with the intention to do automatic programming *(previous architectures had a hard code/data separation and code was not modifiable while running)*. Other languages, including Lisp, clearly had automated programming in mind when designed.

The search space is virtually infinite, **why do you want to fail again?**

The search space is virtually infinite in all interesting problems, including those already solved, and anyway, it is much smaller than that of deep learning, since programs are much shorter than weight vectors. The size of the search space is only an obstacle in problems that can only be approached from the uniform distribution like cryptographically safe one-way functions. Automatic coding can be approached from many fields including genetic programming, evolutionary algorithms, compositionality and more. We also have some examples of success, including humans. Even if **abiogenesis** is still an unsolved problem, something finally managed to automatically build the code of some primordial cell. Let's put it this way: It's easier than abiogenesis because we can hack as much as we want instead of waiting for the universe to solve it for us.

So we do not build Jazz with the intention of creating conscious robots in five years. We build it because, worst case, we have a lightweight efficient framework to express distributed data processing problems that will make lots of things happen. We build it because, if not built, we cannot research the ideas we want to research to advance the field of automatic programming. Ultimately, we build it because we dream of Jazz becoming a "failure" like von Neumann's architecture or Lisp.

## Introducing Bebop

<span class="label label-info">Bebop</span>

Jazz has a programming language called **Bebop** (or simply **Bop**).

{% include important.html content="Bebop is work in progress. The reference is included in its source code and available via the [developer documentation](/develop/). Coding safety mechanisms are explained in a paper to be shared soon."%}

{% include image.html file="jazz_bebop.png" caption="Bebop" %}

### Bebop operates at source and bytecode level

After years considering different designs (starting after years trying to use existing languages) we picked a design that extremely simplifies parsing while extending Bop to make it as simple as natural language or multimedia sources. The price is, at least for the moment, you cannot code in Bop without understanding its **bytecode**. Bytecode is just a name, actually it is a vector or 32 bit integers with a special attribute identifying the owning `Field`. Positive numbers define functions, negative numbers define arguments (this includes constants, local variables, values passed by reference, constants passed by reference, etc.). The bytecode is executed as a stream of function calls with arguments passed on a stack. Conditionals jumps are supported via special functions.

Bebop compiles anything to **bytecode** on request. Of course, many times it will fail, that is part of the game. Anything includes blocks containing binary files. Take a block containing an .mp3 compressed audio file. A `Field` named "wave data" could compile the file resulting in a function call that takes the file as an argument an decompresses it into a vector of integers.

Besides anything potentially being considered **code**, Bop has a source code (text identified by a special attribute) that is just a human friendly way to manage the bytecode including basic things as: comments, includes, variable names, brackets to define code blocks, but not much more.

### Bebop is object oriented (in its own way)

Anything provided by OOP: organization, abstraction, inheritance is provided by the class `Field`. This makes it unnecessary to build again classes in Bop as contemplated by previous designs. Inheritance is multiple, this implies creating a virtual `Field` which is the union of the inherited fields. It also creates new bytecode key assignment.

### Bebop is functional

In the sense that functions (bytecode) can be passed as arguments to functions and returned by functions. Also, blocks are immutable, reads are safe, writes are idempotent. It is not purely functional since side effects are possible because arguments can be passed by reference. It is up to the user to decide to make it purely functional or not.

### Bebop is safe

Bop supports both static and dynamic analysis of its own code. Static allows analyzing the code without running it. The mechanism implemented is described in a paper that will be shared soon. Dynamic allows defining alternative code in case of failure, called forking a function.

### Bebop forks

Pure functions can be forked from other pure functions. A **forked forked** points to its ancestor which can be called as an alternative in case the function raises an error. This requires functions to be pure functions (not have arguments passed by reference). This mechanism enormously simplifies the implementation of genetic algorithms by "undo mutation on error".

### Automatic function result caching

Pure functions can be optionally cached (memoized) by a directive. This makes caching simple, reliable and potentially hugely profitable. Function caching can also be used as a algorithmic strategy as in **dynamic programming**.


## Introducing Fields

<span class="label label-info">Field</span>

As mentioned, a `Field` is an abstraction that has many of the features classes have in OOP. It is also similar to a package or library. Some STL fields will include efficient functions to do arithmetic, algebra, text manipulation, etc. Fields can also be purely created in Bop. Fields relate to each other, not just by a DAG like code dependencies, but by and arbitrary complex graph of `Field` relations. Reading the next page on relations will shed light on the role fields play in Jazz.

{% include image.html file="jazz_field.png" caption="Field class" %}

## Introducing Contexts

<span class="label label-info">Context</span>

A `Context` can be seen as an actionable log file. This is a requirement for reproducibility and is also required to compare learning methods. The precise definition of a context will surely change over time. So take `Context` informally as "everything required to reproduce a result". It could be a conversation with a chatbot, a text corpus used to answer questions, ... Ideally, in a format like a macro that records and plays back interactions, possibly one by one, with the same or different code.

{% include image.html file="jazz_context.png" caption="Context class" %}

<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [Blocks, Storage and Containers](vision_blocks_containers.html) | | | | | [Relations and the Finder](vision_relations_finder.html) |

{% include links.html %}
