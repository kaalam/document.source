---
title: Relations and the Finder
summary: What is Jazz (part 3) How fields stick together, relations and the Finder.
sidebar: mydoc_sidebar
permalink: vision_relations_finder.html
---

## Introducing Relations

The class `Field` is the implementation of the idea of **Formal Fields**. For now, we said they are "something like OOP classes", but each of them has a language, Bebop, defined by a set of functions inherited from other fields or extended in Bebop. We also mentioned that anything, including a poem in English or a video is Bop source code in some `Field` and may be compiled to bytecode, but we did not explain how that works.

To truly understand the notion of **Formal Fields** and how that is very different from classes, the first important idea to understand is that **computation does not really happen in the fields**, instead, **it happens in the connections between one field and another**.

{% include important.html content="We have to build Jazz before we can experiment most of the learning ideas. The resulting algorithms will be published over time. For now, we will give some examples."%}

{% include tip.html content="Our first paper on **Formal Fields** is currently in preparation. To be submitted early March 2020. Stay tuned!"%}

Imagine a simple voice commanded system that just understands commands like "turn on the light". It will have some `Field` named **"SoundWave"** that holds vectors of 16 bit integers at speech frequency, say 44 kHz. **"SoundWave"** itself is happy to just contain data of the right shape and type, it does not know how to do anything with it.

There is another `Field` named **"Vocoder"** that knows how to store a tuple of (fundamental frequency, envelope, aperiodic components at a lower frequency, say 100 Hz). There is a `Bond` from **"SoundWave"** to **"Vocoder"** that, with some parameters executes the code from **"SoundWave"** into **"Vocoder"**.

Later, a `Field` named **"PhoneticFrames"** has a `Bond` from **"Vocoder"** that guesses most likely models. Then, a `Field` named **"Text"** guesses about the code in **"PhoneticFrames"**. Finally, a `Field` named **"Actions"** guesses from another `Field` named **"English"** that itself guesses form **"Text"**, ...

We use the word "guesses" intentionally to indicate that the posterior likelihood is key in disambiguating imperfect matches in the bonds. The whole chain of bonds acts as if it was a direct bond from **"SoundWave"** to **"Actions"** and is called a `Compound`.

A simpler type of bonds, that can only succeed of fail (disk full, etc.) and have no learned parameters is called a `Way`. There could be a way from **"SoundWave"** to **"MP3file"** that would just be a "save as mp3" function.


{% include image.html file="jazz_relation.png" caption="Relations between any two Fields" %}


## Introducing The Finder

{% include image.html file="jazz_finder.png" caption="The Finder, a Chart of all Fields and Relations" %}

A complete `Chart` (A `Chart` is a `Container` that holds graphs efficiently) of all the `Field` descendants and all their ways and bonds is updated automatically by the classes at Jazz node level and is known as the `Finder`.

Because finding working `Compound` chains is not as easy as finding paths in graphs, compounds need to be learned. A special multi-path chain of bonds, named a `Kinship` is required by some `Compound` identifying algorithms yet to be published.

<br/>

| <span class="label label-default">Previous ...</span> | | | | | <span class="label label-info">Next ...</span> |
| [Bebop, Fields and Contexts](vision_bop_fields_contexts.html) | | | | | [APIs and Services](vision_apis_services.html) |

{% include links.html %}
