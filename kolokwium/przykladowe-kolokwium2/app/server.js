const express = require("express");
const redis = require("redis");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const dotenv = require("dotenv");

const Task = require("./taskModel");

dotenv.config({ path: "./config.env" });

mongoose.set("strictQuery", false);

mongoose
  .connect(process.env.MONGODB_URI, {
    useNewUrlParser: true,
  })
  .then((con) => {
    console.log("DB connection successful!");
  });

const app = express();

let redisClient;

(async () => {
  redisClient = redis.createClient({
    url: `redis://${process.env.REDIS_HOST}:${process.env.REDIS_PORT}`,
  });

  redisClient.on("error", (error) => console.error(`Error : ${error}`));

  await redisClient.connect();

  console.log("Connected to Redis");
})();

app.use(express.static("public"));
app.use(bodyParser.json());

app.get("/tasks", async (req, res) => {
  const result = await Task.find().limit(20);

  res.status(200).json({
    status: "success",
    data: {
      tasks: result,
    },
  });
});

app.post("/tasks", async (req, res) => {
  const { title } = req.body;

  if (!title) {
    return res.status(400).json({
      status: "fail",
      message: "Title is required",
    });
  }

  const task = await Task.create({ title });

  res.status(201).json({
    status: "success",
    data: {
      task,
    },
  });
});

app.put("/tasks/:id", async (req, res) => {
  const { status } = req.body;
  const id = req.params.id;

  if (!status) {
    return res.status(400).json({
      status: "fail",
      message: "Status is required",
    });
  }

  const task = await Task.findByIdAndUpdate(id, { status }, { new: false });

  if (!task) {
    return res.status(404).json({
      status: "fail",
      message: "No task found with that ID",
    });
  }

  redisClient
    .incr("updatedTasks", (err, count) => {})
    .then((result) => {
      res.status(200).json({
        status: "success",
        data: {
          task,
          updatedTaskCount: result,
        },
      });
    })
    .catch((err) => {
      res.status(500).json({
        status: "fail",
        message: err.message,
      });
    });
});

app.listen(3000, () => {
  console.log("Listening on port 3000!");
});
