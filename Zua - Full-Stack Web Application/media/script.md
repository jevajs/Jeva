## Introduction

Hello everyone, Zua here, today I will be explaining how to build a full-stack web application from scratch using nodejs and html. In this project, we will be using the Express Js library along with the axios http library. It will encompass everything from backend routing to frontend API integration. We will also be focusing on CRUD (Create, Read, Update, and Delete) functionality with our REST API. All in all, this messenger app project will demonstrate how REST APIs are built and used, and how they are integral to the internet’s interconnectedness as a whole.


1. So how would we build a project like this? For starters, let's understand how data flows through the web. Suppose we have a client. Now, this client can be your phone or your computer, but let's say the client wants to access a website or a service, like Google. The client have will send a request to the server that hosts the service in question. The server in response to the initial request then sends back a response that contains data the client will find useful.

2. Now let's apply this concept to our project. The client represents our frontend HTML website and the server represents our backend API webserver. Suppose a client wants to get all messages posted by users of this application. The client will send a GET request to the server, and the server will send back a response containing the data for all messages.


## Explanation (Intermissions)

1. Now that the backend is complete, let's review what we just created. Our `express` API webserver listens for requests from clients. For testing purposes, our client right now is `postman`. The Postman client will initiate a request to the API webserver we just created. The API will then send us back a response based on what the user initially requested. Hopefully now, it's all starting to come together. Now, let's build a user-friendly interface that allows us to interact with our new API. 

___

## Procedure

### Frontend:

* Begin Design UI - `index.html` 
```html
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Messenger App</title>
    <style>
        #footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
        }
    </style>
    <!-- Bootstrap CSS Stylesheet-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Bootstrap Javascript-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <!-- Axios HTTP Library -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>

<body>
    <div class="container">
        <!-- Title header -->
        <h1>Messenger App</h1> 
        <hr />
        <!-- Bootstrap Accordion https://getbootstrap.com/docs/5.0/components/accordion START -->
        <div class="accordion" id="accordionExample" style="margin-bottom: 25px">
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        Authors
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                    data-bs-parent="#accordionExample">
                    <div id="authors" class="accordion-body">
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap Accordion END -->
        <!-- Card container (Houses all cards/messages) START -->
        <div class="row" id="cards" style="margin-bottom: 50px">
        </div>
        <!-- Footer (sticks to the bottom of the screen) -->
        <div id="footer">
            <button style="width: 100%" class="btn btn-primary">Create</button>
        </div>

    </div>
    <!-- External custom scripts -->
    <script src="API.js"></script>
    <script src="utils.js"></script>
    <script src="actions.js"></script>
    <script>
        // More code will be here
    </script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
        crossorigin="anonymous"></script>
</body>
</html>            
```
____

* Write API Wrapper - `API.js`
```js
    var API = { // this object acts as our API Wrapper. It works standalone! (with the exception of the axios lib)
    api: axios.create({ baseURL: "http://localhost:5000/api" }),
    getMessage: function (id) {
        return this.api.get(`/message/${id}`)
            .then(response => response.data)
    },
    getAllMessages: function () {
        return this.api.get("/message/")
            .then(response => response.data)
    },
    editMessage: function (author, content, id) {
        return this.api.put(`/message/${id}?author=${author}`,
            new URLSearchParams({ content }))
            .then(response => response.data)
    },
    deleteMessage: function (author, id) {
        return this.api.delete(`/message/${id}?author=${author}`)
            .then(response => response.data)
    },
    createMessage: function (author, content) {
        return this.api.post(`/message/create?author=${author}`,
            new URLSearchParams({ content }))
            .then(response => response.data)
    },
    getAllAuthors: function () {
        return this.api.get(`/author/`)
            .then(response => response.data)
    },
    getMessagesByAuthor: function (author) {
        return this.api.get(`/author/${author}`)
            .then(response => response.data)
    },
};
```

___

* Start utility helper script - `utils.js`
```js
var utils = {
    /**
    * @description convert an object to a meaningful output that users can read 
    * @param {Object} o - array of prompts to ask the user
    * @returns {String} easy to understand string output 
    */
    objToString: (o) => {
        let final = ''
        for (const [key, value] of Object.entries(o)) {
            final += `${key}: ${value}\n`
        }
        return final
    },
    /**
    * @description prompt the user with multiple prompts 
    * @param {Array} prompts - array of prompts to ask the user
    * @returns {Array} list of the user's responses
    */
    promptUser: (prompts) => prompts.map(p => prompt(p))
};
```

___

* Write actions script - `actions.js`

