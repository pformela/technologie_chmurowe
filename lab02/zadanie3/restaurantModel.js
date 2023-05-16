const mongoose = require("mongoose");

const restaurantSchema = new mongoose.Schema({});

const Restaurant = mongoose.model("Restaurant", restaurantSchema);

module.exports = Restaurant;
