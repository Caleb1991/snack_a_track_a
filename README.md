# Snack-a-Track-a V 1.0
Snack-a-Track-a is an API created to help track all of the snacks a user consumes. A user may add snacks they have eaten, recieve recommendations for snacks, as well as rate snacks. This API is deployed to Heroku and can be accessed with the domain and necessary URI's.

## Schema

<img width="666" alt="Screen Shot 2021-10-10 at 7 53 50 AM" src="https://user-images.githubusercontent.com/78196294/136698698-76972f41-524b-46e3-8729-135d4af0ba4f.png">

## API Domain
https://lit-reaches-91268.herokuapp.com/

## Users
get `/api/v1/users`
  Returns all users

get `/api/v1/users/:id`
  Returns user for given ID
  
post `/api/v1/users`
  Creates a user (must send parameters as a JSON payload)
  
patch `/api/v1/users/:id`
  Updates a given user (must send parameters as a JSON payload)
  
delete `/api/v1/users/:id`
  Deletes a given user
  
## Snacks
get `/api/v1/snacks`
  Returns all snacks
  
get `/api/v1/snacks/:id`
  Returns snack for given ID

post `/api/v1/snacks`
  Creates a snack (params must be sent as a JSON payload)
  
patch `/api/v1/snacks/:id`
  Updates a given snack (must send parameters as a json payload)
  
delete `/api/v1/snacks/:id`
  Deletes a given snack
  
get `/api/v1/snacks/:snack_id/average_rating`
  Returns the average rating for a given snack
  Can send `?limit=x` as query parameters (defaults to 5)

get `/api/v1/snacks/top_rated_snacks_overall`
  Returns top rated snacks overall
  Can send `?limit=x` as query paramters (defaults to 5)

get `/api/v1/snacks/top_rated_savory_or_sweet_snacks`
  Returns either the top rated savory or sweet snacks
  Must send `?taste=x` (savory or sweet) as query parameters
  Can send `?limit=x` as query parameters (defaults to 5)
