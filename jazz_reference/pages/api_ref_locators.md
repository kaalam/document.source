---
title: API reference - Locators
summary: Syntax of local, remote and web container, block, kind and tuple locators.
sidebar: mydoc_sidebar
permalink: api_ref_locators.html
---

{% include important.html content="Jazz is still under development to produce the first Minimum Viable Product (MVP) after the original 0.1.7.
This is incomplete, but what is here is up to date." %}

### Anchors

Three special characters (the anchor) start every `lvalue` and `rvalue`.

| Character | Name | Description |
|-----------|------|-------------|
| `/` | local root | Is the root container of the current node (the only node if a Jazz cluster isn't defined). |
| `@` | forward | Requires forwarding to the appropriate node in the cluster. All `@` requests are transformed to `/` of some node. |
| `$` | ubiquitous | If reading, the resource is everywhere in the cluster (like the cluster definition itself). If writing, it is broadcasted to the whole cluster. |

{% include links.html %}
