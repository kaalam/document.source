---
title: Bebop Reference
tags: [Jazz, Bebop]
keywords:
summary: "How to get oriented with Bebop reference documentation"
sidebar: mydoc_sidebar
permalink: bebop_reference.html
folder: bebop
---

## Image Include Template

Instead of using Markdown or HTML syntax directly in your page for images, the syntax for images has been extracted out into an image include that allows you to pass the parameters you need. Include the image.html like this:

```liquid
{% raw %}
{% include image.html file="jekyll.png" url="http://jekyllrb.com" alt="Jekyll" caption="This is a sample caption" %}
{% endraw %}
```

The available include properties are as follows:

| Property | description |
|-------|--------|
| file | The name of the file. Store it in the /images folder. If you want to organize your images in subfolders, reference the subfolder path here, like this: `mysubfolder/jekyllrb.png` |
| url | Whether to link the image to a URL |
| alt | Alternative image text for accessibility and SEO |
| caption | A caption for the image |
| max-width | a maximum width for the image (in pixels). Just specify the number, not px.|

The properties of the include get populated into the image.html template.

Here's the result:

{% include image.html file="jekyll.png" url="http://jekyllrb.com" alt="Jekyll" caption="This is a sample caption" %}

{% include links.html %}
