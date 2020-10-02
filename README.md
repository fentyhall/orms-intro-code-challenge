# Intro to ORMs

## Part 1: Conceptual questions
1. What is object relational mapping and why is it useful?
Creating mapping between how data looks in Ruby, with Objects, Attributes, Framework and SQLite3 dramework with tables, columns and rows. Table - Class, Columns - Attributes, Rows - Object Instances. 

## Part 2: Coding Challenge - Building the DB and making some queries using ORM
* You've been working on building a real estate application for your friend. So far, you've done some domain modeling, mapped out the models and their relationships, and built classes with methods to reflect these relationships. You have also planned out the structure of your relational database. 
* At any time run `rake console` to load your code into a pry sandbox to test out
* Use SQL commands to accomplish the following:
1. Use the `config/environment.rb` to set up a connection to a database using the `sqlite3` gem.
2. In your `Listing` class, build a method `create_table` that executes the SQL to create a `listings` table with attributes and a belongs_to association with an agent. Should this be a class or instance method?
3. Add a `create_table` method to your `Agent` class as well.
4. In each of your classes, build a `#save` method that executes the SQL to insert the attributes of an instance of that class into the corresponding db table as a new record.
5. Refactor your `Listing.all` method to retrieve all listings from the db rather than from the class variable `@@all`. How will you translate the response of your SQL query into an array of `Listing` objects?