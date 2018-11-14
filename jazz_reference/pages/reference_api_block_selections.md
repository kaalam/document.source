---
title: Block selections
summary: Syntax to do block selection as a block modifier
sidebar: mydoc_sidebar
permalink: reference_api_block_selections.html
---

## Internals

Block selection is already implemented, tested and documented of all Jazz elements. The class JazzFilter descending from JazzBlock is a selection.
See [this](/develop_jazz02/classjazz__datablocks_1_1JazzFilter.html) for details.

All block creator have a second form to create the block as a selection from and existing block as in:

```bash
pJazzBlock new_jazz_block (pJazzBlock     p_as_block,
                           pJazzFilter    p_row_filter = nullptr,
                           AllAttributes *att          = nullptr);


pJazzBlock new_jazz_block (int            cell_type,
                           int           *dim,
                           AllAttributes *att             = nullptr,
                           int            fill_tensor     = JAZZ_FILL_NEW_WITH_NA,
                           bool          *p_bool_filter   = nullptr,
                           int            stringbuff_size = 0,
                           const char    *p_text          = nullptr,
                           char           eoln            = '\n');
```

## Syntax



<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [API block constructors](reference_api_block_constructors.html) | | | | | [API block attributes](reference_api_block_attributes.html) |

{% include links.html %}
