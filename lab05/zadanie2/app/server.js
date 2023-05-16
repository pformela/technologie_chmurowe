const http = require("http");

const server = http.createServer((req, res) => {
  res.setHeader("Content-Type", "text/plain");
  res.end("Zadanie 2 Lab05");
});

server.listen(8080, () => {
  console.log("Server running on port 8080");
});
