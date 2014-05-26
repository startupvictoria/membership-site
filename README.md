# membership-site

[Startup Victoria](https://startupvictoria.com.au/)'s web site is open-source.

## Roadmap

If you have skills in any of: design, Ruby on Rails, PostgreSQL, ActiveAdmin, Haml, CoffeeScript or Bootstrap
and would like to tackle something on this roadmap, we'd be grateful!

High Priority:

* design

* a blog on /blog (install octopress into /public ?)

* /committees to showcase the committees

* /supporters to acknowledge and thank sponsors and corporate members

Medium Priority:

* pdf receipts for membership payment that can be downloaded by members

* ActiveAdmin datepicker for the starts_at field of /admin/events/new

Low Priority:

## Features

The basic features of the web site:

* content

* member registration

* payment via stripe

* logged-in members get access to coupons

* calendar of events

* administration (ActiveAdmin)

* responsive

## Setup

### Get Started

Prerequisites: postgresql

Run the bootstrap script to set up the app dependencies:

```
./script/bootstrap.sh
```

### Run!

```
foreman start
```

### Sanity Check

```
rspec
```
