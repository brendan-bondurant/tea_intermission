## Tea Subscription Service API

### Overview
This Rails API is a backend system for a Tea Subscription Service, allowing users to manage their tea subscriptions.

### Features
Subscribe: Allows customers to subscribe to a tea subscription.
Cancel Subscription: Enables customers to cancel their tea subscriptions.
View Subscriptions: Customers can view all their subscriptions, both active and cancelled.

### Getting Started
You will need:
Ruby on Rails
PostgreSQL

### Installation
Clone the repo
```
git clone git@github.com:brendan-bondurant/tea_intermission.git
```
### Install gem packages

Gems Used
Pry
Simplecov
FactoryBot
Faker
Rspec
Capybara
JSONapi Serializer

Run `bundle install`

### Usage
Endpoints

1. Subscribe to a Tea Subscription
[POST] /api/v1/customers/:id/subscriptions/:id

2. Cancel a Tea Subscription
[DELETE] /api/v1/customers/:id/subscriptions/:id

3. View Customer's Subscriptions
[GET] /api/v1/customers/:id/subscriptions

Response Example:
json
```
{
    "data": {
        "customer": {
            "first_name": "Numbers",
            "last_name": "Green",
            ...
        },
        "subscribed_to": [
            {
                "title": "Basic",
                ...
                "teas": [
                      {
                        "title": "green",
                          ...
                      }
                  ]
            },
            ...
        ]
    }
}
```
### Running the Tests
Execute the test suite with:
```
bundle exec rspec
```
Many of the API endpoints were also tested using postman.
