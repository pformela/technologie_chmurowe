const express = require("express");
const dotenv = require("dotenv");
const mongoose = require("mongoose");
const Restaurant = require("./restaurantModel");

dotenv.config({ path: "./config.env" });

mongoose.set("strictQuery", false);

mongoose
  .connect(process.env.MONGODB_URI, {
    useNewUrlParser: true,
  })
  .then((con) => {
    // console.log(con.connections);
    console.log("DB connection successful!");
  });

const app = express();

app.get("/", async (req, res) => {
  const result = await Restaurant.find().limit(5);

  res.status(200).json({
    status: "success",
    data: {
      restaurants: result,
    },
  });
});

const server = app.listen(8080, () => {
  console.log("Server started on port 8080");
});
