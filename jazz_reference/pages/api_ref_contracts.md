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

### .as_cpp()

### .as_json()

### .as_text()

### .blocktype()

### .bytes(\<dimensions\>)

### .\<call\>

### .\<column\>

### .columns()

### .dimensions()

### .events()

### .\<item\>

### .items()

### .kind(\<source|dest\>)

### .length(\<dimensions\>)

### .listen(\<dimensions\>, \<handler\>)

### .meta()

### .mime()

### .\<raw\>

### .shape()

### .size(\<dimensions\>)

### .\<slice\>

### .type()

### .url()


## Contracts for Container and descendants

### (PUT) .assign(\<locator\>, \<rvalue\>)

### (PUT) .from_json(\<locator\>)

### (PUT) .from_text(\<locator\>)

### (PUT) .new(\<locator\>)

### (PUT) .new_tuple(\<locator_1\>, \<locator_2\>, ...)

### (PUT) .set_attributes(\<locator\>, \<rvalue\>)

### .tuple(\<locator_1\>, \<locator_2\>, ...)


<br/>

{% include links.html %}
