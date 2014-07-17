# membership-site

[Startup Victoria](https://startupvictoria.com.au/)'s web site is open-source.

## Roadmap

If you have skills in any of: design, Ruby on Rails, PostgreSQL, ActiveAdmin, Haml, CoffeeScript or Bootstrap
and would like to tackle something on this roadmap, we'd be grateful!

High Priority:

* /committees to showcase the committees

* /betterfounder to showcase the Better Founder Groups and their members

* ActiveAdmin datepicker for the starts_at field of /admin/events/new

Low Priority:

* email capture for the newsletter that doesn't take the user off site.

Bugs:

* no code to change the active class in the header nav

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
localhost/5000
```

### Sanity Check

```
rspec
```
