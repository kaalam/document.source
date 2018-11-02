---
layout: post
title: How is Jazz a solution
description: What precise ideas included in Jazz are improvements over current platforms?
image: assets/images/top_solution.jpg
---
<div id="main" class="alt">
<section id="one">

<h4>Related pages</h4>
<ul class="actions vertical small">
	<li><a href="/kaalam/2018/10/02/reviewing_the_motive.html" class="button small">Part 1 the Motive for Jazz</a></li>
	<li><a href="/jazz_reference/basics_jazz_vision.html" class="button small">Technically, what is Jazz?</a></li>
</ul>


<p>In the <a href="/kaalam/2018/10/02/reviewing_the_motive.html"><b>first part</b></a> we identified seven opportunities for improvement. In
this post we discuss how Jazz addresses those issues to better understand why Jazz was created at all. We also add three extra questions that
are directly related with Jazz's vision and, hopefully, help clarifying it. We apologize for getting <b>a bit technical</b>, in the end it
is a debate on technical solutions to technical problems.</p>

<h4><b>One:</b> The efficiency of current systems is broken, unless all you need is pushing <b>rectangles</b> into other rectangles.</h4>

<p>Okay, it is a strong headline, but it means: when you train and predict using deep neural networks, current platforms are amazing and
they can make use of all the hardware you can throw at them very efficiently. When you ask simple questions like <i>"do I really need all
the connections?"</i> you could argue <i>"For training I do, how else would I know which ones are useless until I train?"</i> and it sounds
like a fair point, but for prediction, defining <b>useless</b> as a connection that can never make a change in the final result because of
its weights: <i>"Do I have 1% of useless connections or 99%?"</i>. The answer could be <i>"who cares? the optimization would break if you
start cherry picking connections."</i> Well, apparently, <b>brains do</b>.</p>
<p>So maybe, we would benefit from cherry picking as we mention in issue three. But, for the moment, let's say we need the <b>power
to express complex ideas at low level</b>. And by low level, we mean the "things" that are executed millions of times (per core, thread and
second) rather that those that get executed thousands of times or less.</p>
<blockquote>
And by "express ideas" we mean, provide a <b>programming language</b>. Of course, extending the standard core in C++ is also an option
in some cases, but that is too hard for most users. And only few things make sense in a <b>standard core</b> by definition.
<b>Jazz has a full language</b> not just a way to define combinations of primitives constrained by requirements such as differentiability.
<a href="/jazz_reference/vision_bebop.html"><b>Bebop</b></a>
</blockquote>

<h4><b>Two:</b> Current platforms can sometimes be more a hindrance than a help in the exploration of <b>new ideas</b>.</h4>

<p>This argument sounds similar to the previous one, but with a key difference, it targets the science rather than the technology.
Platforms can act like a hammer looking for everything to be a nail. All our models are differentiable end to end because "we" only know
backprop as a learning mechanism. Should we try RL with tree search, a genetic algorithm or something new, it would get deeply
handicapped by platforms just because it is on the wrong side of the optimization pyramid.
<h5>Two ideas make Jazz different in this way:</h5>
<blockquote>
<ul>
<li>Jazz provides "out of the box" efficient structures to do things like tree search. This can easily make three orders of magnitude
 (Mevals/sec vs. Kevals/sec) difference.
<a href="/jazz_reference/vision_blocks_keeprs.html"><b>Blocks and keeprs</b></a></li>
<li>Jazz's language, Bebop, is created with automatic programming in mind. It has support for exploring incrementally in a natural way
and trying out without breaking things. It's biological inspiration is more evolution than neurons.
<a href="/jazz_reference/reference_bop_basics.html"><b>Bebop's design ideas</b></a></li>
</ul>
</blockquote>
</p>

<h4><b>Three:</b> Current solutions are not giving any thought (at platform level) to efficient <b>quick exploration</b>.</h4>

<p>This is exactly why Jazz was created in the first place. We had to provide analysis based on millions (to billions) of data rows
to thousands of users. The overhead of waiting for queries that took minutes was too much for the average case and the infrastructure
could not handle giving access to querying to thousands of users. We had to focus on partial results taken from random samples and
leveraging cached results as much as possible. Before deciding that we needed Jazz, we wrote code running in the back end of existing
distributed key-value stores. That almost did the job, but was very short sighted in terms of product life cycle. We learned a lot about
distributing data and, at some point, we found the courage to tell our bosses that we needed to write the storage (almost) from scratch,
in C++, to own a platform to do data computation for the future, <b>in a bank</b>! Jazz uses LMDB as the persistence, but, and here we
join with issue four, Jazz is the only monolithic process.</p>
<p>It is only possible to get access to randomly selected rows of data with zero overhead when the persistence and the computing
platform are the same process.</p>
<blockquote>
Being in the same process is necessary, but not sufficient. The magic comes when <b>selection in a block is a first class citizen</b> as
in Jazz. Also, forcing functions to be "true functions" and caching allows reusing results of computations rather than just rows of data.
</blockquote>
<p>We cannot stress more how <b>important this is for AI</b>. Besides having solved this problem in a different domain, We have decades of
AI research behind. Learning is all about verifying hypothesis and confirmation/disproof based of small sets of data can leverage learning
speed orders of magnitude.</p>

<h4><b>Four:</b> Using <b>external processes</b> for creating REST APIs, storing data or computing with interpreters isn't the fastest choice.</h4>

<p>As we just advanced, at least the persistence and the processing platforms should be the same process if you want to benefit from
fast random access to data. Thanks to C++ and OSS, you can do better than that, you can have your process being a persistence (LMDB),
an http server (libmicrohttpd), an http client (libcurl) and a computing platform. Everything is re-entrant and multi-threaded.
Everything is <b>as fast as it can be built</b>. The first Jazz had an embedded R interpreter, that was kind of a technical "tour de
force", it was very efficient, but single threaded, sort of breaking the whole idea. We resisted as much as we could before accepting
that we had to create another programming language, but finally surrendered.</p>

<blockquote>
In the end, <b>Jazz runs on top of Linux and does not require anything else</b>. It persists data, does computation, scales across a cluster,
and serves final applications that only need a web browser or a mobile phone app to connect to it. Just <b>one monolithic process</b> that
is extremely lightweight and conceptually very simple. Should there be complexity, it is in the application code written in Bebop or
in the front end technologies written for the browser that Jazz only serves.
</blockquote>

<h4><b>Five:</b> Using CPU/GPU to do neural networks while <b>expecting neural networks to do what the CPU does</b> is broken.</h4>

<p>Bla, bla, bla,</p>

<h4><b>Six: Scripting languages</b> are great for exploration. In production, they are slow, memory hungry and challenge the architecture.</h4>

<p>Bla, bla, bla,</p>

<h4><b>Seven:</b> Working with different kinds of <b>data files</b> and <b>services</b> is tedious and error prone.</h4>

<p>Bla, bla, bla,</p>

<h4>Bonus 1: Why on earth do we need another language? Wouldn't x have been a better choice?</h4>

<p>Bla, bla, bla,</p>

<h4>Bonus 2: Why is removing scripting languages an objective?</h4>

<p>Bla, bla, bla,</p>

<h4>Bonus 3: Why should I take your word on efficiency of something you haven't built yet?</h4>

We obviously do not expect to convince most people immediately. As we deliver, we will be able to build apples to apples benchmarks
and hopefully ...


</section>
</div>
