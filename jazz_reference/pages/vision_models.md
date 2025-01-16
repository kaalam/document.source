---
title: Adding Intelligence - Code Automation
summary: What is Jazz (part 5) - Models that write, run and evaluate code
sidebar: mydoc_sidebar
permalink: vision_models.html
---

## Basic Intelligence Engineering Concepts

Despite the publications representing results of different stages of the research,

  * 2020 [Formal Fields: A Framework to Automate Code Generation Across Domains](https://arxiv.org/abs/2007.14075)
  * 2021 [The Tangle: A Connected Dataset of English Grammar and Curated Text](https://raw.githubusercontent.com/kaalam/kaalam/master/the_tangle.pdf)
  * 2023 [Lifelong Formal Modeling Agents -- Definitions and Implementation Strategies ](https://openreview.net/forum?id=1FE3reKlJN)

two years after the last publication, there is no white book titled "The Intelligence Engineering Handbook", our limited resources
do not allow us to divert much from software development for now and we communicate just through reference manuals.

The exact implementation of Models in Jazz 1.25.2 is not yet available. We only define high-level ideas for now and will provide
implementation details in the future.


### Intelligence is conversion into form

Form is **unambiguous definition**: basically, code, also mathematics (the science of formal systems as defined by Haskell Curry), but also
a fully defined ruleset of a game, a law, a chemical process, ...

Saying that intelligence is **building models**, **finding patterns**, **solving IQ tests**, ... are different ways of saying the same
thing. Other definitions of intelligence do not fit ours, just like other definitions of "energy" or "gene" do not fit those of physics
or molecular biology. It is okay, we need an actionable and useful definition, not a philosophical one. Something that can be implemented.
If our definition happens to miss something fundamental, we will find out soon enough. But if we pretend not to know and say "intelligence
is hundreds Nobel prizes away", we will never get there.


### The two worlds: formal and informal

The conversion from source into execution is done by a **compiler**. That is the Bebop-25 world of the previous page.

The conversion from data into form is done by a **resolver**. Resolving is an optimization problem. Optimization is what computers
undeniably understand as argued long time ago since the Formal Fields paper and before. See "Towards a pragmatic definition of
understanding".

The process of resolving is done by a `Model` in Jazz terms. A `Model` is a program that writes, runs and evaluates code.


### Again, we write Jazz because we need Jazz

We need **Jazz 1.25.2** because it allows extension by uplifting to research the next generation of ideas. We have been researching
intelligence engineering since since 2017 and before and look forward to having the tool we need.


## Stay tuned

{% include image.html file="stay_tuned.png" caption="Stay tuned" %}

<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [Onnx and Bebop](vision_code_bebop.html) | | | | | [Uplifts](vision_uplifts.html) |

{% include links.html %}
