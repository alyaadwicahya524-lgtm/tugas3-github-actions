const http = require("http");

http
  .createServer((req, res) => {
    res.end("Hello DevSecOps!\n");
  })
  .listen(3000);
