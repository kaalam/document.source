---
title: Lvalues
summary: API lvalue reference
sidebar: mydoc_sidebar
permalink: reference_api_lvalue.html
---

## Initial definition

In Jazz an **lvalue** is one of:

  * A chain of keeprs abstracted as block ids starting from root ending with the name of a block. They must all exist except, possibly, the last name.
  * A data block that will be returned as a Python object, R object or http (GET) resource.

## Initial caveats

All lvalue assignments are idempotent. Assigning twice has the same effect than assigning once. There is no += operator.

## As implemented

{% include important.html content="NOT DEFINED (currently WiP)" %}

<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [API predicate modifiers](reference_api_predicate_modifiers.html) | | | | | [API rvalues](reference_api_rvalue.html) |

{% include links.html %}
