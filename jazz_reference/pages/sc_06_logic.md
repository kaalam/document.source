---
title: Logic Operations
tags: [Jazz, Standard Core]
keywords:
summary: "Jazz Standard Core - Logic operators"
sidebar: mydoc_sidebar
permalink: sc_06_logic.html
folder: sc
---

## Theme options
You can choose a green or blue theme, or you can create your own. In the css folder, there are two theme files: theme-blue.css and theme-green.css. These files have the most common CSS elements extracted in their own CSS file. Just change the hex colors to the ones you want.

In the \_includes/head.html file, specify the theme file you want the output to use &mdash; for example, `theme_file: theme-green.css`. See this line:

```html
<link rel="stylesheet" href="css/theme-green.css" />
```

## Theme differences
The differences between the themes is fairly minimal. The main navigation bar, sidebar, buttons, and heading colors change color. That's about it.

In a more sophisticated theming approach, you could use Sass files to generate rules based on options set in a data file, but I kept things simple here.

{% include links.html %}
