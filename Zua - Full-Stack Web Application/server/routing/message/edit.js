const db = require("../../db")

module.exports = (req, res) => {
    var data = db.getData("/messages")
    const message = data.find(msg => msg.id === req.params.id) // same logic as index.js
    if (!message) {
        res.status(404).json({ error: "message was not found with that id" })
        return
    }
    if ((req.ip === message.ip) && (req.query.author === message.author)) {
        // by having the same ip when initially posted, and the same author name,that's how we are going to authenticate
        switch (req.method) {
            case "PUT":
                if (req.body.content) {
                    for (let i = 0; i < data.length; i++) {
                        if (data[i].id === req.params.id) {
                            data[i].content = req.body.content // update content
                            data[i].timestamp = new Date().toLocaleString()
                            data[i].edited = true
                            console.log(`${message.author} has edited their post.`)
                            res.status(200).json(data[i])
                        }
                    }
                    db.push("/messages", data) // update db with new values
                    return
                } else {
                    res.status(400).json({ error: "please provide content to update with" }) // 400 - Bad request
                    return
                }
                break;
            case "DELETE":
                const objIndex = data.findIndex(msg => msg.id === req.params.id) // a bit redundant
                const deleted = data.splice(objIndex, 1)
                db.push("/messages", data)
                res.status(200).json(deleted)
                console.log(`${message.author} has deleted their post.`)
                break;
        }

    } else {
        res.status(401).json({ error: "You are not authenticated to perform this action " }) // 401 - Unauthorized
    }
}