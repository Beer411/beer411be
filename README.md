## Heroku Link: https://calm-scrubland-8623.herokuapp.com


## User Registration

### /users

###### Required params

* user: {email: email, password: password}
```
{
  "user": {
  "email": "b@b.com",
  "authentication_token": "mFUzs_fcZ5dN_dLsuKHU"
  }
}
```

## User Sign In

### /users/sign_in

###### Required params

* user: {email: email, password: password}
```
{
  "user": {
  "email": "b@b.com",
  "authentication_token": "mFUzs_fcZ5dN_dLsuKHU"
  }
}
```

## Create a Beer

### /beers

###### Required params

* auth_token
* beer: {name: name}

###### Optional Params

* beer: {flavor_profile1: flavor_profile1, flavor_profile2: flavor_profile2,
  flavor_profile3: flavor_profile3, flavor_profile4: flavor_profile4,
  flavor_profile5: flavor_profile5, kind: kind, description: description, brewery: brewery }

```
{
  "beer": {
  "id": 1,
  "name": "Sweetwater 420",
  "flavor_profile1": "Hoppy",
  "flavor_profile2": "Delicious",
  "flavor_profile3": "Fruity",
  "flavor_profile4": "Refreshing",
  "flavor_profile5": "Tasty",
  "description": "This is an awesome beer",
  "kind": "Extra Pale Ale",
  "brewery": "Sweetwater",
  "created_at": "2015-03-09T21:57:27.447Z",
  "updated_at": "2015-03-09T21:57:27.447Z"
  }
}
```

## Show a Specific Beer

### /beers/:id

```
{
  "beer": {
  "id": 1,
  "name": "Sweetwater 420",
  "flavor_profile1": "Hoppy",
  "flavor_profile2": "Delicious",
  "flavor_profile3": "Fruity",
  "flavor_profile4": "Refreshing",
  "flavor_profile5": "Tasty",
  "description": "This is an awesome beer",
  "kind": "Extra Pale Ale",
  "brewery": "Sweetwater",
  "created_at": "2015-03-09T21:57:27.447Z",
  "updated_at": "2015-03-09T21:57:27.447Z"
  }
}
```

## Show a List of Beers

### /beers/list
```
{
  "beer": [
  {
    "id": 1,
    "name": "Sweetwater 420",
    "flavor_profile1": "Hoppy",
    "flavor_profile2": "Delicious",
    "flavor_profile3": "Fruity",
    "flavor_profile4": "Refreshing",
    "flavor_profile5": "Tasty",
    "description": "This is an awesome beer",
    "kind": "Extra Pale Ale",
    "brewery": "Sweetwater",
    "created_at": "2015-03-09T21:57:27.447Z",
    "updated_at": "2015-03-09T21:57:27.447Z"
  },
  {
    "id": 2,
    "name": "Another Beer",
    "flavor_profile1": "Hoppy",
    "flavor_profile2": "Delicious",
    "flavor_profile3": "Fruity",
    "flavor_profile4": "Refreshing",
    "flavor_profile5": "Tasty",
    "description": "This is an awesome beer",
    "kind": "Extra Pale Ale",
    "brewery": "Yummy",
    "created_at": "2015-03-09T21:58:34.371Z",
    "updated_at": "2015-03-09T22:28:37.998Z"
  }
  ]
}
```
