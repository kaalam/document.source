---
layout: post
title: The Motive
description: In terms anyone can understand, what can be improved in current platforms?
image: assets/images/top_motive.jpg
---
<div id="main" class="alt">
<section id="one">

<h4>Related pages</h4>
<ul class="actions vertical small">
	<li><a href="/kaalam/2018/10/04/why_jazz.html" class="button small">I want the short version, why Jazz?</a></li>
	<li><a href="/jazz_reference/vision_intro_page.html" class="button small">Technically speaking, what is Jazz?</a></li>
</ul>

<h2 id="content">An update six years later, January 2025</h2><p>

<p>This post was written a little more than six years ago. It pretty much stood the test of time. Of course, the number of cores in a GPU
is obsolete. The achievements of <b>deep learning</b> have been amazing, we all use LLMs all the time. Platform-wise, other
than price/performance improvement and many small advances, the big picture hasn't changed. We keep it as it is since it helps
understanding that <b>what motivated us in 2018 still does</b>.</p>

<p>Of course, with <b>Jazz 1.25.1</b> around the corner, Jazz is a way around some of these issues that is already practical.</p>


<h2 id="content">AI winter (maybe) coming</h2><p>
<div class="row">
<div class="6u 12u$(small)">
<h3>Does AI live in the perfect world businesses and mainstream media are telling us?</h3>
<p>AI is living the most exciting moment in decades. All the necessary tools to explore, train and deploy deep learning models are free
software. They combine highly optimized low level CPU and GPU software with highly expressive and productive scripting languages on top
of it. This allows AI researchers to try new ideas and publish results every day.</p>
<p><b>Meanwhile, in the same planet ... </b> Most important AI researchers, <i>we just name three to avoid digressing</i>, agree that we still
need drastic changes before we can solve problems such as common sense reasoning and many more. Humans can solve these tasks even as kids.</p>
</div>
<div class="6u$ 12u$(small)">
<blockquote><b>Geoffrey Hinton</b>: "'Science progresses one funeral at a time.' The future depends on some graduate student who is deeply
suspicious of everything I have said."</blockquote>
<blockquote><b>Yoshua Bengio</b>: "Engineers and companies will continue to tune getting slight progress. That's not going to be nearly
enough. We need some fairly drastic changes in the way that we are considering learning."</blockquote>
<blockquote><b>François Chollet</b>: "For all the progress made, it seems like almost all important questions in AI remain unanswered. Many
have not even been properly asked yet."</blockquote>
</div>
</div>

<h2 id="content">The "Good Old Fashioned AI" argument is partial at best</h2><p>
<div class="row">
<div class="6u 12u$(small)">
<h3>Here is how it goes</h3>
<p>We don't cite anyone as its author. The argument just got repeated to the point it is <b>common belief</b>. It goes: <i>"Long time ago,
we as humans coded the solutions to the problems, that's <b>GOFAI</b> (Good Old Fashioned AI), we figured that was a dead end and switched
to end-to-end optimization. Now, data makes the difference, and the machine creates the model using <b>deep learning</b>."</i> Many even
state that, today, major AI players can only be the data owners.</p>

<p>The least important thing is how this argument is deeply misconstrued and unfair to all the researchers and achievements AI produced
for over sixty years ~1950-2013, even if some of these achievements were truly game changing. We all got used to take them for granted.
That's what AI has always been about: the <b>next problem</b>.</p>
</div>
<div class="6u$ 12u$(small)">
<p>The important thing is that even in the fields in which <b>DL</b> (Deep Learning) produced major advances, as in <b>computer go</b> this
vision is partial to the point of not being true. <b>AlphaGo</b>, the program that won against Lee Sedol, the best player in the world, is
a mix of Monte-Carlo Tree Search and DL. Without the DL it is still stronger than almost the whole human population and as strong as the
best professionals in 9x9. With only the DL and no search, it just sucks. It becomes a player that plays strong and elegant moves, but does
not understand <b>why</b> or <b>when</b> they should be played. It is like a person trying to pretend being a physicist by repeating random
phrases taken from academic papers in physics. Being good at <b>predicting the moves of a master</b> is not the same as <b>mastering the
game</b>.</p>

<div class="box">
<p><b>Deep learning</b> is great, but hard problems require more than just DL. You may be think: <i>"I can do other things with current
platforms easily."</i> Well, easily, maybe, but <b>not efficiently</b> which is our point.</p>
</div>
</div>
</div>

<h2 id="content">(Not really) a digression on rectangles</h2><p>
<div class="row">
<div class="6u 12u$(small)">
<span class="image fit"><img src="/kaalam/assets/images/buildings.jpg" alt="" /></span>
<p>We immediately recognize rectangular shapes as man made.</p>
<span class="image fit"><img src="/kaalam/assets/images/panels.jpg" alt="" /></span>
<p>They can be good solutions to optimizing some problem.</p>
<span class="image fit"><img src="/kaalam/assets/images/greenhouses.jpg" alt="" /></span>
<p>Some have more aesthetic value than others.<br/>
And we do not just <b>build objects</b> as rectangles ...</p>
</div>
<div class="6u$ 12u$(small)">
<h4>... we abstract ideas as rectangles</h4>
<ul>
	<li>We build our data sets as rectangles. (like sheets and tables)</li>
	<li>Images and videos are rectangles. (in higher dimension)</li>
	<li>Neural networks are rectangles. (of units)</li>
	<li>Even words in <b>natural language processing</b> are rectangles!</li>
