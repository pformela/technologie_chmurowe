const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.status(200).json({
    time: new Date().toTimeString().split(" ")[0],
    date: new Date().toDateString(),
  });
});

const server = app.listen(8080, () => {
  console.log("Server started on port 8080");
});
