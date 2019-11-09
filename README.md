# This repository is ⚰️ ARCHIVED ⚰️

I haven't used/worked on this repository in quite some time, thus I'm archiving it.

Feel free to fork and take the project in a new direction. You could also contact me to unarchive it if you are willing to maintain it.

-----

# Bookcase
A [Jekyll](http://jekyllrb.com/) static site to display your books, mixed in with some basic filtering and book metadata. The metadata on each book aids in tracking the location of the book (if it has been borrowed).

## How to Use
First you would fork this repository and modify the `_books` and `_config.yml` as needed. When using this on [Github Pages](https://pages.github.com/) it is not possible take advantage of some of the `_plugins`. To work around this, you need to generate the site locally then push the generated files to a `gh-pages` branch within your forked repository. This can all be accomplished with the rake task `rake publish`.

## Adding and Changing Books
Tag and author pages are automatically generated through Jekyll using the metadata that are attached to the *books*. The following is a sample of the aforementioned metadata:

```
---
layout: default
title: 'Practical Object-Oriented Design in Ruby: An Agile Primer'
authors: ['Sandi Metz']
published_date: 2012-09-5
pages: 272
isbn: '978-0321721334'
tags: ['Ruby', 'Object-Oriented Design']

owner: 'Kevin Jalbert'
location: 'Kevin Jalbert'
last_seen: 2015-02-24
---
```

The *authors* and *tags* attributes must follow the indicated format as the author and tag pages are generated from these values (along side the basic filtering). To simplify and *hopefully* reduce error a *rake task* (`rake sync_resources`) is provided which will parse through the `_books` and reconstruct the necessary information for `_data/authors.yml* and `_data/tags.yml`.

It is therefore recommended to run `rake sync_resources` and commit the changes it has made in addition to any book additions/changes made.


### Acknowledgments
[Jekyll data page generation](https://github.com/avillafiorita/jekyll-datapage_gen)
