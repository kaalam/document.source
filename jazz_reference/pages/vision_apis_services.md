---
title: APIs and Services
summary: What is Jazz (part 4) Introducing the architecture.
sidebar: mydoc_sidebar
permalink: vision_apis_services.html
---

{% include callout.html content="And finally, **the API**. Thanks for reading this far !!" %}

## Other relevant classes required to understand the architecture

{% include important.html content="This forth vision page completes the architectural vision at the moment of inception. Some of the internal layers are just drafts for the moment but are included to show the place they fit in. This page will probably interest you if you plan to hack with the source code. You can probably skip it otherwise."%}

## Services

## Instances

## The API

## Jazz source code project organization

The source code is organized in four layers, corresponding to folders in the project (+ includes and third part) and to the yellow columns in the diagram below.

{% include image.html file="jazz_modules.png" caption="Jazz modules" max-width=880 %}

### Jazz elements

In this folder (right on the diagram, lowest level in terms of dependencies) we have the basic classes we have seen so far in the previous pages. The **Formal Field** implementation. Completing this layer is top priority and most of the content is already written requiring some degree of refactoring.

* [The current state of development](vision_blocks_containers.html)
* [Developer documentation](vision_bop_fields_contexts.html)

### Jazz innate

Abusing the "innate vs. acquired" postulate, we group all the content of **standard (innate) fields** in this folder. The content is inherited by the **learned (acquired) fields**. This includes from low hanging fruit like file format converters, arithmetic, algebra to geographic information, English grammar, vocoders, etc. To be curated as Jazz is used in both research and industrial projects.

### Jazz learn

We want Jazz to have learning algorithms we know well and have experience using/coding. Mostly in the field of **reinforcement learning**. This includes experimenting on agency. Again, to be curated as projects are implemented.

### The server

From version 0.4.x on, as we did in the original pre-2018 Jazz, we want this layer to be complete as a priority. We want the whole development to be driven by functional testing an processing. Again, this layer was already complete in the 2018 version but requires refactoring.

{% include links.html %}
