---
title: A quick R walkthrough without a Jazz server
tags: [Jazz, R]
keywords:
summary: "How Jazz can be used in R without a server or reactively called by a server"
sidebar: mydoc_sidebar
permalink: rjazz_walkthrough_client_only.html
---

## About Liquid and conditional statements
If you want to create different outputs for different audiences, you can do all of this using a combination of Jekyll's Liquid markup and values in your configuration file. This is how I previously configured the theme. I had different configuration files for each output. Each configuration file specified different values for product, audience, version, and so on. Then I had different build processes that would leverage the different configuration files. It seemed like a perfect implementation of DITA-like techniques with Jekyll.

## Conditions versus includes

If you have a lot of conditions in your text, it can get confusing. As a best practice, whenever you insert an `if` condition, add the `endif` at the same time. This will reduce the chances of forgetting to close the if statement. Jekyll won't build if there are problems with the liquid logic.

If your text is getting busy with a lot of conditional statements, consider putting a lot of content into includes so that you can more easily see where the conditions begin and end.

{% include links.html %}
