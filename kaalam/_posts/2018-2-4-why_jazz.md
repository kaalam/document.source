---
layout: post
title: Why Jazz?
description: Why we need another platform in 800 words
image: assets/images/pic01.jpg
---
<blockquote>
<dl>
	<dd>
		<p>“A lot of people think that performance is about doing the same thing, just doing it faster. And that's not true! If you can do something really fast, really well, people start using it differently."</p>
	</dd>
	<dt>Linus Torvalds, one of the few actual creators of game-changing tools, including Linux and git.</dt>
</dl></blockquote>


<h3>Does AI live in the perfect world many people just presume?</h3>

AI is living the most exciting moment in decades. All the necessary tools to explore, train and deploy deep learning models are free software. They combine highly optimized low level CPU and GPU software with highly expressive and productive scripting languages on top
of it that allows AI researchers to implement new ideas and publish new results every day at an unprecedented pace.

So we may think current platforms like Tensorflow, Keras, MxNet, ... are all we need to create the advances AI needs, including such things as:

<ul>
	<li>Applying reinforcement learning outside highly abstract fields like board games. As Trump would put it: Making Tree Search great again!</li>
	<li>Learning with something else than Gradient Descent.</li>
	<li>Learning with something else than fully connected layers.</li>
	<li>Exploring ideas with the right amount of data naturally. Even with a billion rows, many conclusions can still be drawn from hundred cases or less.</li>
	<li>Creating semantic representations that do not make AI look stupid to laymen as soon as the initial "wow" fades out.</li>
	<li>Finding safe and automated ways to work with all kinds of data sources.</li>
	<li>Supporting scaling and the creation of APIs in a natural automatic and intuitive way.</li>
</ul>

In normal software development, when we have something like the current platforms where 99% of the execution is done with highly
efficient and optimized code and 1% with highly productive scripting languages that allow expressing complex ideas, we are living in the perfect world. Does this apply to AI? Are we living in the perfect world?

<h4>maybe not, considering ...</h4>
<ul>
	<li>This way of thinking assumes we already know what to run in that 99% of the time. Actually, we don't. And our current platforms are a major hindrance in the exploration of new ideas.</li>
	<li>Furthermore, they treat problems like a hammer. Everything is a nail, begging for fully connected layers and huge matrix multiplications. In many cases, the active connections in a fully connected layer are less than 0.1%. So there is space for optimizing orders of magnitude after all.</li>
	<li>It is true that we have amazing free software tools to process all kinds of data. But, since we have not advanced much in persistent data abstractions since 1950 (yeah, <b>the file</b> was invented in 1950), it is hard for a machine to reason about how to apply these tools seamlessly. Creation of data pipelines is tedious and error prone.</li>
	<li>Scripting languages are great for exploring ideas. But, when we want to convert our pipeline into a product, we probably want to get rid of them. After all, we use Python to express ideas that are executed in thread-safe machine code. Once that code is created, we don't need Python anymore.</li>
	<li>We live in a multi-channel connected world, anyone knows. And current platforms already have REST APIs. But, when the back-end is a hive of data services, interpreters, virtual machines, etc. we are nowhere near a 99% highly optimized code. Now, the lightweight, single process, unlimited threads back-end that simply doesn't need all these things wins by orders of magnitude.</li>
</ul>

So when we accept that we don't yet know how to do the things in our first list, trying to implement them in scripting languages is definitely a bad idea. Throwing hardware at the problem only makes it less obvious. In the end you may get far enough to publish a result and that's all you needed to get your PhD. Huge hardware requirements is just another name for irreproducible and you make be okay with that, but ideas will only be adopted when they are implemented efficiently.

Implementing from scratch (using libraries, of course) in C++ (or, say, go), produces some notable products, but only a fraction of researchers know C++, from those only a fraction understands the CPU well enough to write efficient and safe code. And most have deadlines.
When they finish their PhD, they leave some thousands of undocumented lines of code full of technical debt behind and move on.

Anyway, we don't want to sound like we own the truth, we are just starting, we need as much help as we can get. We happen to have solutions that can lead the next generation of AI applications a quantum leap forward. And we offer them to the community the only way we know: by making the software open, the engines and research reproducible and everything ready to try. With simple one liners you can: run a server from docker hub, install a Python package with pip or an R client from cran.

Before we even raised the first euro, we have enough of the product to have <b>you</b> decide by yourself if you want to use it or be part of it. Just use the simplest method: <b>give Jazz a try</b> and decide by yourself.

Keep reading, if that makes sense.
