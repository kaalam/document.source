---
title: Latest Stable Server
summary: 
sidebar: mydoc_sidebar
permalink: reference_docker_latest_server.html
---

## This is a template!

When linking to an external site, use Markdown formatting because it's simplest:

[Google](http://google.com)

And internal link is, see [Getting Started](index.html).

## Highlighted text

As expected, you can use **bold** and *italic*. Also, special words like `if` and `endif` can be drawn in "red on gray".

## Bullet points

Some of the more prominent features of this theme include the following:

* Bootstrap framework
* Ability to specify different sidebars for different products
* Top navigation bar with drop-down menus
* Notes, tips, and warning information notes
* Tags for alternative navigation

## Numbered list

1.  First item.
1.  Second item.
1.  Third item.

## Complex Lists

1.  Sample first item.

    * sub-bullet one
    * sub-bullet two

2.  Continuing the list

    1. sub-list numbered one
    2. sub-list numbered two

3.  Another list item.

## Another Complex List

1.  Sample first item.

    This is a result statement that talks about something....

2.  Continuing the list

    {% include note.html content="Remember to do this. If you have \"quotes\", you must escape them." %}

    Here's a list in here:

    * first item
    * second item

3.  Another list item.

    ```js
    function alert("hello");
    ```

4.  Another item.

### Key Principle to Remember with Lists

The key principle is to line up the first character after the dot following the number:

{% include image.html file="liningup.png" caption="Lining up the left edge ensures the list stays in tact." %}

For the sake of simplicity, use two spaces after the dot for numbers 1 through 9. Use one space for numbers 10 and up. If any part of
your list doesn't align symmetrically on this left edge, the list will not render correctly. Also note that this is characteristic of
kramdown-flavored Markdown and may not yield the same results in other Markdown flavors.

## Notes, Tips, etc.

{% include note.html content="Remember to do this. If you have \"quotes\", you must escape them." %}
{% include tip.html content="In the descriptions of the build scripts, \"mydoc\" is used as the sample project. Substitute in whatever
your real project name is." %}
{% include callout.html content="Lazy people will read this more than other text. **Maybe even more if it is bold.**. Assuming you do
not abuse this thing too much." %}
{% include warning.html content="Beware of the dog!" %}
{% include important.html content="The dog is dead." %}

## Images

{% include image.html file="jazz_block.png" caption="An image" %}

Text, text, text.

{% include image.html file="jazz_block.png" alt = "This shows when the image fails" caption="This always shows" max-width=320 %}

Text, text, text, {% include inline_image.html file="company_logo.png" alt="kaalam.ai" %}, text.

## Video

{% unless site.output == "pdf" %}
See the following Jekyll cast for more info about using parameters with includes:

<iframe width="640" height="480" src="https://www.youtube.com/embed/kzpGqdEMbIs" frameborder="0" allowfullscreen></iframe>
{% endunless %}

## Tables

The available include properties are as follows:

| Property | description |
|-------|--------|
| file | The name of the file. Reference the subfolder path here, like this: `my_subfolder/jekyll.png` |
| url | Whether to link the image to a URL |
| alt | Alternative image text for accessibility and SEO |
| caption | A caption for the image |
| max-width | a maximum width for the image (in pixels). Just specify the number, not px.|

### Table without a header

| annotate, blame | show changeset information by line for each file |
| diff | diff repository (or selected files) |
| forget {filename} | forget the specified files on the next commit |

## HTML Tables {#htmltables}

If you need a more sophisticated table syntax, use HTML syntax for the table. Although you're using HTML, you can use Markdown inside the
table cells by adding `markdown="span"` as an attribute for the `td` tag, as shown in the following table. You can also control the column
widths.

<table>
<colgroup>
<col width="30%" />
<col width="70%" />
</colgroup>
<thead>
<tr class="header">
<th>Field</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td markdown="span">First column **fields**</td>
<td markdown="span">Some descriptive text. This is a markdown link to [Google](http://google.com). Or see [some link][mydoc_tags].</td>
</tr>
<tr>
<td markdown="span">Second column **fields**</td>
<td markdown="span">Some more descriptive text.
</td>
</tr>
</tbody>
</table>

## jQuery DataTables

You also have the option of using a [jQuery DataTable](https://www.datatables.net/), which gives you some additional capabilities. To use
a jQuery DataTable in a page, include `datatable: true` in a page's front matter. This tells the default layout to load the necessary CSS
and javascript bits and to include a `$(document).ready()` function that initializes the DataTables library.

You can change the options used to initialize the DataTables library by editing the call to `$('table.display').DataTable()` in the default
layout.  The available options for Data tables are described in the [DataTable documentation](https://www.datatables.net/manual/options),
which is excellent.

You also must add a class of `display` to your tables.  You can change the class, but then you'll need to change the trigger defined in
the `$(document).ready()` function in the default layout from `table.display` to the class you prefer.

You can also add page-specific triggers (by copying the `<script></script>` block from the default layout into the page) and classes,
which lets you use different options on different tables.

If you use an HTML table, adding `class="display"` to the `<table>` tag is sufficient.

Markdown, however, doesn't allow you to add classes to tables, so you'll need to use a trick: add `<div class="datatable-begin"></div>`
before the table and `<div class="datatable-end"></div>` after the table.  The default layout includes a jQuery snippet that automatically
adds the `display` class to any table it finds between those two markers.  So you can start with this (we've trimmed the descriptions for
display):

<div class="datatable-begin"></div>

Food    | Description                                                                                       | Category | Sample type
------- | ------------------------------------------------------------------------------------------------- | -------- | -----------
Apples  | A small, somewhat round and often red-colored, crispy fruit grown on trees.                       | Fruit    | Fuji
Bananas | A long and curved, often-yellow, sweet and soft fruit that grows in bunches in tropical climates. | Fruit    | Snow
Kiwis   | A small, hairy-skinned sweet fruit with green-colored insides and seeds.                          | Fruit    | Golden
Oranges | A spherical, orange-colored sweet fruit commonly grown in Florida and California.                 | Fruit    | Navel

<div class="datatable-end"></div>

Notice a few features:

* You can keyword search the table. When you type a word, the table filters to match your word.
* You can sort the column order.
* You can page the results so that you show only a certain number of values on the first page and then require users to click next to see
more entries.

Read more of the [DataTable documentation](https://www.datatables.net/manual/options) to get a sense of the options you can configure. You
should probably only use DataTables when you have long, massive tables full of information.

## Code

Here's the code for the above (with the filler text abbreviated):

```html
<ul id="profileTabs" class="nav nav-tabs">
    <li class="active"><a href="#profile" data-toggle="tab">Profile</a></li>
    <li><a href="#about" data-toggle="tab">About</a></li>
    <li><a href="#match" data-toggle="tab">Match</a></li>
</ul>
  <div class="tab-content">
<div role="tabpanel" class="tab-pane active" id="profile">
    <h2>Profile</h2>
<p>The quick brown fox....</p>
</div>

<div role="tabpanel" class="tab-pane" id="about">
    <h2>About</h2>
    <p>Lorem ipsum ...</p></div>

<div role="tabpanel" class="tab-pane" id="match">
    <h2>Match</h2>
    <p>jumps over ....</p>
</div>
</div>
```

```cpp
// Silly thing
	for (i=0; i<3; i++) a += b[i];

	std.cout << "Sum is" << a;
```

```python
# indent your Python code to put into an email
import glob
# glob supports Unix style pathname extensions
python_files = glob.glob('*.py')
for file_name in sorted(python_files):
    print '    ------' + file_name

    with open(file_name) as f:
        for line in f:
            print '    ' + line.rstrip()

    print
```

## Nav tabs demo

The following is a demo of a nav tab. Refresh your page to see the tab you selected remain active.

<ul id="profileTabs" class="nav nav-tabs">
    <li class="active"><a class="noCrossRef" href="#profile" data-toggle="tab">Profile</a></li>
    <li><a class="noCrossRef" href="#about" data-toggle="tab">About</a></li>
    <li><a class="noCrossRef" href="#match" data-toggle="tab">Match</a></li>
</ul>
  <div class="tab-content">
<div role="tabpanel" class="tab-pane active" id="profile" markdown="1">
## Profile

The quick brown fox,

1.  jumps over
2.  the lazy animals
    * including the lazy dog
    * and a hamster

> And the zoo keeper
</div>

<div role="tabpanel" class="tab-pane" id="about">
    <h2>About</h2>
    <p>The quick brown fox jumps over the lazy dog a few times and then has a nap.</p></div>

<div role="tabpanel" class="tab-pane" id="match">
    <h2>Match</h2>
    <p>The quick brown fox jumps over the lazy dog a few times and then has a nap. (again)</p>
</div>
</div>

## Design constraints

Bootstrap automatically clears any floats after the nav tab. Make sure you aren't trying to float any element to the right of your nav tabs,
or there will be some awkward space in your layout.

## Appearance in the mini-TOC

If you put a heading in the nav tab content, that heading will appear in the mini-TOC as long as the heading tag has an ID. If you don't
want the headings for each nav tab section to appear in the mini-TOC, omit the ID attribute from the heading tag. Without this ID attribute
in the heading, the mini-TOC won't insert the heading title into the mini-TOC.

## Must use HTML

You must use HTML within the nav tab content because each nav tab section is surrounded with HTML, and you can't use Markdown inside HTML.

## Match up ID tags

Each tab's `href` attribute must match the `id` attribute of the tab content's `div` section. So if your tab has `href="#acme"`, then you
add `acme` as the ID attribute in `<div role="tabpanel" class="tab-pane" id="acme">`.

## Set an active tab
One of the tabs needs to be set as active, depending on what tab you want to be open by default (usually the first one).

```html
<div role="tabpanel" class="tab-pane active" id="acme">
```

## About labels
Labels might come in handy for adding button-like tags next to elements, such as POST, DELETE, UPDATE methods for endpoints. You can use
any classes from Bootstrap in your content.

<span class="label label-default">Default</span>
<span class="label label-primary">Primary</span>
<span class="label label-success">Success</span>
<span class="label label-info">Info</span>
<span class="label label-warning">Warning</span>
<span class="label label-danger">Danger</span>

You can have a label appear within a heading simply by including the span tag in the heading. However, you can't mix Markdown syntax with
HTML, so you'd have to hard-code the heading ID for the auto-TOC to work.

## PDF download

You can see an example of the finished product here:

<a target="\_blank" class="noCrossRef" href="{{ "pdf/mydoc.pdf"}}"><button type="button" class="btn btn-default" aria-label="Left Align">
<span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span> PDF Download</button></a>

To generate the PDF, follow all the instructions in the documentation template site.

{% include links.html %}
