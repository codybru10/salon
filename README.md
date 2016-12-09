# _Salon Application_

#### _A web app that allows a salon adminstrator to add stylists and clients to a stylist._

#### By _**Cody Brubaker**_


## Setup/Installation Requirements

_Works in any web browser. To run Salon Admin Application, in command line run:_

```
$ git clone https://github.com/codybru10/salon
$ cd salon
$ bundle
$ Open new terminal tab - enter "postgres"
$ Open new terminal tab - enter "psql"
$ In psql tab, enter the following lines of code:

* CREATE DATABASE salon;
* \c salon;
* CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
* CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id);

$ Open new terminal window - enter "ruby app.rb"
$ Go to localhost:4567 in web browser
```

## Support and contact details

_Contact me Github at codybru10 or cody.brubaker@gmail.com

## Technologies Used

* _Bootstrap_
* _Ruby_
* _Sinatra_
* _Postgres_


### License

This software is licensed under the MIT license.

Copyright (c) 2016 **_Cody Brubaker**
