---
layout: post
title: Why Jazz?
description: Jazz in 500 words
image: assets/images/pic01.jpg
---
<blockquote>
<dl>
	<dd>
		<p>“A lot of people think that performance is about doing the same thing, just doing it faster. And that's not true! If you can do something really fast, really well, people start using it differently."</p>
	</dd>
	<dt>Linus Torvalds, one of the few actual creators of game-changing tools, including Linux and git.</dt>
</dl></blockquote>


<h3>Does AI live in the (technological) perfect world most proclaim?</h3>

AI is living the most exciting moment in decades and all the necessary tools to explore, train and deploy deep learning models are free software. They combine highly optimized low level CPU and GPU software that is responsible for 99.9% of the execution with highly productive scripting languages that, of course,  could be optimized, but at the price of making them less productive. Who would want to optimize 0.1 of the execution time? Even making it 1000 times faster would just reduce 100 seconds to 99.9001. So, we do live in a perfect world ...

 
<h4>... except for</h4>
<ol>
	<li>This way of thinking assumes we already know what to run in that 99.9% of the time. Actually, we don't. And our current platforms are a major hindrance in the exploration of new ideas.</li>
	<li>Furthermore, they treat problems like a hammer. Everything is a nail, begging for fully connected layers and huge matrix multiplications. In many cases, the active connections in a fully connected layer are less than 0.1%. So there is space for optimizing orders of magnitude after all.</li>
	<li>It is true that we have amazing free software tools to process all kinds of data. But, since we have not advanced much in persistent data abstractions since 1950 (yeah, <b>the file</b> was invented in 1950), it is hard for a machine to reason about how to apply these tools seamlessly. Creation of data pipelines is tedious and error prone and can be automated.</li>
	<li>Scripting languages are great for exploring ideas. But, when we want to convert our pipeline into a product, we probably want to get rid of them. After all, we use Python to express ideas that are executed in thread-safe machine code. Once that code is created, we don't need Python anymore.</li>
	<li>We live in a multi-channel connected world, anyone knows. And current platforms already have REST APIs. But, when the backend is a hive of data services, interpreters, virtual machines, etc. the optimization argument we started with no longer holds. Now, the lightweight, single process, unlimited threads backend that simply doesn't need all these things wins by orders of magnitude.</li>
</ol>

Anyway, we don't want to sound like we own the truth, we are just starting, we need as much help as we can get. We happen to have solutions that can lead the next generation of AI applications a quantum leap forward. And we offer them to the community the only way we know: by making the software open, the engines and research reproducible and everything ready to try. With simple one liners you can: run a server from docker hub, install a Python package with pip or an R client from cran.

Before we even raised the first euro, we have enough of the product have <b>you</b> to decide by yourself if you want to use it or be part of it. And you can decide that using the simplest method: <b>trying out Jazz</b>.

Keep reading, if that makes sense.
