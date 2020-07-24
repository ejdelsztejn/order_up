## Order Up
Please follow the setup directions below. Stories for the challenge will be sent out in class.

### Setup
- Fork this repository
- Clone down your forked repository
- Perform the usual setup steps after cloning a Rails application:
    - bundle install
    - rake db:{drop,create,migrate}
- You should have 5 passing tests to start

Order up is an app that tracks chefs, the dishes that they make, and the ingredients that are in those dishes. Chef's have many dishes. Dishes belong to a chef. Dishes have many Ingredients and Ingredients have many dishes. Ingredients should have name and calories.

Two migrations have been made for you. The one to many relationship has been set up. You will need to create migrations for the many to many relationship between ingredients and dishes. You do not need to do model testing for validations, just make sure you test any relationships and model methods that you create.

(Note: The plural of dish is dishes. The plural of chef is chefs.)

Instructions
* Work on this challenge independently.
* Complete the stories below
* Commit Frequently
* Push your code to your fork once the time is up (not before!)

Story 1 of 3
As a visitor
When I visit a dish's show page
I see a list of ingredients for that dish
and the chef's name

Story 2 of 3
As a visitor
When I visit a dish's show page
I see the total calorie count for that dish.

Story 3 of 3
As a visitor
When I visit a chef's show page
I see the name of that chef
And I see a link to view a list of all ingredients that this chef uses in their dishes
When I click on that link
I'm taken to a chef's ingredient index page
and I can see a unique list of names of all the ingredients that this chef uses


Extension
As a visitor
When I visit a chef's show page
I see the three most popular ingredients that the chef uses in their dishes
(Popularity is based off of how many dishes use that ingredient)