```js
// actions get executed based on user intractability
var actions = {
    createMessage: function () { // gets executed when the create message button gets pressed
        const inputs = utils.promptUser(["Name: ", "Message: "])
        if (inputs.every(e => e)) { // checks if all fields were filled in with some sort of content
            API.createMessage(...inputs).then(response => {
                alert("Created message successfully")
                this.refreshMessages()
            }).catch(alert)
        } else {
            alert("Please enter the fields correctly")
        }
    },
    refreshMessages: function (author) { // updates ui with all current messages & authors (if no author provided)
        if (!author) {
            API.getAllAuthors().then((response) => {
                document.querySelector("#authors").innerHTML =
                    "Filter by: <button class='btn btn-primary' onclick='actions.refreshMessages()'>Everyone</button>&nbsp;"
                response.map(author => {
                    document.querySelector("#authors").innerHTML +=
                        `<button class="btn btn-secondary" onclick='actions.refreshMessages("${author}")'>${author}</button>&nbsp;`
                })
            }).catch(alert)
        }
        API[author ? "getMessagesByAuthor" : "getAllMessages"](author).then(response => {
            document.querySelector("#cards").innerHTML = "" // reset before appending
            response.forEach(msg => {
                document.querySelector("#cards").innerHTML += utils.card(msg)
            })
        }).catch(alert)
    },
    moreInfo: function (id) {
        API.getMessage(id).then((data) => { alert(utils.objToString(data)) })
            .catch(alert)
    },
    editMessage: function (id) {
        API.editMessage(...utils.promptUser(["Name: ", "Edited message: "]), id) // spread syntax
            .then((response) => {
                this.refreshMessages()
                alert("Edited message.")
            }).catch(alert)
    },
    deleteMessage: function (id) {
        API.deleteMessage(...utils.promptUser(["Name: "]), id)
            .then((response) => {
                this.refreshMessages()
                alert("Deleted message.")
            }).catch(alert)
    }
};
```

___

* Add render card function - `utils.js`
```diff
var utils = {
    /**
    * @description convert an object to a meaningful output that users can read 
    * @param {Object} o - array of prompts to ask the user
    * @returns {String} easy to understand string output 
    */
    objToString: (o) => {
        let final = ''
        for (const [key, value] of Object.entries(o)) {
            final += `${key}: ${value}\n`
        }
        return final
    },
    /**
    * @description prompt the user with multiple prompts 
    * @param {Array} prompts - array of prompts to ask the user
    * @returns {Array} list of the user's responses
    */
    promptUser: (prompts) => prompts.map(p => prompt(p)),
+    card: ({author, content, timestamp, edited, id}) => {
+        return `
+        <div class="col">
+            <div class="card">
+                <div class="card-body">
+                    <h3 class="card-title"><b>${author}</b></h5>
+                    <p class="card-text fs-2">${content}</p>
+                    <p class="text-secondary fs-6">${timestamp} ${edited ? "<i>(edited)</i>" : ''}</p>
+                    <button onclick="actions.moreInfo('${id}')" class="btn btn-info">More Info</button>
+                    <button onclick="actions.editMessage('${id}')" class="btn btn-warning">
+                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
+                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
+                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
+                    </svg>
+                    </button>
+                    <button onclick="actions.deleteMessage('${id}')" class="btn btn-danger">
+                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
+                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
+                    </svg>
+                    </button>
+                </div>
+            </div>
+            <br/>
+        </div>
+        `
+    }
};
```

___

* Add onload code - `index.html`
```diff
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Messenger App</title>
    <style>
        #footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
        }
    </style>
    <!-- Bootstrap CSS Stylesheet-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Bootstrap Javascript-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <!-- Axios HTTP Library -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>

<body>
    <div class="container">
        <!-- Title header -->
        <h1>Messenger App</h1> 
        <hr />
        <!-- Bootstrap Accordion https://getbootstrap.com/docs/5.0/components/accordion START -->
        <div class="accordion" id="accordionExample" style="margin-bottom: 25px">
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        Authors
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                    data-bs-parent="#accordionExample">
                    <div id="authors" class="accordion-body">
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap Accordion END -->
        <!-- Card container (Houses all cards/messages) START -->
        <div class="row" id="cards" style="margin-bottom: 50px">
        </div>
        <!-- Footer (sticks to the bottom of the screen) -->
        <div id="footer">
            <button style="width: 100%" class="btn btn-primary">Create</button>
        </div>

    </div>
    <!-- External custom scripts -->
    <script src="API.js"></script>
    <script src="utils.js"></script>
    <script src="actions.js"></script>
    <script>
-       // More code will be here
+       actions.refreshMessages()
    </script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ"
        crossorigin="anonymous"></script>
</body>
</html>            
```
