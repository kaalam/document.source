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
this post we discuss how Jazz addresses those issues to better understand why Jazz was created at all. We also add one bonus question that
hopefully, helps clarifying Jazz's vision and intentions. We apologize for getting <b>maybe too technical</b>, in the end it is a debate on
technical solutions to technical problems.</p>

<h4><b>One:</b> The efficiency of current systems is broken, unless all you need is pushing <b>rectangles</b> into other rectangles.</h4>

<p>Okay, it is a strong headline, but it means: when you train and predict using deep neural networks, current platforms are amazing and
they can make use of all the hardware you can throw at them very efficiently. When you ask simple questions like <i>"do I really need all
the connections?"</i> you could argue <i>"For training I do, how else would I know which ones are useless until I train?"</i> and it sounds
like a fair point, but for prediction, defining <b>useless</b> as a connection that can never make a change in the final result because of
its weights: <i>"Do I have 1% of useless connections or 99%?"</i>. The answer could be: <i>"who cares? the optimization would break if you
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

<p>As we just mentioned, at least the persistence and the processing platforms should be in the same process if you want to benefit from
fast random access to data. Thanks to C++ and OSS, we can do better than that: we have persistence (LMDB-based), an http server
(libmicrohttpd-based), an http client (libcurl-based) and a computing platform in the same process. Everything is re-entrant and
multi-threaded. Everything is <b>as fast as it can be built</b> and everything, except the computing platform, is broadly used by millions
of users. The original Jazz had an embedded R interpreter. That was some kind of a technical "tour de force", it was very efficient, but
single threaded, kind of breaking the whole idea. Jazz still has direct binary support for R vectors inherited from the original code
base.</p>

<div class="box">
<p><b>We resisted all we could</b> before accepting that we had to <b>create another programming language</b>, but finally
surrendered.</p>
</div>

<blockquote>
In the end, <b>Jazz runs on top of Linux and does not require anything else</b>. It persists data, does computation, scales across a cluster,
and serves final applications that only need a web browser or a mobile phone app to connect to it. Just <b>one monolithic process</b> that
is <b>extremely lightweight</b> and <b>conceptually very simple</b>. Should there be complexity, it is in the application code written in
<b>Bebop</b> or in the front end technologies written for the browser that Jazz only serves.
</blockquote>

<h4><b>Five:</b> Using CPU/GPU to do neural networks while <b>expecting neural networks to do what the CPU does</b> is broken.</h4>

<p>This is kind of waking up from the <i>"GOFAI is the past of AI"</i> dream and finding out that just adding layers to DNN architectures
did not solve the <b>next problem</b>. We could digress a lot on what kind of cognitive functions are like perception and which are like
causal inference and what requires what, but we save it by just stating: as of today, nobody knows how to build human-like reasoning.</p>

<blockquote>
<b>Jazz</b> does not have this problem at all. Jazz has a language that can do arithmetic, logic and everything a CPU can do. It does not
need to "grow a network that multiplies", it can just use the <b>mul</b> instruction. If we let a program learn multiplication, we just
give it the opportunity to "play" with the <b>mul</b> instruction. Digital devices are superhuman doing almost everything they do. The
problem is hard enough to add constraints.
</blockquote>

<h4><b>Six: Scripting languages</b> are great for exploration. In production, they are slow, memory hungry and challenge architecture.</h4>

<p>Despite that being true, it is always possible to argue: <i>"Human hours are more expensive that computing hours."</i> or <i>"Resources
are much better spent building new things than optimizing things that are already good enough."</i> and many other <b>perfect sense making
points</b>. In short: there is not always a compelling reason to "get rid of scripting languages".</p>

<blockquote>
If we implied that <b>Jazz</b> requires getting rid of scripting languages, we apologize, <b>it does not</b>. You can perfectly run
a Jazz solution from Python or R forever if that is what you want.
</blockquote>

<p>Now, look at it form the other side: When you have a working solution, how long does it take to convert that into something lightweight,
parallelized that does not require the interpreter anymore? That is what Jazz development is about, when you have developed your solution
using Jazz, <b>you already have it</b>.</p>

<h4><b>Seven:</b> Working with different kinds of <b>data files</b> and <b>services</b> is tedious and error prone.</h4>

<p>Data integration is ugliest part of data analytics. It is already bad when we only have tabular data. Who knows how many hours are spent
fixing character encodings and date formats. In AI it is even worse, since AI is about "unstructured" data. We have myriads of binary
formats for images, sound, video, text files and more. Some algorithms also expect data to be transformed: images to be scaled, normalized,
etc.</p>
<p>On the other side, we have myriads of tools to do these things that have limitations and different argument syntax. The knowledge on
what to use on what to produce what is stored as human readable text.</p>

<blockquote>
Making the knowledge <b>machine understandable</b> rather than human understandable makes sense to us. If there was a universal tool for
this (in the way git is the universal version control system), we wouldn't even mention it. But, there is no such tool and the first thing
we need to make it happen is tagging the files with attributes specifying what they are and what tools can produce what and how. In Jazz
files are blocks and blocks have attributes as first class citizen. Just like a web resource has mime types, languages, a url, etc. any
file could have attributes defining what can be done with it.
</blockquote>

<p>So, in Jazz we could declare a reference to "a 100x100 scaled image of frame 12345 from a video file inside a .tar.gz file"
the reference could be used as a promise. When the picture is actually needed, the framework extracts the video, uses the appropriate
codec to render the specific frame, scales the image and returns it.</p>

<h4>Bonus question: Why should I take your word about the efficiency of something you haven't built yet?</h4>

We obviously do not expect to convince most people immediately. As we deliver, we will be able to build apples to apples benchmarks
and hopefully ...

</section>
</div>
