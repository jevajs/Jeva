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
                document.querySelector("#cards").innerHTML += maker.card(msg)
            })
        }).catch(alert)
    },
    moreInfo: function (id) {
        API.getMessage(id).then((data) => { alert(utils.objToString(data)) })
            .catch(alert)
    },
    editMessage: function (id) {
        API.editMessage(...utils.promptUser(["Name: ", "Edited message: "]), id)
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