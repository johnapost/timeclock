Introduction
============

This is a sample timeclock application showing how I like to structure and develop my applications. This also shows my gem preferences.

Getting Started
===============

Dependencies
------------

* TimeClock uses the [Mysql2 gem](https://github.com/brianmario/mysql2). Please refer to the gem's documentation to ensure that it is able to locate MySQL on your machine. Thanks!

* TimeClock uses the [Poltergeist gem](https://github.com/teampoltergeist/poltergeist) for Capybara's JS driver. This gem requires PhantomJS version 1.8.1 or later. Refer to the documentation for installation if necessary.

Using the Application
=====================

You will have to seed the database in order to create the first administrator account. Run `rake db:seed` so that you can login with the below credentials:

* Email: admin@email.com
* Password: defaultpass

Once you are logged in, you can create employee users as well as other administrators.

Testing
=======

Testing is handled with both RSpec and Cucumber. Please run `rspec` and `cucumber` to see the results.

License
=======

The MIT License (MIT)

Copyright (c) 2014 John Apostol, http://johnapostol.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.