---
title: Extending Bebop to Data Sources
tags: [Jazz, Bebop]
keywords:
summary: "How to define Data Sources in Bebop"
sidebar: mydoc_sidebar
permalink: bebop_multiblock_data_sources.html
folder: bebop
---

## Ruby and RubyGems


## Install Homebrew

Homebrew is a package manager for the Mac, and you can use it to install an alternative instance of Ruby code. To install Homebrew, run this command:

## Install Ruby through Homebrew


## Installing dependencies through Bundler


## Resolve "No Github API authentication" errors {#githuberror}

After making an edit, Jekyll auto-rebuilds the site. If you have the Gemfile in the theme with the github-pages gem, you may see the following error:

```
GitHub Metadata: No GitHub API authentication could be found. Some fields may be missing or have incorrect data.
```

If you see this error, you will need to take some additional steps to resolve it. (Note that this error only appears if you have the github-pages gem in your gemfile.) The resolution involves adding a Github token and a cert file.

{% include note.html content="These instructions apply to Mac OS X, but they're highly similar to Windows. These instructions are adapted from a post on [Knight Codes](http://knightcodes.com/miscellaneous/2016/09/13/fix-github-metadata-error.html). If you're on Windows, see the Knight Codes post for details instead of following along below." %}

To resolve the "No Github API authentication" error:

1.  Follow Github's instructions to [create a personal access token](https://help.github.com/articles/creating-an-access-token-for-command-line-use/).
2.  Open the **.bash_profile** file in your user directory:

    ```
    open ~/.bash_profile
    ```

    The file will open in your default terminal editor. If you don't have a .bash_profile file, you can just create a file with this name. Note that files that begin with `.` are hidden, so if you're looking in your user directory for the file, use `ls -a` to see hidden files.

3.  In your **.bash_profile** file, reference your token as a system variable like this:

    ```
    export JEKYLL_GITHUB_TOKEN=abc123abc123abc123abc123abc123abc123abc123abc123
    ```

    Replace `abc123...` with your own token that you generated in step 1.

4.  Go to **[https://curl.haxx.se/ca/cacert.pem][https://curl.haxx.se/ca/cacert.pem]. Right-click the page, select **Save as**, and save the file on your computer (save it somewhere safe, where you won't delete it). Name the file **cacert**.
5.  Open your **.bash_profile** file again and add this line, replacing `Users/johndoe/projects/` with the path to your cacert.pem file:

    ```
    export SSL_CERT_FILE=/Users/johndoe/projects/cacert.pem
    ```

6.  Close and restart your terminal.

Browse to your jekyll project and run `bundle exec jekyll serve`. Make an edit to a file and observe that no Github API errors appear when Jekyll rebuilds the project.

{% include links.html %}
