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
<br/>

{% include links.html %}
