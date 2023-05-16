const express = require("express");
const app = express();
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const dotenv = require("dotenv");

const Restaurant = require("./restaurantModel");

dotenv.config({ path: "./config.env" });

mongoose.set("strictQuery", false);

mongoose
  .connect(process.env.MONGODB_URI, {
    useNewUrlParser: true,
  })
  .then((con) => {
    console.log("DB connection successful!");
  });

app.use(express.static("public"));
app.use(bodyParser.json());

app.get("/", async (req, res) => {
  const result = await Restaurant.find().limit(20);

  res.status(200).json({
    status: "success",
    data: {
      restaurants: result,
    },
  });
});

app.listen(8080, () => console.log("Listening on port 8080!"));
