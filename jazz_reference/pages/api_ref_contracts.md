---
title: API reference - Block and Container contracts
summary: Item, Block, Kind, Tuple, Column, Table, Flux, Container, Volatile, Remote and Persisted contracts
sidebar: mydoc_sidebar
permalink: api_ref_contracts.html
---

{% include important.html content="Jazz is still under development to produce the first Minimum Viable Product (MVP) after the original 0.1.7.
This is incomplete, but what is here is up to date." %}

## What are contracts?

API-wise, contracts act like a methods of an object. See [this](api_ref_intro.html) and [this](api_ref_modules_.html) for a more detailed
explanation. In the following lists, contracts without \< and \> should be written just "as is". Others, like .\<call\>, .\<item\> have
their syntax explained below. All contracts are GET (or any read predicate), except those marked as (PUT).

## Contracts for Block and descendants

### .as_cpp

.as_cpp    | Return the C++ interface of a Kind
---------- | ----------------------------------
Applies to | A `Kind` or `Tuple`.
Returns    | A compilable C/C++ `struct` that allows writing C/C++ code accessing all the data in every Tuple of that Kind.
Notes      | This is used by Bebop to support kernel writing in C++ and also underlies the just-in-time linking of Tuples.


### .as_json

### .as_text

### .blocktype

.blocktype | Return the fundamental block type: tensor, filter, kind or tuple
---------- | ----------------------------------------------------------------
Applies to | Any `Block descendant`.
Returns    | A `string` with the one of the four possibilities (tensor, filter, kind or tuple).
Notes      | This just gets the attribute BLOCK_ATTRIB_TYPE of the block. Many complex classes are tuples, `.type` gets the class name.


### .bytes(\<dimensions\>)

### .\<call\>

### .\<column\>

### .columns

### .dimensions

### .events

### .\<item\>

### .items

### .kind(\<source|dest\>)

### .length(\<dimensions\>)

### .listen(\<dimensions\>, \<handler\>)

### .meta

### .mime

### .\<raw\>

### .shape

### .size(\<dimensions\>)

### .\<slice\>

### .type

.type      | Return the name to the cpp class stored as the block
---------- | ----------------------------------------------------
Applies to | Any `Block descendant`.
Returns    | A `string` with the name.
Notes      | This just gets the attribute BLOCK_ATTRIB_TYPE of the block.


### .url

.url       | Return the static http url assigned to a block
---------- | ----------------------------------------------
Applies to | A `Block`. Most likely a file == vector of CELL_TYPE_BYTE with some mime type.
Returns    | A `string` with the url without the http://server part. Static http resources are not sharded.
Notes      | This just gets the attribute BLOCK_ATTRIB_URL of the block.


## Contracts for Container and descendants

### (PUT) .add_base(\<name\>)

### (PUT) .add_container(\<name\>)

### (PUT) .assign(\<locator\>, \<rvalue\>)

### (PUT) .from_json(\<locator\>)

### (PUT) .from_text(\<locator\>)

### (PUT) .new(\<locator\>)

### (PUT) .new_tuple(\<locator_1\>, \<locator_2\>, ...)

### (PUT) .set_attributes(\<locator\>, \<rvalue\>)

### .tuple(\<locator_1\>, \<locator_2\>, ...)


<br/>

{% include links.html %}
