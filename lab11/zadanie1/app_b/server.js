const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.status(200).send({
    message: "Hello from app_b",
  });
});

app.listen(4000, () => {
  console.log("Listening on port 4000");
});
