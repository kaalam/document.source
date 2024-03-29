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
	<li><a href="/jazz_reference/vision_intro_page.html" class="button small">Technically, what is Jazz?</a></li>
</ul>


<p>In the <a href="/kaalam/2018/10/02/reviewing_the_motive.html"><b>first part</b></a> we identified <b>five opportunities for
improvement</b>. In this post we discuss how Jazz addresses them to better understand why Jazz was created. We avoid getting too
technical here. You can find precise details in the technical documentation.</p>

<h4><b>One:</b> The efficiency of current systems is broken, unless all you need is pushing <b>rectangles</b> into other rectangles.</h4>

<p>Okay, a strong headline. In other words: current platforms are amazing and they can make use of all the hardware you can throw at them
very efficiently, <b>but</b>... When you ask simple questions like <i>"do I really need all the connections?"</i> The answer should not
be: <i>"who cares? the optimization would break if you start cherry picking connections."</i> Well, apparently, <b>the human brain does</b>.</p>

<p>So maybe, we would benefit from "cherry picking" or, in other words, <b>express complex ideas at low level</b>. And by low level, we
mean the "things" that are executed millions of times (per core, thread and second).</p>
<blockquote>
To "express ideas" Jazz provides a full <b>programming language</b>, <a href="/jazz_reference/vision_code_bebop.html"><b>Bebop</b></a>.
This includes expressing knowledge with neural networks, but since it is fast (dynamically linked C++ primitives), it can take the
complexity to the low level without becoming inefficient.
</blockquote>

<h4><b>Two:</b> Current platforms can sometimes be more a hindrance than a help in the exploration of <b>new ideas</b>.</h4>

<h5>
<b>Question:</b> How did the Spanish architect <b>Antonio Gaud&iacute;</b> compute thousands of interrelated parameters to build a
cathedral in the early XX-th century?
</h5>

<div class="row">
<div class="6u 12u$(small)">

<br>

<p><b>Answer:</b> He built a model at scale made of strings and weights putting bullets inside bags and <b>hanged it upside down</b>.
<a href="https://memetician.livejournal.com/201202.html"><b>link</b></a></p>

<br>

<p>This point sounds similar to the previous one, but with a key difference, it targets <b>science</b> rather than <b>technology</b>.
Platforms can act like a hammer looking for everything to be a nail. All our models are differentiable end to end because "we" only want
backprop as a learning mechanism. Should we try RL with tree search, a genetic algorithm or something new, it would get deeply
handicapped by platforms just because it is on the wrong side of the optimization pyramid. And we may give up instead of trying
otherwise.</p>

<p>There is more to AI that just fitting a curve using backprop. If you want to hang you model upside down and efficiently train a language
model where every word or word constituent is a function over a formal field, <b>you need Jazz</b>. As of today, it's either Jazz or ...
<br>
<br>
... nothing else.</p>
</div>
<div class="6u$ 12u$(small)">
<span class="image fit"><img src="/kaalam/assets/images/poly-funicular-miniature.png" alt="" /></span>
</div>
</div>


<h4><b>Three:</b> Current solutions are not giving any thought (at platform level) to efficient <b>quick exploration</b>.</h4>

<p>This is exactly why Jazz was created in the first place. We had to provide analysis based on millions (to billions) of data rows
to thousands of users. The overhead of waiting for queries that took minutes was too much for the average case and the infrastructure
could not handle giving access to querying to thousands of users. We had to focus on partial results taken from random samples and
leveraging cached results as much as possible. Before deciding that we needed Jazz, we wrote code running in the back-end of existing
distributed key-value stores. That almost did the job, but was very short sighted in terms of product life cycle. We learned a lot about
distributing data and, at some point, we found the courage to tell our bosses that we needed to write the storage (almost) from scratch,
in C++, to own a platform to do data computation for the future, <b>in a bank</b>!</p>

<p>We cannot stress more how <b>important this is for AI</b>. Besides having solved this problem in a different domain, We have decades of
AI research behind. Learning is all about verifying hypothesis and confirmation/disproof based of small sets of data can leverage learning
speed orders of magnitude. <a href="/jazz_reference/vision_elements_containers.html"><b>more</b></a></p>

<h4><b>Four:</b> Working with different kinds of <b>data files</b> and <b>services</b> is tedious and error prone.</h4>

<p>Data integration is the ugliest part of data analytics. It is already bad when we only have tabular data. Who knows how many hours are spent
fixing character encodings and date formats. In AI it is even worse, since AI is about "unstructured" data. We have myriads of binary
formats for images, sound, video, text files and more. Some algorithms also expect data to be transformed: images to be scaled, normalized,
etc.</p>
<p>On the other side, we have myriads of tools to do these things that have limitations and different argument syntax. The knowledge on
what to use on what to produce what is stored as human readable text only.</p>

<blockquote>
Making the knowledge <b>machine understandable</b> rather than human understandable makes sense. If there was a universal tool for
this (in the way git is the universal version control system), we wouldn't even mention it. But, there is no such tool. The first thing
we need to make it happen is tagging files with attributes specifying what they are and what tools can produce what and how. In Jazz
files are blocks and blocks have attributes as first class citizen. Just like a web resource has mime types, languages, a url, etc. any
file can have attributes defining what can be done with it.
</blockquote>

<h4><b>Five:</b> We have to build platforms with <b>code generation</b> and <b>lifelong learning</b> in mind.</h4>

<p>Jazz has this double goal: On one side being a highly efficient and reliable <b>data platform</b> to build backend applications on it.
On the other, allow <b>AI research</b> on things that cannot be done efficiently otherwise.
<br>
With Jazz 0.6.x, the first version releasing code execution, the first goal is accomplished. The second one is a never ending path, that
will start with Jazz 0.7.x. In the meantime, we have some proof of concept implementations on automated code generation and published some
work. <a href="/jazz_reference/agency_elements.html"><b>more</b></a></p>
