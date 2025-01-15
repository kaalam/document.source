---
title: Welcome to Jazz!
summary: This is the reference documentation for Jazz (the server) intended for end users. This includes introducing the server, the API and the docker images.
sidebar: mydoc_sidebar
permalink: index.html
---

Thank you for your interest in Jazz, this is the Jazz server's reference manual.

{% include important.html content="Jazz is still under development. Since version 0.5.1, everything in jazz_elements and the server itself
are stable. More modern interfaces keep backwards compatibility, but add ONNX and Bebop (a language that compiles to ONNX) on top of it.
If you plan to use ONNX, you need a version >= 1.25.1. If you also want models, you need a version >= 1.25.2.
To keep up with Jazz development, see
[Programming documentation for the Jazz Server](https://kaalam.github.io/develop_jazz02/index.html)." %}

## Basic Questions on Jazz

* [What is the vision?](vision_intro_page.html)

## Using Jazz

* [How Can I Start with Jazz?](using_jazz_start.html)
* [How Can I Compile Jazz?](using_compile.html)
* [How Can I Extend Jazz?](using_extend.html)

## Contributing to Jazz

* [What kind of skills can be helpful?](contributing_welcome_all.html)

## References

* [Bebop Reference](bop_reference.html)
* [Models Reference](models_reference.html)
* [API reference and clients](api_ref_intro.html)
* [Server internals and setup](reference_server_setup.html)

{% include links.html %}
