---
title: Extending Jazz in Bebop, R and Python
tags: [Jazz, Customization]
keywords:
summary: "Adding functions written in Bebop, R and Python to the Core"
sidebar: mydoc_sidebar
permalink: customization_scripting.html
folder: customization
---


## Generating a list of all pages with a certain tag

If you don't want to link to a tag archive index, but instead want to list all pages that have a certain tag, you could use this code:

```html
{% raw %}Getting started pages:
<ul>
{% assign sorted_pages = site.pages | sort: 'title' %}
{% for page in sorted_pages %}
{% for tag in page.tags %}
{% if tag == "getting_started" %}
<li><a href="{{ page.url | remove: "/" }}">{{page.title}}</a></li>
{% endif %}
{% endfor %}
{% endfor %}
</ul>{% endraw %}
```

Here's the result:

Getting started pages:

<ul>
{% assign sorted_pages = site.pages | sort: 'title' %}
{% for page in sorted_pages %}
{% for tag in page.tags %}
{% if tag == "getting_started" %}
<li><a href="{{ page.url | remove: "/"}}">{{page.title}}</a></li>
{% endif %}
{% endfor %}
{% endfor %}
</ul>

{% include links.html %}
