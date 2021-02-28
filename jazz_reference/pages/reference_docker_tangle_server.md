---
title: Jazz (TNG) The Tangle Server
summary: Updated reference of The Tangle Server
sidebar: mydoc_sidebar
permalink: reference_docker_tangle_server.html
---

{% include callout.html content="**Jazz à la carte** is intended to be a series of Jazz servers maintained as Docker images through
continuous integration including such things as \"voice recognition\", \"text to speech\", etc. This is the second member of the
series." %}

## What is **The Tangle**

It is an entangled collection of English text: books, wikipedia articles, movie subtitles and also dictionaries (wordnet) ...

## Datasets included in the current version

### Wordnet

### Jeopardy! questions

### English Wikipedia

### Project Gutenberg

### +++

## How to check for the latest version?

Follow [this link](https://hub.docker.com/r/kaalam/jazz_tangle/tags/) and note the version number.

## How to run it

{% include important.html content="This is the first docker image available soon! (On the fist Jazz 0.5.x MVP.)" %}

## Can I build applications on top of it?

Yes. That is the intention. Just start your Dockerfile with:

```docker
FROM kaalam/jazz_tangle:latest

```

<br/>

{% include links.html %}
