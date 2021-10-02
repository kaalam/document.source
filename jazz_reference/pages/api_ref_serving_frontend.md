---
title: API reference - Using Jazz to serve applications
summary: Setting us Jazz as a server for static objects.
sidebar: mydoc_sidebar
permalink: api_ref_serving_frontend.html
---

## Jazz as a server of static web resources.

Since Jazz is an http server, it would not make much sense to require a different server to serve the static webpages and javascript
created by your favorite frontend development platform such as Flutter/Dart, Angular/Ionic, etc.

Technically, the lmdb database `//lmdb/www` is created to store that material. The static objects are just blocks with some attributes
declared:

* BLOCK_ATTRIB_URL (mandatory) sets the url by which the static is accessed in a GET. The URL should start with a single `/`. Note that
this determines the difference between the Jazz API which always start with `//` or `///` and statics stored in `//lmdb/www`.
* BLOCK_ATTRIB_MIMETYPE (recommended) is the mime type returned by the server to tell the browser what to do with it.
* BLOCK_ATTRIB_LANGUAGE (optional) the international code (like "en-us") defining the language in which the page is written.

## Loading static resource at server start from disk.

You can set up the key STATIC_HTML_AT_START in the server configuration to any folder. On Jazz start, the folder will be recursively
searched and all files will be pushed to `//lmdb/www` with their URL assigned to the relative path that comes after whatever is
STATIC_HTML_AT_START. The mime type will be deduced (for simple files) by the file extension. It will identify: "text/html", "text/css",
"image/png", "application/javascript", "image/jpeg", "image/gif", "image/x-icon", "text/plain; charset=utf-8", "application/json",
"video/mp4", "application/pdf" and "application/xml".

## Uploading the resources via PUT to `//lmdb/www`

You can just create the blocks via a PUT to `//lmdb/www/keyXXX` (any key name) and then, set the attributes as described [here](api_ref_attributes.html).

{% include links.html %}
