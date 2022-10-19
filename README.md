# Superheroes-API

This is a rails application providing a REST API for superhero related data, including names, superhero names and abilities.

`config/routes.rb` contains all routes for the application defined using rails resources.

## Development link
http://localhost:3000

## Install

    bundle install

## Run the app

    rails s

## test association methods and custom methods with pry

    rails c

## Validations
    Validations in the `HeroPower` model:

    - `strength` must be one of the following values: 'Strong', 'Weak', 'Average'

    Validations in the `Power` model:

    - `description` must be present and at least 20 characters long

# REST API

    The REST API is described below.

## Get list of Superheroes

### Request

`GET /heroes`

    curl -i -H 'Accept: application/json' http://localhost:3000/heroes

### Response

    HTTP/1.1 200 OK
    Date: Thu, 16 Sept 2022 12:36:30 GMT
    Status: 200 OK
    Connection: close
    Content-Type: application/json
    Content-Length: 8

    [  

        { "id": 1, "name": "Kamala Khan", "super_name": "Ms. Marvel" },  

        { "id": 2, "name": "Doreen Green", "super_name": "Squirrel Girl" },  

        { "id": 3, "name": "Gwen Stacy", "super_name": "Spider-Gwen" }

    ]

## Get list of Powers

### Request

`GET /powers`

    curl -i -H 'Accept: application/json' http://localhost:3000/powers

### Response

    HTTP/1.1 200 OK
    Date: Thu, 16 Sept 2022 12:36:30 GMT
    Status: 200 OK
    Connection: close
    Content-Type: application/json
    Content-Length: 8

    [
        {
            "id": 1,
            "name": "super strength",
            "description": "gives the wielder super-human strengths"
        },
        {
            "id": 1,
            "name": "flight",
            "description": "gives the wielder the ability to fly through the skies at supersonic speed"
        }
    ]
## Get a specific hero

### Request

`GET /heroes/:id`

    curl -i -H 'Accept: application/json' http://localhost:3000/heroes/1

### Response

    HTTP/1.1 200 OK
    Date: Thu, 16 Sept 2022 12:36:30 GMT
    Status: 200 OK
    Connection: close
    Content-Type: application/json
    Content-Length: 141

    {
        "id": 1,
        "name": "Kamala Khan",
        "super_name": "Ms. Marvel",
        "powers": [
            {
            "id": 1,
            "name": "super strength",
            "description": "gives the wielder super-human strengths"
            },
            {
            "id": 2,
            "name": "flight",
            "description": "gives the wielder the ability to fly through the skies at supersonic speed"
            }
        ]
    }

## Get a non-existent hero

### Request

`GET /heroes/:id`

    curl -i -H 'Accept: application/json' http://localhost:3000/heroes/106698383

### Response

    HTTP/1.1 404 Not Found
    Date: Thu, 16 Sept 2022 12:36:30 GMT
    Status: 404 Not Found
    Connection: close
    Content-Type: application/json
    Content-Length: 35

    {"error":"Hero Not found"}

## Get a specific power

### Request

`GET /powers/:id`

    curl -i -H 'Accept: application/json' http://localhost:3000/powers/1

### Response

    HTTP/1.1 200 OK
    Date: Thu, 16 Sept 2022 12:36:30 GMT
    Status: 200 OK
    Connection: close
    Content-Type: application/json
    Content-Length: 141

    {
        "id": 1,
        "name": "super strength",
        "description": "gives the wielder super-human strengths"
    }

## Get a non-existent power

### Request

`GET /powers/:id`

    curl -i -H 'Accept: application/json' http://localhost:3000/powers/106698383

### Response

    HTTP/1.1 404 Not Found
    Date: Thu, 16 Sept 2022 12:36:30 GMT
    Status: 404 Not Found
    Connection: close
    Content-Type: application/json
    Content-Length: 35

    {"error":"Power Not found"}

## Create new hero_power

### Request

`POST /hero_powers`

    curl -i -H 'Accept: application/json' -d 'comment=great' http://localhost:3000/hero_powers

### Body
    {
        "strength": "Average",
        "power_id": 1,
        "hero_id": 3
    }

### Response

    HTTP/1.1 201 Created
    Date: Thu, 16 Sept 2022 12:36:30 GMT
    Status: 201 Created
    Connection: close
    Content-Type: application/json
    Location: /hero_powers/9
    Content-Length: 9

    {
        "id": 1,
        "name": "Kamala Khan",
        "super_name": "Ms. Marvel",
        "powers": [
            {
            "id": 1,
            "name": "super strength",
            "description": "gives the wielder super-human strengths"
            },
            {
            "id": 2,
            "name": "flight",
            "description": "gives the wielder the ability to fly through the skies at supersonic speed"
            }
        ]
    }

## Change a power

### Request

`PATCH /powers/:id`

    curl -i -H 'Accept: application/json' -X PATCH -d 'description=Updated description' http://localhost:3000/powers/9

### Body
    {
    "description": "Updated description"
    }

### Response

    HTTP/1.1 200 OK
    Date: Thu, 16 Sept 2022 12:36:30 GMT
    Status: 200 OK
    Connection: close
    Content-Type: application/json
    Content-Length: 10

    {
        "id": 1,
        "name": "super strength",
        "description": "Updated description"
    }









