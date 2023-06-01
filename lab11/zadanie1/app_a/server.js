const express = require("express");
const axios = require("axios");

const app = express();

app.get("/", (req, res) => {
  axios
    .get("http://microservice-b:4000/")
    .then((response) => {
      res.status(200).send({
        message: response.data,
      });
    })
    .catch((error) => {
      res.status(500).send({
        error: "Internal server error",
        message: error.message,
      });
    });
});

app.listen(3000, () => {
  console.log("Listening on port 3000");
});
