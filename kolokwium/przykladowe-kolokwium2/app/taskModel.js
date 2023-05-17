const mongoose = require("mongoose");

const taskSchema = new mongoose.Schema({
  title: {
    type: String,
    required: [true, "Title is required"],
  },
  status: {
    type: String,
    enum: ["open", "in progress", "done"],
    default: "open",
  },
});

const Task = mongoose.model("Task", taskSchema);

module.exports = Task;
