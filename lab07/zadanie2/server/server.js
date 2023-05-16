const express = require("express");
const app = express();
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const dotenv = require("dotenv");

const User = require("./userModel");

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

app.get("/users", async (req, res) => {
  const result = await User.find();

  res.status(200).json({
    status: "success",
    data: {
      users: result,
    },
  });
});

app.listen(3000, () => console.log("Listening on port 3000!"));