</ul>
<blockquote>
Believe it or not, the latter is true. In the online version of the Cambridge Dictionary, the many definitions of the word <b>do</b> take
442 lines, the word <b>think</b> takes 143. With just 4 you can define <b>pneumonoultramicroscopicsilicovolcanoconiosis</b>. In deep
learning, they all take the same: <b>one row from one rectangle</b>.
</blockquote>
<p>And that, of course, is very good, because <b>humans are very efficient pushing rectangles into other rectangles</b>.</p>
<p>We build rectangular buildings out of rectangular elements, store the energy from the rectangular panels in rectangular arrays of
batteries that, again, are rectangular arrangements of rectangular cells. In AI, we push our data rectangles into rectangular
GPUs where we compute rectangular arrays of artificial neural networks.</p>

<span class="image fit"><img src="/kaalam/assets/images/nvidia2048gpu.jpg" alt="" /></span>
<p>This beauty is a GPU. If you enlarge it, you can count 2048 cores.</p>

<blockquote>
You may be surprised to read that all the 2048 cores of the GPU not just execute the same program, but they do it exactly at the same time.
When one of the cores, as a result of a conditional branch, takes a different logical path, all the other cores wait until it finishes.
Cores can only execute the same instruction as the others or do nothing.
</blockquote>

<span class="image fit"><img src="/kaalam/assets/images/neurons.jpg" alt="" /></span>
<p>And surprisingly, many writers seriously claim that artificial neural networks are biologically inspired. But <b>that</b> would be a
digression.</p>


</div>
</div>

<h2 id="content">So, how is the "perfect world" of AI broken?</h2><p>
<div class="row">
<div class="6u 12u$(small)">

<h3>It is broken in different ways:</h3>
<ul>
	<li>Current platforms are only near optimal <b>in one direction</b>. Computing billions of similar operations (neural networks)
very fast fitting a design that is in most cases fixed. If we put the complexity at the bottom, like "each word in a language has its
own definition", the whole idea doesn't work anymore. GPUs become useless to speed up. Remember, a GPU is not a CPU with more
cores, it imposes an orchestrated execution model.</li>
	<li>Even when we compute "just neural networks", its efficiency depends on us <b>pushing rectangles into other rectangles</b>.
I.e., stacking fully connected layers without considering alternatives. There is ongoing research in <b>sparsity</b>, which was not
considered three years ago. It is usually applied to compress models, sometimes by 90% with almost no performance loss, <b>after
training</b>, GPUs and sparsity don't go along well!</li>
</ul>
</div>
<div class="6u$ 12u$(small)">
<ul>
	<li>Current platforms do not have efficient mechanisms to try ideas on <b>"just a few cases"</b>. You can, of course, build smaller data
sets to explore ideas. Some hypotheses such as <i>"An elephant is heavier than an ant."</i> inherently require less cases to be verified
than others like <i>"Martian gravity influences athletic records."</i>, Statisticians call that <b>effect size</b>. This is not minor,
setting up even small models on these platforms has a high computational cost (many orders of magnitude compared to some evaluations on
already loaded data). There is no easy way around it, large corporations simply throw in as much computation as they can (millions of
dollars in computing). This has reached the point that some researchers believe AI research is about budget. And they are right in a way,
at least when you are trying to do the same thing others are doing and your only distinction is having less resources, <b>not a good
strategy!</b></li>
</ul>
</div>
</div>

<h2 id="content">We should increase interoperability of what we already have.</h2><p>
<div class="row">
<div class="6u 12u$(small)">
<h3>One giant leap for mankind ...</h3>
<p>... was the invention of the <b>file</b>. It happened in different steps, starting in 1940 and only resembles current file systems
since 1961. Today, we have amazing free software tools to process all kinds of files, but the creation of data pipelines is still tedious
and error prone. We have to manage many <i>"unknown file type, wrong version, option not supported, unexpected syntax"</i> errors, wait
until hundreds of gigabytes get decompressed just to check image sizes, etc.</p>
<p>We could wait until computers spontaneously get so smart that they guess what we want and do it for us using the right tools, with
optimal arguments ...</p>

</div>
<div class="6u$ 12u$(small)">
<p>... or just <b>make the whole process machine understandable</b>.</p>
<h3>And the same applies to APIs</h3>
<p><span class="image left"><img src="/kaalam/assets/images/api-icon.png" alt="" /></span>We could improve on standardized ways to abstract
API details. Finding such things as: language, timestamp, expected expiry time, units, etc. Besides that, creating mechanisms to ask for
updated data in consistent ways, are things that add value and <b>simplify data processing</b>.</p>
</div>
</div>

<h2 id="content">Putting it all together</h2><p>
<div class="row">
<div class="6u 12u$(small)">
<p>We <b>identified five opportunities for improvement</b> over current platforms for all of us. And we discuss how <b>Jazz</b>
addresses them in:

<ul class="actions vertical small">
	<li><a href="/kaalam/2018/10/01/how_is_jazz_a_solution.html" class="button small">How is Jazz a solution?</a></li>
</ul></p>
<blockquote>
Nobody knows what AI needs to become <b>True AI</b>, but we do know a lot about building data solutions. The platform should ideally
help <b>experimentation</b> while providing <b>technology to build data engines in production environments</b>.
</blockquote>

</div>
<div class="6u$ 12u$(small)">
<ol>
	<li>The efficiency of current systems is broken, unless all you need is pushing <b>rectangles</b> into other rectangles.</li>
	<li>Current platforms can sometimes be more a hindrance than a help in the exploration of <b>new ideas</b>.</li>
	<li>Current solutions are not giving any thought (at platform level) to efficient <b>quick exploration</b>.</li>
	<li>Working with different kinds of <b>data files</b> and <b>services</b> is tedious and error prone.</li>
	<li><b>EXTRA!</b> We have to build platforms with <b>code generation</b> and <b>lifelong learning</b> in mind.</li>
</ol>
</div>
</div>
