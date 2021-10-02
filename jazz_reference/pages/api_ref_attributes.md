---
title: API reference - Attribute calls
summary: Reading and writing Block Attributes
sidebar: mydoc_sidebar
permalink: api_ref_attributes.html
---

## Reading Block Attributes

Attributes of a block can be read by GET-ing from `///node//base/entity/key.attribute(123)`. Attributes are maps from integer to string.
The codes from the attributes can be found [here](/develop_jazz02/types_8h_source.html).

Most attributes have user defined codes, the lower codes are:

```c
#define BLOCK_ATTRIB_EMPTY     0   ///< The block has no attributes
#define BLOCK_ATTRIB_BLOCKTYPE 1   ///< The fundamental block type: Tensor, Kind or Tuple.
#define BLOCK_ATTRIB_SOURCE    2   ///< The location of the source set by Channels, also ..
#define BLOCK_ATTRIB_DEST      3   ///< The location of the destination. Less frequent, ..
#define BLOCK_ATTRIB_MIMETYPE  4   ///< The mime type (can also be some proprietary file ..
#define BLOCK_ATTRIB_URL       5   ///< A url for the server to expose the file by.
#define BLOCK_ATTRIB_LANGUAGE  6   ///< An http language identifier that will be returned ..
```

## Writing Block Attributes

Programmatically, you can assign blocks to attributes, form the rest API, setting attributes only supports constants.

* GET `//lmdb/www/blk_idx=//file#~/hello/index.html;`
* PUT `//lmdb/www/blk_idx(4)=#text/html;`
* PUT `//lmdb/www/blk_idx(5)=#/hello/index.html;`
* PUT `//lmdb/www/blk_idx(6)=#en-us;`

This short sequence, assuming the file "~/hello/index.html" exists, will make it accessible at `/hello/index.html` in the server.

<br/>

{% include links.html %}
