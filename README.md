Introduction
============

This is a sample timeclock application showing how I like to structure and develop my applications. This also shows my gem preferences.

Getting Started
===============

Dependencies
------------

* TimeClock uses the [Mysql2 gem](https://github.com/brianmario/mysql2). Please refer to the gem's documentation to ensure that it is able to locate MySQL on your machine. Thanks!

* TimeClock uses the [Poltergeist gem](https://github.com/teampoltergeist/poltergeist) for Capybara's JS driver. This gem requires PhantomJS version 1.8.1 or later. Refer to the documentation for installation if necessary.

* If there's anything I missed that you had trouble installing, please let me know.

Database Setup
--------------

With MySQL up and running on your machine all you should need to do is run `rake db:create db:seed db:migrate`.

Once that is set, you can log in with the below credentials:

* Email: admin@email.com
* Password: defaultpass

After you are logged in, you can create employee users as well as other administrators with the application interface.

Using the Application
=====================

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