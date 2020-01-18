---
title: Block constructors
summary: Definition of Block constructors
sidebar: mydoc_sidebar
permalink: reference_api_block_constructors.html
---

{% include note.html content="We already have enough to implement a simple version of this." %}

## Legacy Jazz

  * Jazz < 0.2.0 has a way to declare sequences based on the logic of R's rep() function, but with no support for sequences.
  * The functionality is implemented for vectors and should trivially generalize for tensors.
  * When this is implemented, **shape inference** as described [here](reference_bop_basics.html#bebop-makes-things-easy) has to be implemented.


<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [API elements](reference_api_elements.html) | | | | | [API block selections](reference_api_block_selections.html) |

{% include links.html %}
