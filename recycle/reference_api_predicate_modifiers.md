---
title: Predicate modifiers
summary: Reference for predicate modifiers
sidebar: mydoc_sidebar
permalink: reference_api_predicate_modifiers.html
---

## MVP

The only predicate with modifiers in the MVP is PUT.

  * `?(if_exists)` Does the PUT operation only to replace a block, not to create a new one.
  * `?(if_new)` Does the PUT operation only if the block does not exist.

{% include note.html content="The modifier is written immediately before the Lvalue." %}


<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [API predicates](reference_api_predicates.html) | | | | | [API lvalues](reference_api_lvalue.html) |

{% include links.html %}
