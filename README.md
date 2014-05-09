membership-site
===============

The public facing web site of Startup Victoria: startupvictoria.com.au

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
