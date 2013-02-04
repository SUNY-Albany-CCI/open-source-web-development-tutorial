Overview
========

Web application projects are almost always supported by a backend database.

This database provides persistent storage for information such as

* User accounts
* Site statistics
* Site content
* Transactions

In a typical application, the database will run in the Web server, or a machine
that the web server can connect to. While the Web application itself will run
mostly on the Web browser client.

This partition of activities must be taken into account to deal with isses such as

* Authentication
* Security
* Performance
* Scalability


