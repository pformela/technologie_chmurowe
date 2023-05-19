const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  _id: String,
  name: String,
  email: String,
  age: Number,
});

const User = mongoose.model("User", userSchema);

module.exports = User;
