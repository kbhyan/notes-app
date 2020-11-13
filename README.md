# Notter

Notter is a Ruby on Rails demo notes taking application.

Developed By: [Khaled Bhyan](https://github.com/kbhyan)

To try the app [checkout this live demo](https://notter-app.herokuapp.com/)

## This app covers the following topics
* Basic CRUD operations in Rails
* Authentication and authorization
* Ho to apply search, filter and pagination
* Dealing with routes and views

## Running the app locally
> Note: This app is built with Rails 6 and Ruby 2.7

First of all clone the repo to your machine
```
# using https
git clone https://github.com/kbhyan/notes-app.git

# or using SSH
git clone git@github.com:kbhyan/notes-app.git
```
Now get into the project folder and install all dependencies
```
cd notes-app && bundle
```
> You are almost there! Now check the `config/database.yml` file to see the needed credentials for your database, all credentials should be in the credentials file.
After setting up your database credentials run:
```
# this should setup your DB, migrate and seed it
rails db:setup
```
if the database is not seeded or migrated please run:
```
rails db:migrate && rails db:seed
```
seeding the database will create a user with dummy data and 100 notes for him.

## Contribution
You're welcome of course! Just fork the repo and raise a PR with the feature or fix.


#### Happy Hacking!
