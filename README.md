## MakersBnB Challenge

## Site usage


To use the site visit 'http://localhost:9292/'.

## Set up

To setup the database:

* Connect to psql
* Create the database using the psql command `CREATE DATABASE makersbnb;`
* Connect to the database using the psql command `\c makersbnb`;
* Run the querys we have saved in the db/migrations directory
* Populate your table with a row by running `INSERT INTO rooms (address, description, price_per_night) VALUES ('123 Fake Lane', '2 bed detached house', '£100');`

To check you have everything set up ok, please take a look at the peeps table inside the chitter database. You should see one row in there.  

To setup the test database:
* Connect to psql
* Create the database using the psql
command `CREATE DATABASE makersbnb_test;`;
* Connect to the database using the psql command `\c makersbnb_test`
* Run the querys we have saved in the db/migrations directory

* `bundle install`
* `rspec`

## User stories

As a user, So that I can view available rooms, I'd like to see a list of available rooms.

As a user, So that I can use the site, I'd like to be able to sign up.

As a user, So I can better advertise my listing, I'd like to be able to show a description.

As a site admin, So I can verify the identity of users, I only want signed up users to let/rent.

As a site admin, So I can verify the identity of users, I only want signed up users to let/rent.

As a user, so I can manage my account, I'd like to be able to sign in and out.

As a user, So that I can let my room, I'd like to list my room on MakersBnB.

As a user, So that I don't double book a room, I'd like my booked room to no longer be listed.

As a user, So that I can rent a room, I'd like to be able to book a room on MakersBnB.
