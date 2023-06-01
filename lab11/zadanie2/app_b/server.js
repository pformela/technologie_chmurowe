const express = require("express");
const mongoose = require("mongoose");

const Restaurant = require("./restaurantModel");

mongoose.set("strictQuery", false);

mongoose
  .connect("mongodb://mongodb-service:27017/zadanie2", {
    useNewUrlParser: true,
  })
  .then((con) => {
    console.log("DB connection successful!");
  });

const app = express();

app.get("/", async (req, res) => {
  const result = await Restaurant.find().limit(5);

  res.status(200).send({
    message: "Hello from app_b",
    data: result,
  });
});

app.listen(3000, () => {
  console.log("Listening on port 3000");
});
