---
title: API reference - Names
summary: Syntax of item, block, kind and tuple names.
sidebar: mydoc_sidebar
permalink: api_ref_names.html
---

{% include important.html content="Jazz is still under development to produce the first Minimum Viable Product (MVP) after the original 0.1.7.
This is incomplete, but what is here is up to date." %}

### Block names

A block name is a sequence of case-sensitive alphanumeric characters or underscores of maximum length MAX_BLOCK_ID_LENGTH - 1 (actually 31)
starting with a letter.

The regex REGEX_VALIDATE_BLOCK_ID validates a block identifier.


<span class="label label-info">R</span>

The new design goes back to the original concept of `C++` and `http`. An R package to manage the `http` client will still be included.

{% include tip.html content="The R package **rjazz** also includes built-in http client support to use the REST API from R." %}

<br/>

{% include links.html %}
