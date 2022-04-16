const db = require("../../db")
module.exports = (req, res) => {
    const data = db.getData("/messages")
    if (!req.params.id) {
        res.status(200).json(data) // if no specific message, just show all messages
        return
    }
    const message = data.find(msg => msg.id == req.params.id)
    if (!message) {
        res.status(404).json({ error: "message was not found with that id" })
        return
    }
    res.status(200).json(message)
}