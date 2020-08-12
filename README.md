# README

## Requirement
some customer records in a text file (customers.txt) -- one customer per line, JSON lines formatted. We want to invite any customer within 100km of our Dublin office for some food and drinks on us. Write a program that will read the full list of customers and output the names and user ids of matching customers (within 100km), sorted by User ID (ascending).

You must use the first formula from(https://en.wikipedia.org/wiki/Great-circle_distance) this Wikipedia article to calculate distance. Don't forget, you'll need to convert degrees to radians.

The GPS coordinates for our Dublin office are 53.339428, -6.257664.

You can find the Customer list here(https://s3.amazonaws.com/intercom-take-home-test/customers.txt).


* Ruby 
```
  version = 2.7
```
* Setup 
 ```
  bundle install
 ```
* Run
 ```
  Rails s
 ```
* Test
 ```
  rake spec
 ```
 
 # Solution
 When project runs the solution then a find customer page will be opened where user can provide customer file path, source location and range while searching the customers.
 
 User can extract the list of eligible customers in output.txt file by clicking the extract customers button on the web page.
