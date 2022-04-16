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