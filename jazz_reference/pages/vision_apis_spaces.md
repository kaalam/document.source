---
title: Abstracting Containers - APIs and Spaces
summary: What is Jazz (part 3) - Spaces provide convenient data abstraction and APIs expose many Containers in one
sidebar: mydoc_sidebar
permalink: vision_apis_spaces.html
---

## APIs and the BaseAPI class

Jazz has a [customizable](vision_uplifts.html) http API. This API abstracts over all the Containers in the system. The `BaseAPI` class is
the base class for all APIs in Jazz. This allows Bebop to use the API at the lower level (Container and blocks), the intermediate level
(Spaces) and the higher level (Bebop itself).

{% include tip.html content="BaseAPI makes the Jazz Container API available to Bebop." %}

* See C++ ref [BaseAPI](/develop_jazz02/classjazz__bebop_1_1BaseAPI.html)
* See the programming reference document on how BaseAPI is used [here](/develop/rfc2/services_apis.html)

## Spaces

A `Space` is an abstraction over multiple blocks in a way that allows accessing its data in more user friendly ways. Spaces are not
Containers, they are more lightweight and provide an interface to the data that reminds of SQL, (FROM, SELECT, WHERE). Spaces use
containers to store both data and metadata.

* See C++ ref [Space](/develop_jazz02/classjazz__bebop_1_1Space.html)

## DataSpaces

A `DataSpaces` is a `Service` that stores all the `Space` descendants that store metadata. DataSpaces are used to store data in a way that
is more user friendly (abstracts Block locators using a FROM/SELECT/WHERE/AS query style) than using Containers.

`DataSpaces` is the `Service` that contains multiple data spaces (`Space` descendants) that can be configured to do:

* Sharding across a cluster of Jazz nodes
* Embeddings (vectors that represent data) including conversion of data into an embedding, search by embedding or by nearest neighbors.
* Key-value storage
* Times series storage for continuous storage of historical data

DataSpaces return iterators over the rows returned as tuples. DataSpaces also provide ETL support for populating the tables,
replication, etc.

* See C++ ref [DataSpaces](/develop_jazz02/classjazz__bebop_1_1DataSpaces.html)

## Fields

A `Fields` (the `Service` that stores all the formal fields) it stores Snippets in fields (namespaces). I has the formal (Bebop)
definitions of a system.

* See C++ ref [Fields](/develop_jazz02/classjazz__bebop_1_1Fields.html)

## Snippets

Besides storing general application data, Jazz can store code. Code comes in different flavors, the simplest is a `Snippet`.
A `Snippet` is Tuple that contains Bebop code that can be compiled. Snippets also store the ONNX "executable", computation graph that
can be run using ONNX runtime.

* See C++ ref [Snippet](/develop_jazz02/classjazz__bebop_1_1Snippet.html)

## Concepts

A `Concept` is a `Snippet` descendant that composes with other Concepts to create many possible Snippets. It can contain more than one
snippet that will be used in combination to generate code. For example, you can view the words in an English sentence as Concepts.
Concepts have many possible definitions of each word, the composition of words represents a space of possible programs in which the
resolver, which is a `Model` will search write Snippets, run and evaluate them, and use the best-so-far as the current way to understand
a problem defined as a sequence of Concepts.

{% include tip.html content="Concepts are the building blocks of automated code generation using the Jazz resolver/compiler framework." %}

* See C++ ref [Concept](/develop_jazz02/classjazz__models_1_1Concept.html)

## SemSpaces

`SemSpaces` (the service that stores semantic spaces) is a `Fields`-descendant that stores Concepts instead of just Snippets. A semspace
(semantic space, a namespace inside SemSpaces) can be an English dictionary, like SPEED (Small Preserved Everyday English Dictionary) or
the state of the knowledge of an agent. SemSpaces have multiple inheritance, this way an agent can have its own knowledge stored as a
difference from the general knowledge his class of agents share.

* See C++ ref [SemSpaces](/develop_jazz02/classjazz__models_1_1SemSpaces.html)

## See also

* Jazz Services, APIs and Instantiation [here](/develop/rfc2/services_apis.html)


<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [Elements - Containers](vision_elements_containers.html) | | | | | [Onnx and Bebop](vision_code_bebop.html) |

{% include links.html %}
