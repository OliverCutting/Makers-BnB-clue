## MakersBnB Challenge

## Site usage


To use the site visit 'http://localhost:9292/'.

## Set up

To setup the database:

* Connect to psql
* Create the database using the psql command `CREATE DATABASE makersbnb;`
* Connect to the database using the psql command `\c makersbnb`;
* Run the query I have saved in the file 01_create_rooms_table.sql
* Populate your table with a row by running `INSERT INTO rooms (address) VALUES ('123 Fake Lane');`

To check you have everything set up ok, please take a look at the peeps table inside the chitter database. You should see one row in there.  

To setup the test database:
* Connect to psql
* Create the database using the psql
command `CREATE DATABASE makersbnb_test;`;
* Connect to the database using the psql command `\c makersbnb_test`
* Run the query we have saved in the file 01_create_rooms_table.sql

* `bundle install`
* `rspec`

## User stories

