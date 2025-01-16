---
title: API Reference - Model API
summary: Calling the Models API using the REST API
sidebar: mydoc_sidebar
permalink: api_ref_model.html
---

## The Container `ModelsAPI`

`ModelsAPI` is the container that serves and communicates with the models.

* See C++ ref [ModelsAPI](/develop_jazz02/classjazz__models_1_1ModelsAPI.html)


## Calling ModelsAPI

Calling `ModelsAPI` has four possible forms as explained in [Function calls](api_ref_fun_calls.html). Two forms for getting the result from
either calling exec from a block or a query (a constant included in the API call). Also, the same two forms but assigning the result to a
block in a container.

{% include tip.html content="In a call, the <b>base</b> is `model`, the <b>entity</b> is the specific model you want to use, the <b>key</b> is an <b>entry point</b> to your model (typically a predicate like `run`, `search`, `explain`, ...) and the block (or constant) passed are the arguments, possibly a tuple." %}


### Models in ModelsAPI

The models are created, typically, extending Jazz using [uplifting](/develop_jazz02/uplifting.html) the class `ModelsAPI` just registers
the existing models and forwards the calls to them.


### Entry points in ModelsAPI

The available entry points are specific to the model you are using. Every model will support `run` and `id` entry points.

* See C++ ref [Model](/develop_jazz02/classjazz__models_1_1Model.html)

<br/>

{% include links.html %}
