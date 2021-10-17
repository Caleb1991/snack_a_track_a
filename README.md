# Snack-a-Track-a API V1.0
Snack-a-Track-a is an API created to help track all of the snacks a user consumes. A user may add snacks they have eaten, rate snacks, as well as recieve recommendations for snacks via a collaborative filter algorithm. This API is deployed to Heroku and can be accessed with the domain and necessary URI's. The in progress front end codebase can be found [here](https://github.com/Caleb1991/snack_a_track_a_fe)

## Tech Utilized
Ruby 2.7.2 </br>
Rails 5.2.6 </br>
RSpec 3.1

## Setup
Being deployed to Heroku, you can use this part of the application without cloning it down. In the event you would like to make changes for it to better suit your needs; fork this repository, clone it, then run: </br>
`bundle exec install` </br>
`rails db:{create,migrate,seed}` </br>
`rails g rspec:install`

## Schema

<img width="666" alt="Screen Shot 2021-10-10 at 7 53 50 AM" src="https://user-images.githubusercontent.com/78196294/136698698-76972f41-524b-46e3-8729-135d4af0ba4f.png">

## API Domain
https://lit-reaches-91268.herokuapp.com/

## Users
**get** `/api/v1/users` </br>
  -Returns all users

**get** `/api/v1/users/:id` </br>
  -Returns user for given ID
  
**post** `/api/v1/users` </br>
  -Creates a user (must send parameters as a JSON payload)
  
**patch** `/api/v1/users/:id` </br>
  -Updates a given user (must send parameters as a JSON payload)
  
**delete** `/api/v1/users/:id` </br>
  -Deletes a given user
  
**post** `/api/v1/sessions` </br>
  -Logs a user in (must send credentials as a JSON payload)
  
## Snacks
**get** `/api/v1/snacks` </br>
  -Returns all snacks
  
**get** `/api/v1/snacks/:id` </br>
  -Returns snack for given ID

**post** `/api/v1/snacks` </br>
  -Creates a snack (params must be sent as a JSON payload)
  
**patch** `/api/v1/snacks/:id` </br>
  -Updates a given snack (must send parameters as a json payload)
  
**delete** `/api/v1/snacks/:id` </br>
  -Deletes a given snack
  
**get** `/api/v1/snacks/all_savory_or_sweet_snacks` </br>
  -Returns either all Savory snacks or all sweet snacks </br>
  -Must send `?taste=x` (savory or sweet) as query parameters </br>
  -Can send `?limit=x` as query parameters (defaults to 5)
  
**get** `/api/v1/snacks/:snack_id/average_rating` </br>
  -Returns the average rating for a given snack </br>

**get** `/api/v1/snacks/top_rated_snacks_overall` </br>
  -Returns top rated snacks overall </br>
  -Can send `?limit=x` as query paramters (defaults to 5)

**get** `/api/v1/snacks/top_rated_savory_or_sweet_snacks` </br>
  -Returns either the top rated savory or sweet snacks </br>
  -Must send `?taste=x` (savory or sweet) as query parameters </br>
  -Can send `?limit=x` as query parameters (defaults to 5)
  
## UsersSnacks
**post** `/api/v1/users_snacks` </br>
  -Creates an association between a user and a snack (must send parameters as a JSON payload)
  
**delete** `/api/v1/users_snacks/:id` </br>
  -Deletes a given association between a user and a snack
  
## Reviews
**post** `/api/v1/reviews` </br>
  -Creates a review for a based off of a users_snack (must send parameters as a JSON payload)
  
**patch** `/api/v1/reviews/:id` </br>
  -Updates a given review (must send parameters as a JSON payload)
  
**delete** `/api/v1/reviews/:id` </br>
  -Deletes a given review

## Users::Snacks
**get** `/api/v1/users/:user_id/snacks` </br>
  -Returns all snacks for a given user
  
**get** `/api/v1/users/:user_id/snacks/users_top_rated_snacks` </br>
  -Returns the snacks a user has rated the highest </br>
  -Can send `?limit=x` as query parameters (defaults to 5)
  
**get** `/api/v1/users/:user_id/snacks/snack_recommendations` </br>
  -Returns recommended snacks for a given user via a collaborative filter algorithm

## Snacks::Reviews
**get** `/api/v1/snacks/:snack_id/reviews` </br>
  -Returns all of the reviews for a given snack
