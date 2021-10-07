---
title: API reference - Block and tuple slicing
summary: Filtering rows from a Tensor and selecting items from a Tuple.
sidebar: mydoc_sidebar
permalink: api_ref_slicing.html
---

## Operations on Blocks applicable through rest API calls

{% include important.html content="These operations only apply to GET (and therefore HEAD) calls." %}

## Selecting an item from a `Tuple`

This operation returns an item from a Tuple as a Tensor, instead of the whole tuple.

The syntax is giving the item name after a colon `:` in `///node//base/entity/key:item_name`.

## Selecting rows from a `Tensor`

In a Tensor, the first dimension in the shape is referred to as the **row**. I.e., a tensor of shape `[30, 16, 5]` is stored as if it was
30 tensors of shape `[1, 16, 5]`. You can select rows in a Tensor to get a smaller tensor. This operation is extremely efficient and done
inside the containers without creating a copy of the block. In this way, you can read 2Kb from a 50Mb block in lmdb storage without
creating any copy of the original block, just creating the new 2Kb block.

The tensors used as selectors are known as `filters`. Filters are just tensors with the right shapes and ranges. A filter can be:

* A vector of boolean whose size is the number of rows to be filtered.
* A vector of sorted integers in the range of the number of rows to be filtered.

### Applying the selection from the rest API

Can be done by either an existing block or a constant. E.g.,

* `//lmdb/my_ent/block_1[//queue/filters/filter_1]`
* `//lmdb/my_ent/block_1[&[1,3,5]]`

{% include note.html content="In a filter constants are not terminated by a `;` but by the closing square bracket." %}

<br/>

{% include links.html %}
