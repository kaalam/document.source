---
title: Rvalues
summary: API rvalue reference
sidebar: mydoc_sidebar
permalink: reference_api_rvalue.html
---

## Initial definition

In Jazz an **rvalue** is one of:

  * A block constructor. A constant expression that can be used to build a block from it.
  * Chains of keeprs abstracted as existing blocks starting from root. This includes functions and blocks passed as arguments to functions.
  * A combination of the previous two.

## Initial caveats

A data block that will be passed as a Python object, R object or http (PUT) resource.
A delete predicate. This deletes the corresponding lvalue.
Since the API has to be REST compatible and is intended for using over a network.

All rvalue evaluations are safe. They cannot have side effects. Function calls cannot have side effects.

## As implemented

{% include important.html content="NOT DEFINED (currently WiP)" %}

<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [API lvalues](reference_api_lvalue.html) | | | | | [API main](reference_api_top.html) |

{% include links.html %}
