---
title: What is the usable part of Jazz today?
summary: Some clues about what is complete, under development and to be done.
sidebar: mydoc_sidebar
permalink: basics_jazz_today.html
---

## What is complete

This page is a snapshot of the current state of development in terms of Jazz modules. It is updated after the completion (meaning
implementation, documentation and testing) of modules and the percentages of executions are rough estimates, except for complete. The
details of development are updated in the [developer's reference](https://kaalam.github.io/develop/)

{% include image.html file="jazz_modules.png" caption="Jazz modules" max-width=880 %}

| Group | Module | Description | Complete |
|-------|--------|-------------|----------|
| elements | jazz_datablocks | Block types and fundamental definitions (C++ interface) | <span class="label label-success">100%</span> |
| elements | jazz_utils | Many utilities to support configuration, logging, etc. | <span class="label label-success">100%</span> |
| elements | jazz_containers | All the fundamental (non persisted) keepers. | <span class="label label-success">100%</span> |
| main | jazz_instances | Instantiation of the classes for the server and the clients. | <span class="label label-success">100%</span> |
| main | jazz_main | Http server implementation. | <span class="label label-success">100%</span> |

## What is still refactoring from Jazz 0.1.x

These modules include code that supports most or all the necessary functionality, but still requires refactoring to the new structures.

| Group | Module | Description | Complete |
|-------|--------|-------------|----------|
| elements | jazz_persistence | The fundamental persisted keepers. | <span class="label label-info">80%</span> |
| main | jazz_restapi | The implementation of the http responses at server level. | <span class="label label-info">60%</span> |

## What is under development

| Group | Module | Description | Complete |
|-------|--------|-------------|----------|
| elements | jazz_classes | An interface simplifying the keeprs for the high level APIs. | <span class="label label-warning">60%</span> |
| elements | jazz_httpclient | Petitions across a Jazz cluster (Jazz calling Jazz). | <span class="label label-warning">40%</span> |
| elements | jazz_stdcore | Arithmetic and logic functions on tensors. | <span class="label label-warning">20%</span> |
| functional | jazz_api | The common part of all (high level) APIs. | <span class="label label-warning">60%</span> |

## What is to be done

| Group | Module | Description | Complete |
|-------|--------|-------------|----------|
| functional | jazz_cluster | Classes related with Jazz clusters. | <span class="label label-danger">5%</span> |
| functional | jazz_filesystem | A class implementing distributed collections of files. | <span class="label label-danger">5%</span> |
| functional | jazz_column | Distributed (replicated) data columns of tensors. | <span class="label label-danger">5%</span> |
| functional | jazz_dataframe | Distributed (replicated) list of data columns. | <span class="label label-danger">5%</span> |
| functional | jazz_bebop | Extending the standard core with oop and support for automation. | <span class="label label-danger">5%</span> |

{% include links.html %}
