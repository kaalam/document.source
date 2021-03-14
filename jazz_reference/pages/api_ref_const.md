---
title: API reference - Constants
summary: Syntax for defining constant blocks, kinds and tuples.
sidebar: mydoc_sidebar
permalink: api_ref_const.html
---

{% include important.html content="Jazz is still under development to produce the first Minimum Viable Product (MVP) after the original 0.1.7.
This is incomplete, but what is here is up to date." %}

## Constants

### Definition

A constant is a string in a query that defines a tensor, tuple or kind. If parsed successfully, it will be converted into a one shot block
and will be used in a contract (block slicing, function call or assignment).

## Constant tensors

Constant tensors can only have three possible types: integer (CELL_TYPE_INTEGER), double (CELL_TYPE_DOUBLE) or string (CELL_TYPE_STRING).

### Syntax

They have a shape defined by the sequence of square brackets E.g., [[[1,2],[1,2]],[[1,2],[1,2]],[[1,2],[1,2]]]. The shape must be
consistent. E.g., [[1,2],[3]] produces PARSE_ERROR_INVALID_SHAPE.

The type is inferred from the content. Outside string cells, url-encoding is not allowed and any character that is not a number, a point,
a space, a square bracket or a comma produces a PARSE_ERROR_INVALID_CHAR.

#### Type string

The type string is inferred by the use of double quotes `"` bounding each element. Tensors of type string require all their cells to be
of type string. Strings support url-encoding starting with a `%` for all character sizes in utf8. A url-encoded double quote `"` (`%22`)
is not parsed as the beginning or end of an element which provides a mechanism to include double quotes inside the string.
A use of the `%` char that does not form a valid (possibly multi-byte) url-encode (E.g., 1 byte `%81`, 2 bytes `%C6%92`,
3 bytes `%E2%80%A6`) produces PARSE_ERROR_ENCODING. When parsing a tensor of strings (inferred from the first element) any
element that is not a string will produce PARSE_ERROR_NOT_A_STRING.

#### Type double

The type double is inferred by the use of the decimal point `.` in a number, otherwise the number is an integer. Any number of the tensor
being a double makes the whole tensor of type double.

<br/>

{% include links.html %}
