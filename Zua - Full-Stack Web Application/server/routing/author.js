const router = require("express").Router()
const view = require("./author/")

router.get("/", view)
router.get("/:name", view)

module.exports = router