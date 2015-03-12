## Heroku Link: https://calm-scrubland-8623.herokuapp.com


## User Registration

### /users POST

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

### /users/sign_in POST

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

### /beers POST

###### Required params

* auth_token
* beer: {name: name}

###### Optional Params

* beer: {flavor_profile1: flavor_profile1, flavor_profile2: flavor_profile2,
  flavor_profile3: flavor_profile3, flavor_profile4: flavor_profile4,
  flavor_profile5: flavor_profile5, kind: kind, description: description, brewery: brewery,   abv: abv}

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
  "abv": "5.4%"
  }
}
```

## Show a Specific Beer

### /beers/:id GET

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
  "abv": "5.4%"
  }
}
```

## Show a List of Beers

### /beers/list GET
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
    "abv": "5.4%"
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
    "abv": "5.4%"
  }
  ]
}
```
## Search for Beer

### /beers/search GET

###### Required Params

* query: search query

```
{
  "beer": [
    {
      "id": 3,
      "name": "Chocolate Sombrero",
      "flavor_profile1": "Hoppy",
      "flavor_profile2": "Cinnamon",
      "flavor_profile3": "Malty",
      "flavor_profile4": "Chocolate",
      "flavor_profile5": "Tasty",
      "description": "Full bodied, strong, and delicious",
      "kind": "Imperial Stout",
      "brewery": "Clown Shoes",
      "created_at": "2015-03-10T16:31:13.777Z",
      "updated_at": "2015-03-10T16:31:13.777Z",
      "abv": "9%"
    }
  ]
}
```

## Create a Bar/Restaurant/Store

### /bars POST

###### Required Params

* auth_token
* bar: {name: name, address: address}

```
{
  "bar": {
  "id": 1,
  "name": "Drinky Place",
  "address": "Hoppy St., Atlanta Ga",
  "created_at": "2015-03-11T03:23:04.173Z",
  "updated_at": "2015-03-11T03:23:04.173Z"
  }
}
```

## Show a Specific Bar/Restaurant/Store

### /bars/:id GET

```
{
  "bar": {
  "id": 1,
  "name": "Drinky Place",
  "address": "Hoppy St., Atlanta Ga",
  "created_at": "2015-03-11T03:23:04.173Z",
  "updated_at": "2015-03-11T03:23:04.173Z"
  }
}
```

## Show all Bars/Restaurants/Stores

### /bars/list GET

```
{
  "bar": {
  "id": 1,
  "name": "Drinky Place",
  "address": "Hoppy St., Atlanta Ga",
  "created_at": "2015-03-11T03:23:04.173Z",
  "updated_at": "2015-03-11T03:23:04.173Z"
  }
}
```

## Search for Bar

### /bars/search GET

###### Required Params

* query: search query

```
{
  "bar": [
    {
      "id": 1,
      "name": "Drinky Place",
      "address": "Hoppy St., Atlanta Ga",
      "created_at": "2015-03-11T03:23:04.173Z",
      "updated_at": "2015-03-11T03:23:04.173Z"
    }
  ]
}
```
