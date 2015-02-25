# Bookcase
A [Jekyll](http://jekyllrb.com/) static site to display your books, mixed in with some basic filtering and book metadata. The metadata on each book aids in tracking the location of the book (if it has been borrowed).


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
