# Heroes API

Heores API was created to serialize super heroes from across different publications all into one place, using Super API. The data is passed along through two endpoints, `/search` and `/supers`, and uses pagination to return the super heroes. Valid search parameters can allow you to sort and filter through the super heroes and return based on specific parameters that are highlighted below in *Endpoints*. This application uses Circle CI for Continuous Integration and is deployed on heroku at `https://supers-api.herokuapp.com/api/v1/`, being autodeployed with a passing Circle Build.

## Summary

  - [Getting Started](#getting-started)
  - [Running the tests](#running-the-tests)
  - [Endpoints](#endpoints)
  - [Built With](#built-with)
  - [Versioning](#versioning)
  - [Authors](#authors)
  - [Refelctions](#reflections)
  - [Acknowledgments](#acknowledgments)

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

- `bundle exec rspec` to run the test suite

### Sample of Tests Across the App

Project consists of tests for Requests, Models, Services and Facades, all with happy path, sad path/edge cases.
Coverage currently sits at 100%

#### Search POST Request Happy Path
![search_re_happy](https://user-images.githubusercontent.com/72912074/121247739-d4a58e00-c85f-11eb-9e20-0fb10e0c1138.png)

#### Search POST Request Sad Path
![search_re_sad](https://user-images.githubusercontent.com/72912074/121247759-da02d880-c85f-11eb-95ff-03b0338aead7.png)

#### Super GET Request Happy Path
![super_re_happy](https://user-images.githubusercontent.com/72912074/121247784-dff8b980-c85f-11eb-885a-8b3d5378f08f.png)

#### Super GET Request Sad Path
![super_re_sad](https://user-images.githubusercontent.com/72912074/121247802-e4bd6d80-c85f-11eb-9597-86a5b236fe6f.png)

#### Search Model Sad Path
![search_m_sad](https://user-images.githubusercontent.com/72912074/121247822-ea1ab800-c85f-11eb-9936-99f19626acc1.png)

#### Super Model Happy Path
![super_m_happy](https://user-images.githubusercontent.com/72912074/121247863-f69f1080-c85f-11eb-9cc5-76c03bf0c7ea.png)

#### Super Model Sad Path
![super_m_sad](https://user-images.githubusercontent.com/72912074/121247880-facb2e00-c85f-11eb-9f36-42847310db0c.png)

##### Search Service Happy Path
![super_service](https://user-images.githubusercontent.com/72912074/121247884-fdc61e80-c85f-11eb-8754-b8ccdf11e05f.png)

#### Search Facade Happy Path
![super_facade](https://user-images.githubusercontent.com/72912074/121247897-00287880-c860-11eb-97cb-410630bc2e0b.png)

_These are just examples, to see the full test coverage please look into the `spec` folder of the app_

## Endpoints

### POST `supers-api.herokuapp.com/api/v1/search`
Creates a Search in the DB as long as valid parameters are sent as the body of the request, returns super heroes that match from the DB. Defaults to sort by name, defaults to page 1 and 20 per page, but all can be changed.

Valid Parameters:
![search_params](https://user-images.githubusercontent.com/72912074/121243803-619a1880-c85b-11eb-9dce-6217fadaaaab.png)

### GET `findjob-backend.herokuapp.com/api/v1/supers`
Returns all super heroes, sorted by name. Pagination defaults to page 1 and 20 per page, but can be changed.

Valid Parameters:
![super_params](https://user-images.githubusercontent.com/72912074/121243559-11bb5180-c85b-11eb-9fd1-b37013cfc470.png)

## Built With

  - Rails API
  - FastJsonApi
  - RSpec
  - Capybara
  - VCR
  - SimpleCov

## Versioning

This is version 1 of Heroes API, for any updated versions please check back here. New versions will be linked below:

## Authors

  - **Andrew Johnston** - 
    [GitHub](https://github.com/avjohnston)

## Reflection
  
Put Refelection Here

## Acknowledgments

This application is made possible and uses data from [Super API](https://akabab.github.io/superhero-api/api/).


