---
title: API, Services, Instances, etc.
summary: What is Jazz (part 4) More on the architecture.
sidebar: mydoc_sidebar
permalink: vision_apis_services.html
---

{% include callout.html content="Thank you for for reading this far. This final page on the vision covers some necessary not yet mentioned elements." %}

## Other relevant classes required to understand the architecture

{% include important.html content="This forth vision page completes the architectural vision at the moment of inception. Some of the internal layers are just drafts for the moment but are included to show the place they fit in. This page will probably interest you if you plan to hack with the source code. You can probably skip it otherwise."%}

## Services

<span class="label label-info">Service</span>

In Jazz, the class `Service` provides the necessary abstractions to deal with parts that will be instantiated and configured. Services have things such as: configuration files, loggers and are instantiated. In Jazz, services allocate most of the memory. Services include things like the http server itself and the classes that return any container.

{% include tip.html content="E.g., A Chart container is created by asking the service Charts to create a new Chart."%}

Services are available via API and can be called from C++, Bop and http.

## Instances

Since Jazz is an http server, resource allocation serves thousands of clients per node. The server's RAM space is distributed in a configurable way among its services. Every service has just one instance of it per node. These instances of all the classes derived from `Service` and some simple ones like a logger or a system timer available to all classes are the instances that are **created as global variables** and exist through the life of the server. That's what is meant by **instances** in Jazz terms.

## The API

Remember "anything is a block", "blocks have identifiers" and "blocks have owners"? Well, putting all that together with some simple syntax, joined by characters that make the whole thing readable and http compatible, is what the http API is about. These locators are available from C++, Bop and http. Functions are also blocks and function calls use parenthesis and comma separated arguments as you would expect.

* The details in [API reference](api_ref_elements.html)

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

<br/>

| <span class="label label-default">Previous ...</span> |
| [Relations and the Finder](vision_relations_finder.html) |

{% include links.html %}
