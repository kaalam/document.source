---
title: API reference - Names
summary: Syntax of item, block, kind and tuple names.
sidebar: mydoc_sidebar
permalink: api_ref_names.html
---

## Name

### Definition of name

A name is a string of letters, numbers and underscores, starting with a letter, up to 31 characters long.

The regex REGEX_VALIDATE_NAME validates a name. See [search for REGEX_VALIDATE_NAME](/develop_jazz02/namespacejazz__elements.html).

Names are combined to form locators as referenced [here](api_ref_locators.html).

### Use of names

Names are use in all these places:

Parser state | Reserved base names
------------ | ----------------------------------------------------------------
BASE_NAME | Is the first name in both an `L-value` and an `R-value`, always followed by `/`.
CONTAINER_NAME | Anything (possibly nothing) between the base name and the block name, separated by `/`. There is a limit of MAX_NESTED_CONTAINERS to how many names can be defined before a block name.
BLOCK_NAME | The last name in an `L-value` or the last name **not** followed by `/` in an `R-value`
CONTRACT_NAME | A name following a block name or another contract name separated by a `.` There is a limit of MAX_CONTRACTS_IN_R_VALUE to how many contracts can be chained to a block.
KIND_NAME | In a constant defining a Kind, the first name. It is identified by being the only name followed by a double colon `::`. See [constant kind](api_ref_const.html).
ITEM_NAME | Is the name of an item (some tensor) inside a constant defining a kind or a tuple. It is followed by a single colon `:`.
DIMENSION_NAME | In a constant defining a Kind, a dimension of a tensor that is defined by a name instead of by its value. E.g., `width`, `height` in [constant kind](api_ref_const.html).
TYPE_NAME | In a constant defining a Kind, the cell type of a tensor. E.g., `BYTE_BOOLEAN`, `INTEGER`, `TIME`, `DOUBLE`, etc.

<br/>

{% include links.html %}
