---
title: API, Services, Instances, etc.
summary: What is Jazz (part 5) More on the architecture.
sidebar: mydoc_sidebar
permalink: vision_apis_services.html
---

{% include callout.html content="Thank you for for reading this far. This final page on the vision covers some necessary not yet mentioned elements." %}

## Other relevant classes required to understand the architecture

{% include important.html content="This fifth vision page completes the architectural vision at the moment of inception. Some of the internal layers are just drafts for the moment but are included to show the place they fit in. This page will probably interest you if you plan to hack with the source code. You can probably skip it otherwise."%}

## Services

In Jazz, the class `Service` provides the necessary abstractions to deal with parts that will be instantiated and configured. Services have things such as: configuration files, loggers and are instantiated. In Jazz, services allocate most of the memory. Services include things like the http server itself and the classes that return any container.

## Instances

Since Jazz is an http server, resource allocation serves thousands of clients per node. The server's RAM space is distributed in a configurable way among its services. Every service has just one instance of it per node. These instances of all the classes derived from `Service` and some simple ones like a logger or a system timer available to all classes are the instances that are **created as global variables** and exist through the life of the server. That's what is meant by **instances** in Jazz terms.

<br/>

| <span class="label label-default">Previous ...</span> |
| [Agency - Code Automation](vision_agency_code.html) |

{% include links.html %}
