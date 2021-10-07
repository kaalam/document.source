---
title: API reference - Constants and %-encoding
summary: Syntax for defining constant blocks, kinds and tuples.
sidebar: mydoc_sidebar
permalink: api_ref_const_encoding.html
---

## General API structure

### Name definition

A `Name` is a string of letters, numbers and "-_~" up to 31 characters long. There is an exception with the decimal "." that is acceptable,
but only in a real number, not everywhere. The special "~" indicates a command, although that is `base` dependent. If the base does not
interpret it as a command, it could be just a key. E.g., in "//tree/my_game/node51~parent", "~parent" is a command, but in
"//lmdb/my_game/node51~parent", "node51~parent" is just a key. Commands, if they exist, are detailed in the reference of each base.

Everything in the API follows the `///node//base/entity/key++` format, where:

 * "///node" is an optional reference to a Jazz node in the cluster to which the call will be forwarded, otherwise the node to which you are
connecting will handle the call.
 * "++" refers to something else (function call, slicing, etc. that is explained below.)
 * "node", "entity" and "key" are names.
 * "base" is a known base inside a `Container`: 0-mq, file, bash, http, index, tree, queue, deque, lmdb, core, ...

## Constants

Constants are the exception to the `///node//base/entity/key++` format. They are delimited by `&;` as in `&this%20is%a%20constant;` and
since they are part of a url, must be [%-encoded](https://en.wikipedia.org/wiki/Percent-encoding). Any character that is not RFC 3986
section 2.2 or RFC 3986 section 2.3 must be percent encoded. You can write utf-8 by just %-encoding all the characters.

{% include important.html content="As an exception to this rule, In a function call or a filter, constants are not terminated by a `;`
but by the closing `)` or `]`." %}


There are two types of constants:

* Internally, Jazz can serialize any Block as text, or make a Block from parsing that text. The text representation of a block can be passed to the API as a constant.
* URLs of external sources (E.g., a third part API) or file names, which can be very long, are constants even if they could match the
requirements of a `Name`.

## How constants fit in

There are four ways to insert a constant in an API call:

* After the base, instead of the `/` `//file&any_%_encoded_path;` or `//http&http://my_api.org/something;`
* In a block slice `//base/entity/key[&[2,4,6]]`
* In a function call `//base/entity/key(&[2,4,6])`
* In an assignment `//base/entity/key=&[2,4,6];`

## Constant Syntax

Obviously, the constants that are urls or filenames will be passed to whatever service or file system expects them and that will define
their syntax.

The constants that are blocks have the following syntax:

### Tensors

They have a shape defined by the sequence of square brackets E.g., `[[[1,2],[1,2]],[[1,2],[1,2]],[[1,2],[1,2]]]`. The shape must be
consistent. From an API call you can create tensors of CELL_TYPE_INTEGER (if no number has a decimal point, CELL_TYPE_DOUBLE, if any
number has a decimal point, and CELL_TYPE_STRING by quoting every element) as in `["1","two","THREE"]`. String serialization supports
common C escape sequences like \n, \t, \\", \\\\, \x3f, etc.

### Kinds

A `Kind` is defined inside surrounding `{}` characters including all metadata. Inside the kind, each item is comma separated and defines
the item name, type and shape. Valid types are: "INTEGER", "DOUBLE", "BYTE", "STRING", "BOOLEAN", "SINGLE", "TIME", "LONG_INTEGER",
"BYTE_BOOLEAN", "FACTOR" and "GRADE". Dimensions are just names (without quotes) inside the shape.

E.g., `{"palette" : BYTE[10, height, num_col], "time" : TIME[3], "author" : STRING[40], "filter" : SINGLE[height, height, 3]}`

**Note 1**: The dimension `height` appears 3 times in the Kind. A tuple of this kind can have any value for `height`, but must have
the same value in the three places, otherwise it is not a tuple of this kind.

**Note 2**: We do not %-encode the spaces for readability, but they should be in an API call.

### Tuples

A `Tuple` is defined inside surrounding `()` characters including item names and data. Inside the tuple, each item is comma separated
and defines the item name and content. In an API call the types of the tensors are determined using the same rule explained for tensors.

E.g., `("weights" : [[17, 170], [112, 54], [207, 149]], "built" : [2021-08-01 07:13:14, NA], "author" : ["Billy Doe"])`

**Note 1**: The type TIME cannot be used directly like this from the rest API because of how types are automatically determined for tensors.
From the C++ API if the Kind is given and the item "build" has the type TIME, this can be serialized as it is.

**Note 2**: We do not %-encode the spaces for readability, but they should be in an API call.

<br/>

{% include links.html %}
