# Vapor + GraphQL
This project aims to explore the combination of all of Vapor's useful features given a GraphQL approach. The project has been updated to use _async/await_ and the package has been configure for _strict concurrency_ checking in preparation for Swift 6.0.

## Dependencies
The following dependencies are used in this project:
  1) **Graphiti**: _Swift library for building GraphQL schemas._
      - https://github.com/GraphQLSwift/Graphiti/tree/main
    
  2) **Async/Await** _version of extensions for Request & RoutesBuilder from GraphQL-Kit (updated to use async/await to register API instead of Schema objects)._
     - https://github.com/alexsteinerde/graphql-kit
    
  3) **Graphiti**: _Web based IDE to send queries to your GraphQL server_
     - https://github.com/GraphQLSwift/Graphiti.git

## How to run?
To set up & run this project, please do the following:

  1) Install Vapor & Docker on your machine
  2) Dowanload the package from this repository
  3) On terminal, cd into the folder where you saved this project and run:
     - vapor xcode
  5) Create a Docker container to host your local database:
     - docker run --name vapor-graphql-demo -e POSTGRES_DB=vapor_database \
        -e POSTGRES_USER=vapor_username \
        -e POSTGRES_PASSWORD=vapor_password \
        -p 5432:5432 -d postgres
  6) Set the project schema to the folder where your project lives:
     - Edit Schema > Working Directory > Check “Use custom directory” > [Choose your project’s folder]

## Endpoint
Here it is the project's endpoint: 
- http://127.0.0.1:8080/graphql

## Calling the Service
The service seeds the following models so that queries can be serve againsta the service and return a response. See _MockSeedData.swift_ for more info:
  - **Two User models with distinct roles**: _Coach & Athlete._
  - **One Coach model**: _Representing a user's role as a Coach._
  - **One Athlete model**: _Representing a user's role as an Athlete._
  - **Five Drill models**: _Drills belogning to the Athlete's model._

Queries + Examples:
  - **getAllUsers**: _Returns all users with the specified fields by the query_
  - **getAllCoches**: _Returns all coaches with the specified fields by the query_
  - **getAllAthletes**: _Returns all athletes with the specified fields by the query_
  - **getAllDrills**: _Returns all drills with the specified fields by the query_

```yaml
query {
  getAllUsers {
    name
    lastName
    userName
    email
    userRole
    dateOfBirth
  }
}
```


Mutations + Examples:
  - **handleLogin**: _Retrieves an authorized UserModel from the databse which is used to generete and return a token in the response_

```yaml
mutation {
  handleLogin(name: "Horacio", lastName: "Sanchez", userName: "Zapotiltic23", dateOfBirth: "April 1, 1990" email: "horacio@matrixnumerics2.com", password: "0123456789", userRole: "coach") {
    id
    userID
    value
    createdAt
  }
}
```

## Obstacles
Here's a breakdown of some of the obstacles found while implementing Graphiti + Vapor:

1) **Route Protection**
   - How to protect our route/ednpoint using Vapor's middleware features?
  
2) **Authentication + Authorization**
   - How to successfully authenticate a UserModel (conforming to ModelAuthenticatable) with the database?
       - _On a REST approach, this is done via grouping the route with the authenticator() provided by the UserModel (since it comforms to protocol ModelAuthenticatable). In this way, when calling handleLogin, the payload is used to authenticate the user with the database._
