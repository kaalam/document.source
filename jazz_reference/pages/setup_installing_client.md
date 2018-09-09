---
title: Installing a Jazz client
tags: [Jazz, Installation]
keywords:
summary: "Installing an R or Python client with or without a Jazz server"
sidebar: mydoc_sidebar
permalink: setup_installing_client.html
folder: setup
---

## Creating tooltips
Because this theme is built on Bootstrap, you can simply use a specific attribute on an element to insert a tooltip.

Suppose you have a glossary.yml file inside your \_data folder. You could pull in that glossary definition like this:

{% raw %}
```html
<a href="#" data-toggle="tooltip" data-original-title="{{site.data.glossary.jekyll_platform}}">Jekyll</a> is my favorite tool for building websites.
```
{% endraw %}

This renders to the following:

<a href="#" data-toggle="tooltip" data-original-title="{{site.data.glossary.jekyll_platform}}">Jekyll</a> is my favorite tool for building websites.

{% include links.html %}
