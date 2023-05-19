const express = require("express");
const mongoose = require("mongoose");
const fs = require("fs");

const app = express();

const User = require("./userModel");

mongoose.set("strictQuery", false);

mongoose
  .connect(process.env.MONGODB_URI, {
    useNewUrlParser: true,
  })
  .then((con) => {
    console.log("DB connection successful!");
  });

fs.readFile("data.json", "utf8", (err, data) => {
  if (err) {
    console.error("Error reading file:", err);
    return;
  }

  const inputData = JSON.parse(data);

  User.create(inputData.data)
    .then(() => {
      console.log("Data loaded successfully");
    })
    .catch((error) => {
      console.error("Error loading data:", error);
      mongoose.disconnect();
    });
});

app.get("/users", (req, res) => {
  User.find()
    .then((users) => {
      res.status(200).send({
        status: "success",
        data: users,
      });
    })
    .catch((error) => {
      res.status(500).send({
        status: "error",
        message: error.message,
      });
    });
});

app.delete("/users/:id", (req, res) => {
  User.findByIdAndDelete(req.params.id)
    .then(() => {
      res.status(204).send({
        status: "success",
        data: null,
      });
    })
    .catch((error) => {
      res.status(500).send({
        status: "error",
        message: error.message,
      });
    });
});

app.listen(3000, () => {
  console.log("Server listening on port 3000");
});
