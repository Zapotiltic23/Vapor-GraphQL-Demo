# Vapor + GraphQL
This project aims to explore the combination of all of Vapor's useful features given a GraphQL approach. The project has been updated to use _async/await_ and the package has been configure for _strict concurrency_ checking in preparation for Swift 6.0.

## Dependencies
The following dependencies are used in this project:
  1) **Graphiti**: _Swift library for building GraphQL schemas._
      - https://github.com/GraphQLSwift/Graphiti/tree/main

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

## Endpoints
Here are the project's endpoints: 
- [Public] http://127.0.0.1:8080/api-v2/register
- [Basic Auth] http://127.0.0.1:8080/api-v2/login
- [Token Auth] http://127.0.0.1:8080/api-v2/graphql

## Calling the Service
The service seeds the following models so that queries can be serve against the service and return a response. See _MockSeedData.swift_ for more info:
  - **Four User models with distinct roles**: _Visitor (2), Coach (1) & Athlete (1)._
  - **One Coach model**: _Representing a user's role as a Coach._
  - **One Athlete model**: _Representing a user's role as an Athlete._
  - **Two Visitor models**: _Representing a user's role as a visitor._
  - **Five Drill models**: _Drills belogning to the Athlete's model._
  - **Three Game models**: _Games belogning to the League's model._

Queries + Examples:
  - **getAllUsers**: _Returns all users with the specified fields by the query_
  - **getAllCoches**: _Returns all coaches with the specified fields by the query_
  - **getAllAthletes**: _Returns all athletes with the specified fields by the query_
  - **getAllDrills**: _Returns all drills with the specified fields by the query_
  - **getAllGames**: _Returns all games with the specified fields by the query_
  - **getAllFiles**: _Returns all files with the specified fields by the query_
  - **getAllVisitors**: _Returns all visitors with the specified fields by the query_
  - **handleLogin**: _Return a token authorizing the user to call other resources_

```yaml
☝️ A Query retrieving a single object

{
  getAllUsers {
    id
    name
    lastName
    userName
    deviceIDs
    createdAt
    updatedAt
    updatedBy
    userRole
    hasRegisteredRole
    dateOfBirth
    email
  }
}

✌️ A Query retrieving multiple object

{
  getAllFiles {
    id
    ownerId
    fileType
    fileData
    fileName
    createdAt
  }

  getAllUsers {
    id
    name
    lastName
    email
  }
}
```


Mutations + Examples:
  - **createUser**: _Creates a new UserModel and saves it to the database._

```yaml
mutation($payload: UserPayload!) {
  createUser(payload: $payload) {
    id
    name
    lastName
    userName
    deviceIDs
    createdAt
    updatedAt
    updatedBy
    userRole
    hasRegisteredRole
    dateOfBirth
    email
  }
}
```

## Challenges
Here's a breakdown of some of the challeneges to implement on the Graphiti + Vapor server-side app:

1) **File Upload**
   - Set up the project to serve files uploaded to the service
  
2) **APN Integration**
   - Integrate Apple Push Notifications
  
3) **Live Activities**
   - Integrate Apple's Live Activities APIs and enable Dynamic Island on iOS
  
4) **Forgot Password Flow**
   - Integrate a flow to reset a user's lost/forgotten password
  
5) **Sign In with Apple Flow**
   - Integrate Sign in with Apple
