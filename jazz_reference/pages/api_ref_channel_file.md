---
title: API reference - Channel base file
summary: Api Reference for the base "file" inside the container Channels
sidebar: mydoc_sidebar
permalink: api_ref_channel_file.html
---

## The Container `Channels`

`Channels` is a container doing block transactions across media (files, folders, the bash shell, http urls and zeroMQ servers). This
includes keeping a cluster of Jazz nodes as a whole where every node is aware of all the others and queries can be forwarded by just
including the node name. Any imaginable communication channel, including writing files and pushing them to github (using git in the bash
shell) is accessible. This includes all protocols supported by zeroMQ and libCURL.

* See C++ ref [Channels](/develop_jazz02/classjazz__elements_1_1Channels.html)

## The base `file`

This read/writes/deletes to the filesystem. Since the API does not use locators, there is no hardcoded name restriction. Via the http
server, just use the URL (&...;). Remember to %-encode whatever http expects to be encoded. E.g., get("//file/&whatever%20you%20want;").
Note that "//file/" is a mandatory prefix, therefore "//file/aa" is "aa" and //file//aa" is "/aa".

get() gets files as arrays of byte and folders as an Index (the keys are file names and the values either "file" or "folder"). put() writes
either Jazz blocks with all the metadata (if mode == WRITE_EVERYTHING) of just the content of the tensor (if mode == WRITE_TENSOR_DATA).

WRITE_ONLY_IF_EXISTS and WRITE_ONLY_IF_NOT_EXISTS work as expected. remove() deletes whatever matches the path either a file or a folder
(with anything inside it).

new_entity() creates a new folder.

## In terms of the Jazz server API

GET `//file&relative_path;` or GET `//file&/absolute_path;` gets the files as vectors of byte and the folders as tuples where the key is
the file name and the value is either "file" or "folder".

PUT `//file&relative_path;` or PUT `//file&/absolute_path;` writes blocks (the tensor only) to file.
GET `//file&relative_path;.new` or GET `//file&/absolute_path;.new` creates a new folder just like any `//base/entity.new` call.

DELETE `//file&relative_path;` or DELETE `//file&/absolute_path;` deletes either a file or a folder with anything in it.

For more advanced control, load the files into `Volatile` or `Persisted` with an assignment call.

<br/>

{% include important.html content="file operation must be enabled via configuration by setting ENABLE_FILE_LEVEL to 0 (disable everything),
1 (just read), 2 (cannot override == no remove and WRITE_ONLY_IF_NOT_EXISTS) or 3 (enable everything)." %}

{% include links.html %}
