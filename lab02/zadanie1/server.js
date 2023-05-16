const http = require("http");

const server = http.createServer((req, res) => {
  res.setHeader("Content-Type", "text/plain");
  res.end("Hello World!");
});

server.listen(8080, () => {
  console.log("Server running on port 8080");
});
