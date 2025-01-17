---
title: Customizing Jazz for Production - Uplifts
summary: What is Jazz (part 6) - Uplifts and customizations for production
sidebar: mydoc_sidebar
permalink: vision_uplifts.html
---

## Uplifting Jazz

{% include callout.html content="<b>Uplifting</b> is the process of implementing a descendant of a class in another source tree
–and possibly under a different license– while still instantiating it in a (customized) Jazz server. The source of the uplifts is
located below the uplifts folder in the Jazz source tree and will typically have its own version control repository." %}

### Why Uplifts?

In the future, Jazz may be extended using other mechanisms such as plugins. For now, extending Jazz is limited to compiling the whole
source tree. What uplifting provides is a may to make **configuration of everything seamless** and to support **updating both parts
independently**. In practice, uplifting boils down to automatically configuring the source tree to use the uplifted classes which are
descendants of the original classes where the original classes would otherwise be used.

### What can be uplifted?

There are two classes that are intended to be uplifted:

  * `ModelsAPI` will be uplifted typically only as a class that registers all your models as it starts and is otherwise identical to
	the original class. This way, **you can create as many custom Models as you wish** and have them available in the Jazz server.
  * `API` the API that the server exposes to the outside world. The original class lets everything through, (although some options can
	be disabled via configuration) which is typically insecure. To implement a secure API with token-based authentication, restricted
	entry points, filter by IP, ... you will need to uplift this class. Of course, you could also obtain the same result by adding
	some reverse proxy in front of the Jazz server, but that complicates deployment.

## Hot to Uplift

  * See [extending Jazz](using_extend.html) for a general overview of how to extend Jazz.

<br/>

| <span class="label label-default">Previous ...</span> |
| [Code Automation](vision_models.html) |

{% include links.html %}
