const router = require("express").Router();
const message = require("./message")
const author = require("./author")

router.use("/message", message)
router.use("/author", author)

module.exports = router