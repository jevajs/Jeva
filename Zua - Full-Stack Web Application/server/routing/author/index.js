const db = require("../../db")
const data = db.getData("/messages")
module.exports = (req, res) => {
    if (!req.params.name) { // if no name specified, just sent all authors
        const authors = db.getData("/messages").map(msg => msg.author)
        res.status(200).json([...new Set(authors)]) // the set is there to remove duplicates
        return
    }
    const msgs = data.filter(msg => msg.author == req.params.name)
    if (msgs.length === 0) {
        res.status(404).json({ error: "no messages were not found from this author" })
        return
    }
    res.status(200).json(msgs)
}