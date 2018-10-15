---
title: Bebop
summary: Current consensus on how the Bebop vision has to be implemented at compiler/executor level.
sidebar: mydoc_sidebar
permalink: reference_bop_top.html
---

## Implementing Bebop.

{% include important.html content="Bebop is not yet implemented. Needless to say, this reference only reflects current consensus on what
should be implemented to cover all intended functionality while keeping development clean and leveraging on existing OSS solutions
to build in time and quality." %}

## The compiler/execution pipeline.

{% include image.html file="compiler_pipeline.png" caption="Compiler pipeline" max-width=880 %}

This pipeline shows the main compiler and executor logic. Note that the function is a **JazzBlock** with some attributes that make it
executable. The tensor itself contains the bytecode and the source code is stored as an attribute. The function evaluation is a call to
**BopFunctionCall** with some arguments that are **JazzBlock** descendants (including the bytecode) and producing a new **JazzBlock**.

## The compiler.

<span class="label label-info">BopLexer</span>
<span class="label label-info">BopParser</span>
<span class="label label-info">BopCodeGen</span>

The compilation is triggered automatically when the execution of the bytecode fails, possibly because it was never compiled before.

{% include tip.html content="Bytecode contains references to blocks to maximize efficiency rather than just sequences of owner names.
When these references are no longer valid, a new compilation may find updated ones or fail." %}

A successful compilation is a sequence of BopLexer, BopParser and BopCodeGen returning no errors.

### BopLexer

The lexer tokenizes the source code removing remarks and space. It identifies names, numbers and operators. It is created using
[flex](https://en.wikipedia.org/wiki/Flex_(lexical_analyser_generator)). The intermediate TL (Token List) is passed to BopParser
instead of the source code. It is not stored in the **JazzBlock**.

### BopParser

The parser interprets the operators, absence of operators, parentheses and precedence rules to create a sequence of instructions
to apply. Note that these instructions refer to names whose type are yet unknown or may not even exist. That is why it is called
"abstract". Imagine the expression "a = b + c*d" produces: "take c, take d, multiply, take b, add, assign to a" but before that
can be executed, we need to find what are a, b, c and d, if they exist at all, if multiply and add are defined for these types,
if the tensor shapes are compatible to be multiplied, etc. The AST (Abstract Syntax Tree) is passed BopCodeGen instead of the TL.
Again, it is not stored in the **JazzBlock**. The parser is built using [GNU Bison](https://en.wikipedia.org/wiki/GNU_bison).

### BopCodeGen

And finally the code generator creates the bytecode. It takes this list of constants and names and finds how to assign them to existing
resources: blocks, standard core functions, other functions, etc. It will resolve the owning sequences like "a.b.c" by finding the JazzKeepr
a who owns b who is also a JazzKeepr and owns c. It will reference a.b.c by a safe pointer to c. When that safe pointer is no longer usable,
the execution of the function will trigger a new compilation. It will also use the aliases declared in the source code and the standard
library, aliases of operators, etc.

## Calling Bebop functions.

<span class="label label-info">BopFunctionCall</span>

As mentioned above, this is the simplest part. A function evaluation takes a **BopFunctionCall** with a JazzBlock that contains the source
code as an attribute and may contain updated bytecode. The process is designed in a similar way to a cache, if the bytecode can execute, it
does, else the block is compiled. Except for debugging purposes, this is the way to compile Bebop code. The function produces a block
that will normally be stored by a JazzKeepr. All the function arguments (possibly including an implicit argument with the class) are
passed too.

<br/>

| <span class="label label-default">See also ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [Bebop's vision](vision_bebop.html) | | | | | [Language basics](reference_bop_basics.html) |

{% include links.html %}
