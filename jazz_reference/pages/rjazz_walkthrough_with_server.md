---
title: A quick R walkthrough connecting to a Jazz server
tags: [Jazz, R]
keywords:
summary: "A quick demo on operating a Jazz server via the REST API from R"
sidebar: mydoc_sidebar
permalink: rjazz_walkthrough_with_server.html
folder: rjazz
---

## About content reuse
You can embed content from one file inside another using includes. Put the file containing content you want to reuse (e.g., mypage.html) inside the \_includes/custom folder and then use a tag like this:

{% raw %}
```
{% include custom/mypage.html %}
```
{% endraw %}

With content in your \_includes folder, you don't add any frontmatter to these pages because they will be included on other pages already containing frontmatter.

Also, when you include a file, all of the file's contents get included. You can't specify that you only want a specific part of the file included. However, you can use parameters with includes.

{% unless site.output == "pdf" %}
See the following Jekyll cast for more info about using parameters with includes:

<iframe width="640" height="480" src="https://www.youtube.com/embed/kzpGqdEMbIs" frameborder="0" allowfullscreen></iframe>
{% endunless %}

## Page-level variables

You can also create custom variables in your frontmatter like this:

{% raw %}
```yaml
---
title: Page-level variables
permalink: page_level_variables/
thing1: Joe
thing2: Dave
---
```
{% endraw %}

You can then access the values in those custom variables using the `page` namespace, like this:

{% raw %}
```
thing1: {{page.thing1}}
thing2: {{page.thing2}}
```
{% endraw %}


I use includes all the time. Most of the includes in the \_includes directory are pulled into the theme layouts. For those includes that change, I put them inside custom and then inside a specific project folder.

{% include links.html %}
