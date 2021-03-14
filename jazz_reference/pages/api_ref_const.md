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

## Spacing

Space and tab characters are ignored everywhere except inside a name, a number or the content of a string. The first two result in
PARSE_ERROR_INVALID_CHAR and the third in the space being part of the string.

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

## Constant tuples

A tuple is a tree where each node has name and each leaf is a tensor. Implementation-wise it becomes a vector of tensors where each item
has a depth to keep track of how the tree was defined. To match a Kind, (using the contract .is_a()) that depth is irrelevant. As long
as the item names, types and shapes match (considering variable shapes named dimensions), the tuple can be used (fully linked to the
opcodes expecting a kind).

Therefore, when defining constant tuples, the depth of the node in the tree is not used at all. The tuple is just a succession of item
names and tensors.

### Syntax

The tuple is a succession of item names followed by a colon `:` and a tensor. Note the in one-element tensors, the `[]` can be omitted.

E.g. `wave:[2,3,5],encoding:"json",volume:3.5` is a valid tuple and the same as `wave:[2,3,5],encoding:["json"],volume:[3.5]`.

**Note** that the tuple does not include bounding `[]` or `()`.  `a(.tuple.)` or `a[.tuple.]` are just syntactic sugar for the contracts
\<call\> and \<slice\> respectively.

## Constant kinds

Kinds are like like Tuples with three differences:

- Their tensors do not contain data, only types and shapes.
- Shapes can be defined by integer constants (like in Tuples) or by **dimensions**. (Names that may have different values in different tuples of a kind, but must have the same value in the same tuple when used more than once.)
- Kinds have a name and that name is unique across the whole cluster.

**Note that**: Tuples themselves define a specific kind, but that kind has no name. Tuples can be of more than one Kind: A tuple is of any
kind that matches its item names, types and finds a match for the dimensions. Besides that strict match, Bebop-wise there is also a **numeric typecasting match**. It is possible to use integer as doubles by just creating a copy of the tuple with the appropriate types and linking
to that instead of the original tuple.

### Syntax

E.g., `image::red[width, heigth]:BYTE, green[width, heigth]:BYTE, blue[width, heigth]:BYTE`

Valid types are:

```
// 8 bit cell types
CELL_TYPE_BYTE          - A tensor of unsigned 8-bit binaries. NA is not defined for this type
CELL_TYPE_BYTE_BOOLEAN  - A tensor 8-bit booleans: 0, 1, BYTE_BOOLEAN_NA = NA

// 32 bit cell types
CELL_TYPE_INTEGER       - A tensor of 32-bit signed integers. NA is INTEGER_NA
CELL_TYPE_FACTOR        - A tensor of 32-bit unsorted categorical. NA is INTEGER_NA
CELL_TYPE_GRADE         - A tensor of 32-bit sorted categorical. NA is INTEGER_NA
CELL_TYPE_BOOLEAN       - A tensor of 32-bit booleans: 0, 1, BOOLEAN_NA = NA
CELL_TYPE_SINGLE        - A tensor of IEEE 754 32-bit float (aka single). NA is SINGLE_NA
CELL_TYPE_STRING        - A tensor or 32-bit offsets to immutable strings or STRING_NA or STRING_EMPTY

// 64 bit cell types
CELL_TYPE_LONG_INTEGER  - A tensor of 64-bit signed integers. NA is LONG_INTEGER_NA
CELL_TYPE_TIME          - A tensor of 64-bit TimePoint. NA is TIME_POINT_NA
CELL_TYPE_DOUBLE        - A vector of floating point numbers. Binary compatible with an R REALSXP
```
without writing the CELL_TYPE_ part.

<br/>

{% include links.html %}
