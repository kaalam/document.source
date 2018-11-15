---
title: Block attributes
summary: Block attribute details
sidebar: mydoc_sidebar
permalink: reference_api_block_attributes.html
---

{% include note.html content="Internal attributes are used implicitly all the time for such tings as declaring classes and as part of the http
protocol. The attribute API may not be required at all and is defined as a neat way to explicitly read and write attributes." %}

## Attribute reference

Attributes are C++ std::map for integer to std::string. The constants are created in reserved ranges. The declarations are [here](/develop_jazz02/jazz__containers_8h.html).

| Attribute range base | Description |
|-----------|------|
| BLOCK_ATTR_BASEOF_PERSISTENCE | Base of attribute keys in jazz_persistence.h |
| BLOCK_ATTR_BASEOF_HTTPCLIENT | Base of attribute keys in jazz_httpclient.h |
| BLOCK_ATTR_BASEOF_CLASSES	| Base of attribute keys in jazz_classes.h |
| BLOCK_ATTR_BASEOF_STDCORE	| Base of attribute keys in jazz_stdcore.h |
| BLOCK_ATTR_BASEOF_CLUSTER | Base of attribute keys in jazz_cluster.h |
| BLOCK_ATTR_BASEOF_FILESYSTEM | Base of attribute keys in jazz_filesystem.h |
| BLOCK_ATTR_BASEOF_COLUMN | Base of attribute keys in jazz_column.h |
| BLOCK_ATTR_BASEOF_DATAFRAME | Base of attribute keys in jazz_dataframe.h |
| BLOCK_ATTR_BASEOF_BEBOP | Base of attribute keys in jazz_bebop.h |
| BLOCK_ATTR_BASEOF_RESTAPI | Base of attribute keys in jazz_restapi.h |
| BLOCK_ATTR_BASEOF_EXTENSIONS | Base of attribute keys from C++ extensions |


## Attribute API

  * get_block_attributes()
  * set_block_attributes()

  See [jazz_api.h](http://localhost:8888/develop_jazz02/jazz__api_8h.html) for details.

<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [API block selections](reference_api_block_selections.html) | | | | | [API predicates](reference_api_predicates.html) |

{% include links.html %}
