# Heroes API

Heores API was created to serialize super heroes from across different publications all into one place, using Super API. The data is passed along through two endpoints, `/search` and `/supers`, and uses pagination to return the super heroes. Valid search parameters can allow you to sort and filter through the super heroes and return based on specific parameters that are highlighted below in *Endpoints*. This application uses Circle CI for Continuous Integration and is deployed on heroku at `https://supers-api.herokuapp.com/api/v1/`, being autodeployed with a passing Circle Build.

## Summary

  - [Authors](#authors)
  - [Schema Design](#schema-design)
  - [Getting Started](#getting-started)
  - [Running the tests](#running-the-tests)
  - [Endpoints](#endpoints)
  - [Built With](#built-with)
  - [Refelctions](#reflections)
  - [Acknowledgments](#acknowledgments)

## Authors

  - **Andrew Johnston** - 
    [GitHub](https://github.com/avjohnston)
    
## Schema Design
![Screen Shot 2021-06-08 at 2 54 45 PM](https://user-images.githubusercontent.com/72912074/121256295-a2009300-c869-11eb-9d73-8d257d284dac.png)

## Getting Started

### For Using Endpoints

Go to [Endpoints](#endpoints) and use `/search` and `/supers` endpoints to recieve super hero information/make a search.

### Gemfile

Make yourself aware and familiar with the gems that are being used for this project:
![gemfile](https://user-images.githubusercontent.com/72912074/121235659-52fb3380-c852-11eb-9fdd-184383830767.png)

### Installing

- Fork and clone this repo
- Run `bundle install`
- Run `rails db:{create,migrate,seed}`

## Running the tests

- `rails db:seed RAILS_ENV=test` to seed the test database
- `bundle exec rspec` to run the test suite

### Sample of Tests Across the App

Project consists of tests for Requests, Models, Services and Facades, all with happy path, sad path/edge cases.
Coverage currently sits at 100%

#### `Search POST Request Happy Path`
![search_re_happy](https://user-images.githubusercontent.com/72912074/121247739-d4a58e00-c85f-11eb-9e20-0fb10e0c1138.png)

#### `Search POST Request Sad Path`
![search_re_sad](https://user-images.githubusercontent.com/72912074/121247759-da02d880-c85f-11eb-95ff-03b0338aead7.png)

#### `Super GET Request Happy Path`
![super_re_happy](https://user-images.githubusercontent.com/72912074/121247784-dff8b980-c85f-11eb-885a-8b3d5378f08f.png)

#### `Super GET Request Sad Path`
![super_re_sad](https://user-images.githubusercontent.com/72912074/121247802-e4bd6d80-c85f-11eb-9597-86a5b236fe6f.png)

#### `Search Model Sad Path`
![search_m_sad](https://user-images.githubusercontent.com/72912074/121247822-ea1ab800-c85f-11eb-9936-99f19626acc1.png)

#### `Super Model Happy Path`
![super_m_happy](https://user-images.githubusercontent.com/72912074/121247863-f69f1080-c85f-11eb-9cc5-76c03bf0c7ea.png)

#### `Super Model Sad Path`
![super_m_sad](https://user-images.githubusercontent.com/72912074/121247880-facb2e00-c85f-11eb-9f36-42847310db0c.png)

##### `Super Service Happy Path`
![super_service](https://user-images.githubusercontent.com/72912074/121247884-fdc61e80-c85f-11eb-8754-b8ccdf11e05f.png)

#### `Super Facade Happy Path`
![super_facade](https://user-images.githubusercontent.com/72912074/121247897-00287880-c860-11eb-97cb-410630bc2e0b.png)

_These are just examples, to see the full test coverage please look into the `spec` folder of the app_

## Endpoints

### `POST` `supers-api.herokuapp.com/api/v1/search`
Creates a Search in the DB as long as valid parameters are sent as the body of the request, returns super heroes that match from the DB. Defaults to sort by name, defaults to page 1 and 20 per page, but all can be changed.

Valid Parameters:
![search_params](https://user-images.githubusercontent.com/72912074/121243803-619a1880-c85b-11eb-9dce-6217fadaaaab.png)
_Note: Supers default to sorting by name ascending, but the sort param causes the Supers to be sorted by descending order_

### `GET` `findjob-backend.herokuapp.com/api/v1/supers`
Returns all super heroes, sorted by name. Pagination defaults to page 1 and 20 per page, but can be changed.

Valid Parameters:
![super_params](https://user-images.githubusercontent.com/72912074/121243559-11bb5180-c85b-11eb-9fd1-b37013cfc470.png)

## Built With

  - Rails API
  - Postgres
  - FastJsonApi
  - RSpec
  - Capybara
  - VCR
  - SimpleCov

## Versioning

This is version 1 of Heroes API, for any updated versions please check back here. New versions will be linked below:

## Reflection
  
I very much enjoyed getting to work on this application, it was a lot of fun getting to work with an API of my choice that deals with one of my interests. I felt comfortable and confident with the choices I made, and look forward to getting to explain these choices further.

Project Planning and TDD was a large part of what made my work on this application, in my opinion, successful. The ability to sit and plan out what exactly how I wanted to implement the functionality before jumping into code, allowed me the time to foresee potential issues and best practices to follow. Just like life, things always come up that you can't forsee, but in keeping with TDD I was able to change my code, refactor, and continue working fairly smoothly when problems/issues arised.

This was my first time creating a Search Table and it threw me for a loop at first glance. However, the more I thought about it, the more it made sense in my head. Allowing us to store distinct searches in our database can allow our application to implement all sorts of interesting functionality. A big piece that stood out to me, was how it could allow us to more easily cache our Super Hero results for specific searches and boost performance in our application, among other things. I believe there are probably other ways to implement this search table and functionality, but I went with what felt best with my skill set.

As stated before, I used Heroku to host the application and Circle CI for Continuous Integration. While working on this app by myself I found Circle to be a helpful, extra guard against failing tests and deploying broken code, especially when there is no one to review your code. Heroku is set to autodeploy after Code has been merged into main, and the Circle build passes.

## Acknowledgments

This application is made possible and uses data from [Super API](https://akabab.github.io/superhero-api/api/).


