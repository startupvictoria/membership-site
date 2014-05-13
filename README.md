membership-site
===============

The public web site of Startup Victoria: startupvictoria.com.au is open-source.  You can contribute to it.

Features:

* basic content site

* member registration

* payment via stripe

* logged-in members get access to more content

The site is responsive.

Setup
=====

### Bootstrap

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

Roadmap
=======

We would love to receive pull-requests for the items on this roadmap.

High Priority:

* pdf receipts for membership payment that can be downloaded by members

Medium Priority:

Low Priority:
