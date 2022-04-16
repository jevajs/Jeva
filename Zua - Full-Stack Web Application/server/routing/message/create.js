const db = require("../../db")
const crypto = require("crypto")
module.exports = (req, res) => {
    const author = req.query.author
    const content = req.body.content
    //console.log(req.body)
    if (!author || !content) {
        res.status(400).json({ error: "Please provide content and an author name" }) // 400 - Bad request
        return
    }
    const hash = crypto.createHash("sha256").update(req.ip+Date.now().toString()+author).digest('hex')
    let msg = {
        timestamp: new Date().toLocaleString(),
        ip: req.ip,
        id: hash,
        edited: false,
        author,
        content,
    }
    console.log(`${author} has created a post.`)
    db.push("/messages[]",msg,true)
    res.status(200).json(msg)
}
