## Introduction

Hello everyone, Zua here, today I will be explaining how to build a full-stack web application from scratch using nodejs and html. In this project, we will be using the Express Js library along with the axios http library. It will encompass everything from backend routing to frontend API integration. We will also be focusing on CRUD (Create, Read, Update, and Delete) functionality with our REST API. All in all, this messenger app project will demonstrate how REST APIs are built and used, and how they are integral to the internet’s interconnectedness as a whole.


1. So how would we build a project like this? For starters, let's understand how data flows through the web. Suppose we have a client. Now, this client can be your phone or your computer, but let's say the client wants to access a website or a service, like Google. The client have will send a request to the server that hosts the service in question. The server in response to the initial request then sends back a response that contains data the client will find useful.

2. Now let's apply this concept to our project. The client represents our frontend HTML website and the server represents our backend API webserver. Suppose a client wants to get all messages posted by users of this application. The client will send a GET request to the server, and the server will send back a response containing the data for all messages.


## Explanation (Intermissions)

1. Now that the backend is complete, let's review what we just created. Our `express` API webserver listens for requests from clients. For testing purposes, our client right now is `postman`. The Postman client will initiate a request to the API webserver we just created. The API will then send us back a response based on what the user initially requested. Hopefully now, it's all starting to come together. Now, let's build a user-friendly interface that allows us to interact with our new API. 
