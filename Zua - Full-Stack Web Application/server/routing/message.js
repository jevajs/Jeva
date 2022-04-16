const create = require("./message/create");
const edit = require("./message/edit");
const view = require("./message/");
const router = require("express").Router();

router.post("/create", create) // /message/create
router.put("/:id", edit) // /message/:id
router.delete("/:id", edit) // /message/:id
router.get("/:id", view) // /message/:id
router.get("/", view) // /message/:id

module.exports = router